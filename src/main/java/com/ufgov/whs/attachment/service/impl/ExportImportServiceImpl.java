package com.ufgov.whs.attachment.service.impl;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest;

import com.ufgov.whs.approval.bean.ApprovalReport;
import com.ufgov.whs.approval.bean.ReportAttachment;
import com.ufgov.whs.approval.dao.ApprovalReportDao;
import com.ufgov.whs.approval.dao.ReportAttachmentDao;
import com.ufgov.whs.attachment.bean.DocAddrInfo;
import com.ufgov.whs.attachment.bean.HasDoc;
import com.ufgov.whs.attachment.dao.DocAddrInfoDao;
import com.ufgov.whs.attachment.dao.HasDocDao;
import com.ufgov.whs.attachment.service.IExportImportService;
import com.ufgov.whs.common.dao.PublicDao;
import com.ufgov.whs.common.utils.ConfigReader;
import com.ufgov.whs.common.utils.FileUtils;
import com.ufgov.whs.common.utils.SerializeUtils;
import com.ufgov.whs.common.utils.SqlUtils;
import com.ufgov.whs.common.utils.ZipUtil;
import com.ufgov.whs.system.utils.StatuConstant;
import com.ufgov.whs.system.utils.SysConstant;
import com.ufgov.whs.system.utils.UserUtil;

@Service
public class ExportImportServiceImpl implements IExportImportService {
	
	@Autowired
	private ApprovalReportDao approvalReportDao;
	@Autowired
	private ReportAttachmentDao reportAttachmentDao;
	@Autowired
	private HasDocDao hasDocDao;
	@Autowired
	private DocAddrInfoDao docAddrInfoDao;
	@Autowired
	private PublicDao publicDao;

	@Override
	@Transactional(readOnly = false)
	public List<ApprovalReport> upload(DefaultMultipartHttpServletRequest multiRequest) 
			throws Exception {
		//第一步，把上传的文件保存到本地
		Iterator<String> iter = multiRequest.getFileNames();
		List<ApprovalReport> imported = new LinkedList<ApprovalReport>();
		while (iter.hasNext()) {
			String fileName = iter.next();
			List<MultipartFile> files = multiRequest.getFiles(fileName);
			for (MultipartFile file : files) {
				InputStream in = null;
				OutputStream out = null;
				//String t = Thread.currentThread().getContextClassLoader().getResource("").getPath();
				String t = FileUtils.getRootPath();
				String tpath = ConfigReader.getIns().getProperties("appName");
				//String delDir = t.substring(0, t.indexOf("WEB-INF")) 
				//		+ "static" + File.separator + "zTemp" + File.separator;
				String delDir = t + File.separator  + "static" + File.separator + "zTemp" + File.separator;
				String onlyFileName = file.getOriginalFilename().substring(0, 
						file.getOriginalFilename().indexOf("."));
				delDir += onlyFileName + File.separator;
				System.out.println("数据导入：本地路径为"+delDir);
				//delDir: WebRoot/static/zTemp/#{zipFileName}/
				File localFile = new File(delDir + file.getOriginalFilename());
				try {
					in = new BufferedInputStream(file.getInputStream());
					out = new FileOutputStream(FileUtils.generateFile(localFile, true));
					byte[] buffer = new byte[1024 * 1024 * 4];
					int len = 0;
					while ((len = in.read(buffer, 0, buffer.length)) != -1) {
						out.write(buffer, 0, len);
					}
					out.flush(); 
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						if (out != null) {
							out.close();
						}
						if (in != null) {
							in.close();
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				//第二步，解压文件，反序列化对象，把附件转储
				if (localFile != null && localFile.exists()) {
					ZipUtil.unzipFile(localFile, delDir);
					//反序列化delDir/objs/下的所有对象文件
					List<File> fileList = FileUtils.getAllFilesFromDir(
							FileUtils.generateDir(delDir + "objs", false));
					List<Object> objs = SerializeUtils.getObjectFromFile(fileList);
					List<ApprovalReport> lar = new LinkedList<ApprovalReport>();
					List<ApprovalReport> unlar = new LinkedList<ApprovalReport>();
					List<ReportAttachment> lra = new LinkedList<ReportAttachment>();
					List<HasDoc> lhd = new LinkedList<HasDoc>();
					if (objs != null && objs.size() > 0) {
						for (Object obj : objs) {
							if (obj instanceof ApprovalReport) {
								lar.add((ApprovalReport) obj);
							} else if (obj instanceof ReportAttachment) {
								lra.add((ReportAttachment) obj);
							} else if (obj instanceof HasDoc) {
								lhd.add((HasDoc) obj);
							}
						}
					}
					//区分需导入和不需导入的数据
					List<String> larId = new ArrayList<String>(lar.size());
					if (lar.size() > 0) {
						for (ApprovalReport ar : lar) {
							larId.add(ar.getId());
						}
						unlar.addAll(approvalReportDao.findSomeByIds(larId));
					}
					Map<String, List<ApprovalReport>> map = getToBeHandled(lar, unlar);
					List<ApprovalReport> insert = map.get("insert");
					List<ApprovalReport> update = map.get("update");
					SqlUtils.setBusinessVerifyCode(insert, approvalReportDao, "0");
					lar = new LinkedList<ApprovalReport>();
					lar.addAll(insert);
					lar.addAll(update);
					Map<String, Object> map1 = getRAsAndHDs(lar, lra, lhd);
					lra = (List<ReportAttachment>) map1.get("lra");
					lhd = (List<HasDoc>) map1.get("lhd");
					Date now = new Date();
					for (ApprovalReport ar : lar) {
						ar.setReportState(StatuConstant.REPORTSTATU_DSP);
						ar.setStatuBank(StatuConstant.REPORTSTATU_DSP);
					}
					this.approvalReportDao.save(lar);
					this.reportAttachmentDao.save(lra);
					this.hasDocDao.save(lhd);
					imported.addAll(lar);
					//把delDir/attachment下的文件转储到附件服务器
					String attachmentDir = delDir + "attachment" + File.separator;
					List<File> localFileList = FileUtils.getAllFilesFromDir(
							FileUtils.generateDir(attachmentDir, false));
					if (localFileList.size() > 0) {
						//DocAddrInfo dai = docAddrInfoDao.findOne(SysConstant.LOGICADDR);
						for (File f : localFileList) {
							String fFullName = f.getAbsolutePath();
							for (HasDoc hd : lhd) {
								if (fFullName.contains(hd.getDocName()) 
										&& inSameDir(fFullName, hd.getSaveAddr())) {									
									FileUtils.pushLocalFileToRemote(
											FileUtils.getRootPath(tpath)+File.separator + fFullName.substring(
													fFullName.indexOf("attachment") + 11, fFullName.length()), 
											fFullName);
								}
							}
						}
					}
				}
				//最后，删除过期文件目录，如果上边发生异常，如sql执行错误，则不会执行删除，留存以备查看原因
				FileUtils.deleteAllFiles(new File(delDir), true);
			}
		}
		return imported;
	}
	
	private static boolean inSameDir(String fFullName, String saveAddr) {
		if (fFullName.contains(saveAddr)) {
			return true;
		} else {
			fFullName = fFullName.replace("\\", "").replace("/", "");
			saveAddr = saveAddr.replace("\\", "").replace("/", "");
			if (fFullName.contains(saveAddr)) {
				return true;
			} else {
				return false;
			}
		}
	}

	/**
	 * 根据新的lar筛选有效的ReportAttachment和HasDoc
	 * @param lar
	 * @param lra
	 * @param lhd
	 * @return
	 */
	private Map<String, Object> getRAsAndHDs(List<ApprovalReport> lar, 
			List<ReportAttachment> lra,	List<HasDoc> lhd) {
		Map<String, Object> result = new HashMap<String, Object>(2);
		List<ReportAttachment> lran = new LinkedList<ReportAttachment>();
		List<HasDoc> lhdn = new LinkedList<HasDoc>();
		for (ApprovalReport ar : lar) {
			for (ReportAttachment ra : lra) {
				if (ra.getFormId().equals(ar.getId())) {
					lran.add(ra);
				}
			}
		}
		result.put("lra", lran);
		for (ReportAttachment ra : lran) {
			for (HasDoc hd : lhd) {
				if (hd.getId().equals(ra.getDocId())) {
					lhdn.add(hd);
				}
			}
		}
		result.put("lhd", lhdn);
		return result;
	}

	/**
	 * 挑选出lar中需要插入的新数据和已经插入过有businessVerifyCode但是未开始流程的需要更新的数据
	 * @param lar
	 * @param unlar
	 * @return
	 */
	private Map<String, List<ApprovalReport>> getToBeHandled(List<ApprovalReport> lar, List<ApprovalReport> unlar) {
		Map<String, List<ApprovalReport>> result = new HashMap<String, List<ApprovalReport>>(2);
		List<ApprovalReport> insert = new LinkedList<ApprovalReport>();
		List<ApprovalReport> update = new LinkedList<ApprovalReport>();
		boolean flag = false;
		for (ApprovalReport a : lar) {
			flag = false;
			for (ApprovalReport b : unlar) {
				if (a.getId().equals(b.getId())) {
					if (b.getProcessId2() == null) {
						a.setBusinessVerifyCode(b.getBusinessVerifyCode());
						update.add(a);
					}
					flag = true;
					break;
				}
			}
			if (!flag) {
				insert.add(a);
			}
		}
		result.put("insert", insert);
		result.put("update", update);
		return result;
	}

	@Override
	public String download(String ids) throws Exception {
		//第一步，把数据库中数据对象序列化
		//获取所有数据
		String[] arr = ids.split(",");
		List<String> lids = new LinkedList<String>();
		if (arr != null && arr.length > 0) {
			for (String id : arr) {
				lids.add(id);
			}
		}
		List<ApprovalReport> lar = approvalReportDao.findSomeByIds(lids);
		if (lar == null || lar.size() == 0) {
			throw new Exception("no ApprovalReport object found");
		}
		List<ReportAttachment> lra = reportAttachmentDao.findSomeByIds(lids);
		List<HasDoc> lhd = null;
		if (lra != null && lra.size() > 0) {
			Set<String> sra = new LinkedHashSet<String>();
			for (ReportAttachment ra : lra) {
				String docId = ra.getDocId();
				if (docId != null) {
					sra.add(docId);
				}
			}
			List<String> ldi = new ArrayList<String>(sra.size());
			ldi.addAll(sra);
			lhd = hasDocDao.findSomeByIds(ldi);
		}
		List<Object> list = new LinkedList<Object>();
		String cun = UserUtil.getCurrentUser().getLoginName();
		if (lar != null) {	
			for(ApprovalReport ar : lar) {
				ar.setReportState(StatuConstant.REPORTSTATU_SPZ);
				ar.setStatuCompany(StatuConstant.FORMSTATU_RECEIVE);
				ar.setStatuBank(StatuConstant.REPORTSTATU_SPZ);
				ar.setExportName(cun);
			}
			approvalReportDao.save(lar);
			list.addAll(lar);
		}
		if (lra != null) {
			list.addAll(lra);
		}
		if (lhd != null) {			
			list.addAll(lhd);
		}
		//当前时间字符串用于区分多用户操作
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String nowStr = sdf.format(new Date());
		//String t = Thread.currentThread().getContextClassLoader().getResource("").getPath();
		String tpath = ConfigReader.getIns().getProperties("appName");
		String t = FileUtils.getRootPath();
		//String delDir = t.substring(0, t.indexOf("WEB-INF")) 
		//		+ "static" + File.separator + "temp" + File.separator;
		String delDir = t + File.separator  + "static" + File.separator +"temp" + File.separator;
		//删除过期文件，只保留当天的
		FileUtils.deleteOutdateFolders(delDir, nowStr.substring(0, 8));
		t = delDir + nowStr + File.separator + "objs" + File.separator;
		System.out.println("数据导入：下载到本地路径为"+delDir);
		String pt = t.substring(0, t.indexOf("objs"));
		System.out.println("数据导入：pt本地路径为"+pt);
		//delDir: WebRoot/static/temp/
		//t: WebRoot/static/temp/{#nowStr}/objs/
		//pt: WebRoot/static/temp/{#nowStr}/
		//把对象序列化到指定目录
		SerializeUtils.serializeObjectToFile(list, FileUtils.generateDir(t, true));
		File ptF = new File(pt);
		//第二步，获取相关附件到本地，位置：WebRoot/static/temp/{#nowStr}/attachment/
		if (lhd != null && lhd.size() > 0) {			
			//DocAddrInfo dai = docAddrInfoDao.findOne(SysConstant.LOGICADDR);
			//if (dai != null) {
				for (HasDoc hd : lhd) {					
					FileUtils.getRemoteFilesToLocal(
							//getSharedFolderPath(dai) + hd.getSaveAddr() + hd.getDocName(), 
							FileUtils.getRootPath(tpath)+File.separator+ hd.getSaveAddr() + hd.getDocName(),
							pt + "attachment" + File.separator + hd.getSaveAddr() + hd.getDocName());
				}
		}
		//最后，把WebRoot/static/temp/{#nowStr}/下的attachment文件夹和dataInsert.sql打成zip包并返回请求路径
		String zipName = "formAttachments" + nowStr + ".zip";
		ZipUtil.zipFile(pt + "zip" + File.separator + zipName, 
				FileUtils.arrayToList(ptF.listFiles()));
		return "static" + File.separator + "temp" + File.separator + nowStr 
				+ File.separator + "zip" + File.separator + zipName;
	}

	/**
	 * 获取附件服务器目录
	 */
	public static String getSharedFolderPath(DocAddrInfo docAddr) {
		String realAddr = docAddr.getRealAddr().replace("\\\\", "")
				.replace("\\", "/");
		StringBuffer buf = new StringBuffer();
		buf.append("smb://");
		buf.append(realAddr + "/");
		return buf.toString();
	}
}
