package com.ufgov.whs.attachment.service.impl;

import java.io.File;
import java.io.FileNotFoundException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest;

import com.ufgov.whs.approval.bean.FormAttachment;
import com.ufgov.whs.approval.bean.ReportAttachment;
import com.ufgov.whs.approval.service.ApprovalFormService;
import com.ufgov.whs.approval.service.ApprovalReportService;
import com.ufgov.whs.approval.service.FormAttachmentService;
import com.ufgov.whs.approval.service.ReportAttachmentService;
import com.ufgov.whs.attachment.AttachmentUDDUtil;
import com.ufgov.whs.attachment.bean.DocAddrInfo;
import com.ufgov.whs.attachment.bean.HasDoc;
import com.ufgov.whs.attachment.service.IAttachmentParamService;
import com.ufgov.whs.attachment.service.IAttachmentService;
import com.ufgov.whs.attachment.service.IDocAddrInfoService;
import com.ufgov.whs.attachment.service.IHasDocService;
import com.ufgov.whs.common.utils.ConfigReader;
import com.ufgov.whs.common.utils.DateUtils;
import com.ufgov.whs.common.utils.FileUtils;
import com.ufgov.whs.common.utils.UUIDUtil;
import com.ufgov.whs.system.utils.SysConstant;

/**
 * 附件服务实现类
 */
@Service
public class AttachmentImpl implements IAttachmentService {
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private AttachmentUDDUtil attachmentUDDUtil;//附件上传下载删除
	
	@Autowired
	private IAttachmentParamService iAttachmentParamService;//附件基本参数接口
	
	@Autowired
	private IDocAddrInfoService iDocAddrInfoService;//附件存储元数据接口
	
	@Autowired
	private IHasDocService iHasDocService;//附件元数据接口
	
	@Autowired
	ReportAttachmentService reportAttachmentService;
	
	@Autowired
	ApprovalReportService approvalReportService;
	
	@Autowired
	FormAttachmentService formAttachmentService;
	
	@Autowired
	ApprovalFormService approvalFormService;
	
	@Override
	public List<Map<String, Object>> upload(DefaultMultipartHttpServletRequest multiRequest) throws Exception {
		//获取AttachmentUDDUtil类中，附件上传方法所需的参数
		//String type = multiRequest.getParameter("type");
		//String directory = iAttachmentParamService.getParentDirectoryParam(type);
		//Map<String, String> params = iAttachmentParamService.getAttachmentParam(directory);
		Map<String, String> params = iAttachmentParamService.getAttachmentParam(SysConstant.FILE_FILE);
		String sharedFolderPath = params.get("sharedFolderPath");
		String parentDirectory = params.get("parentDirectory");
		//String domianName = params.get("domianName");
		//String userName = params.get("userName");
		//String password = params.get("password");
		//调用AttachmentUDDUtil类中，附件上传的方法
		List<Map<String, Object>> list = attachmentUDDUtil.upload(sharedFolderPath, parentDirectory,multiRequest);
		
		//存储附件数据
		this.storageData(list);
		//数据返回TODO
		return list;
	}

	public void storageData(List<Map<String, Object>> list) {
		List<HasDoc> docList = new ArrayList<HasDoc>();
		//创建业务数据集合TODO
		for (Map<String, Object> file : list) {
			this.storageDataForDoc(file, docList);
			//业务数据集合，需要增加一个业务数据的集合作为参数，然后批量保存
			this.storageBusinessData(file);
		}
		//1.存储"附件元数据";
		iHasDocService.saveBatchHasDoc(docList);
		//2.存储"业务数据";
		//批量保存业务数据TODO
	}
	
	//存储附件元数据
	private void storageDataForDoc(Map<String, Object> map, List<HasDoc> docList){
		HasDoc doc = new HasDoc();
		doc.setId((String)map.get("fileId"));
		doc.setDocName((String)map.get("fileName"));
		doc.setDocSrcName((String)map.get("fileSrcName"));
		doc.setDocSize(new BigDecimal((Long)map.get("fileSize")));
		doc.setHostAddr((String)map.get("sharedFolderPath"));
		doc.setSaveAddr((String)map.get("parentDirectory"));
//		iHasDocService.saveHasDoc(doc);
		docList.add(doc);
	}
	
	//附件的业务数据存储
	private void storageBusinessData(Map<String, Object> map){
		//TODO
	}

	@Override
	public void download(String docId, String isCut, HttpServletResponse response) throws Exception{
		
		if (StringUtils.isBlank(docId)){
			logger.error("下载文件不存在！");
			throw new FileNotFoundException("下载文件不存在！");
		}
		//获取附件元数据
		HasDoc doc = iHasDocService.queryById(docId);
		if(null == doc){
			logger.error("下载文件对象不存在！");
			throw new FileNotFoundException("下载文件对象不存在！");
		}
		
		//获取AttachmentUDDUtil类中，下载附件方法所需的参数
		Map<String, String> params = iAttachmentParamService.getAttachmentParam();
		String sharedFolderPath = params.get("sharedFolderPath");
//		String parentDirectory = params.get("parentDirectory");
		String parentDirectory = doc.getSaveAddr();
		//String domianName = params.get("domianName");
		//String userName = params.get("userName");
		//String password = params.get("password");
				
		//调用AttachmentUDDUtil类中，附件下载的方法
		attachmentUDDUtil.download(sharedFolderPath, parentDirectory, doc.getDocName(), doc.getDocSrcName(), isCut, response);
	}

	@Override
	public String delete(String docId,String type) throws Exception {
		String message;
		if (StringUtils.isBlank(docId)){
			message="删除文件不存在";
			logger.error("删除文件不存在！");
			//throw new FileNotFoundException("删除文件不存在！");			
		}
		//获取附件元数据
		HasDoc doc = iHasDocService.queryById(docId);
		if(null == doc){
			message="删除文件对象不存在";
			logger.error("删除文件对象不存在！");
			return message;
			//throw new FileNotFoundException("删除文件对象不存在！");
		}
		//获取AttachmentUDDUtil类中，附件删除方法所需的参数
		Map<String, String> params = iAttachmentParamService.getAttachmentParam();
		String sharedFolderPath = params.get("sharedFolderPath");
		String parentDirectory = params.get("parentDirectory");
		//String domianName = params.get("domianName");
		//String userName = params.get("userName");
		//String password = params.get("password");
		if(parentDirectory==null){
			parentDirectory=doc.getSaveAddr();
		}
		
		//调用AttachmentUDDUtil类中，附件删除的方法
		message = attachmentUDDUtil.delete(sharedFolderPath, parentDirectory, doc.getDocName());
		
		//删除附件数据
		this.deleteData(docId,type);
		return message;
	}
	
	/**
	 * 删除附件数据
	 * @param doc
	 */
	private void deleteData(String docId,String type) {
		//1.删除"附件元数据"
		iHasDocService.delete(docId);
		//2.删除业务数据;
		this.deleteBusinessData(docId,type);
	}

	/**
	 * 删除附件的业务数据TODO
	 * @param docId
	 */
	private void deleteBusinessData(String docId,String type) {
		// TODO 
		if(type.equals("F")){
			Integer id = formAttachmentService.getIdByDocId(docId);
			if(id!=null){
				FormAttachment fa = formAttachmentService.getFormAttachmentByDocId(docId);
				String otherFlag = fa.getOtherFlag();
				Integer order = fa.getDisplayOrder();
				String formId = fa.getFormId();
				formAttachmentService.delete(id);
				if(otherFlag!=null&&!otherFlag.trim().equals("")&&order!=null){
					if(formId!=null && !formId.trim().equals("")){
						List<FormAttachment> falist = formAttachmentService.getAllOtherFlag(formId);
						if(falist!=null && falist.size()>0){
							for(FormAttachment f: falist){
								if(f.getDisplayOrder()!=null){
									Integer displayOrder = f.getDisplayOrder();
									if(displayOrder>order){
										f.setDisplayOrder(f.getDisplayOrder()-1);
										formAttachmentService.save(f);
									}
								}
							}
						}
					}
				}

			}
		}else if(type.equals("R")){
			Integer id = reportAttachmentService.getIdByDocId(docId);
			if(id!=null){
			    ReportAttachment fa = reportAttachmentService.getReportAttachmentByDocId(docId);
				String otherFlag = fa.getOtherFlag();
				Integer order = fa.getDisplayOrder();
				String formId = fa.getFormId();
				reportAttachmentService.delete(id);
				if(otherFlag!=null&&!otherFlag.trim().equals("")&&order!=null){
					if(formId!=null && !formId.trim().equals("")){
						List<ReportAttachment> falist = reportAttachmentService.getAllOtherFlag(formId);
						if(falist!=null && falist.size()>0){
							for(ReportAttachment f: falist){
								if(f.getDisplayOrder()!=null){
									Integer displayOrder = f.getDisplayOrder();
									if(displayOrder>order){
										f.setDisplayOrder(f.getDisplayOrder()-1);
										reportAttachmentService.save(f);
									}
								}
							}
						}
					}
				}			
			}
		}
	}

	@Override
	public String verify(String docId, String result) throws Exception {
		// TODO Auto-generated method stub		
		ReportAttachment ra = reportAttachmentService.getReportAttachmentByDocId(docId);
		if(ra!=null && ra.getScene()==1){
			if(ra.getDocType()!= null){
				ReportAttachment srcRa = reportAttachmentService.getOneReportAttachmentByIdAndDocTypeAndScene(ra.getFormId(), ra.getDocType(), "1","0");
				if(srcRa!=null){
					srcRa.setStatu(result);
					reportAttachmentService.save(srcRa);
				}
			}else if(ra.getOtherFlag()!= null){
				ReportAttachment srcRa = reportAttachmentService.getOneReportAttachmentByIdAndOtherTypeAndScene(ra.getFormId(), ra.getOtherFlag(), "1","0");
				if(srcRa!=null){
					srcRa.setStatu(result);
					reportAttachmentService.save(srcRa);
				}
			}
		}
		ra.setStatu(result);
		reportAttachmentService.save(ra);
		return "操作成功";
	}

	@Override
	public Map<String, String> downloadForEdit(String docId) {
		HasDoc hd = iHasDocService.queryById(docId);
		DocAddrInfo dai = iDocAddrInfoService.queryById(SysConstant.LOGICADDR);
		String nowStr = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
		String t = Thread.currentThread().getContextClassLoader().getResource("").getPath();
		String delDir = t.substring(0, t.indexOf("WEB-INF")) 
				+ "static" + File.separator + "annoTemp" + File.separator + nowStr + File.separator;
		//delDir: WebRoot/static/annoTemp/{#nowStr}/
		FileUtils.generateDir(delDir, true);
		String path = ConfigReader.getIns().getProperties("appName");
		if (hd != null) {
			FileUtils.getRemoteFilesToLocal(
					//ExportImportServiceImpl.getSharedFolderPath(dai) + hd.getSaveAddr() + hd.getDocName(),
					FileUtils.getRootPath(path)+File.separator+ hd.getSaveAddr() + hd.getDocName(),
					delDir + hd.getDocSrcName());
			Map<String, String> map = new HashMap<String, String>();
			map.put("fileName", hd.getDocSrcName());
			map.put("timeStr", nowStr);
			map.put("rPath", "static" + File.separator + "annoTemp");
			return map;
		}
		return null;
	}

	@Override
	public void savePdfToRemote(String timeStr, String docId) {
		String path = ConfigReader.getIns().getProperties("appName");
		String t = Thread.currentThread().getContextClassLoader().getResource("").getPath();
		String delDir = t.substring(0, t.indexOf("WEB-INF")) 
				+ "static" + File.separator + "annoTemp" + File.separator + timeStr + File.separator;
		File pdf = FileUtils.generateFile(delDir, false).listFiles()[0];
		ReportAttachment ra = this.reportAttachmentService.getReportAttachmentByDocId(docId);
		HasDoc hd = null;
		if (ra != null && ra.getScene() == 1 && ra.getDelFlag().equals("1")) {
			//批注版，直接覆盖
			hd = this.iHasDocService.queryById(docId);
		} else {
			//原版，新增批注版
			hd = new HasDoc();
			hd.setId(UUIDUtil.genUUID());
			hd.setDocName(hd.getId());
			hd.setDocSize(new BigDecimal(pdf.length()));
			String name = pdf.getName();
			String newName = name.substring(0, name.length() - 4) + "_批注.pdf";
			hd.setDocSrcName(newName);
			hd.setSaveAddr(FileUtils.genSaveFilePath(null, File.separator));
			
			ReportAttachment fa = new ReportAttachment();
			fa.setDocId(hd.getId());
			fa.setFormId(ra.getFormId());
			fa.setDocType(ra.getDocType());
			fa.setDocName(hd.getDocName());
			fa.setScene(1);
			fa.setCreateTime(DateUtils.getSysDate());
			fa.setFiletypeName(ra.getFiletypeName());
			fa.setDisplayOrder(ra.getDisplayOrder());
			fa.setOtherFlag(ra.getOtherFlag());
			fa.setCheckType(ra.getCheckType());
			fa.setIslegal(ra.getIslegal());
			fa.setStatu("1");
			fa.setDelFlag(ra.getDelFlag());
			ra = fa;
		}
		DocAddrInfo dai = this.iDocAddrInfoService.queryById(SysConstant.LOGICADDR);
		FileUtils.pushLocalFileToRemote(
				FileUtils.getRootPath(path)+File.separator + hd.getSaveAddr() + hd.getDocName(), 
				pdf.getAbsolutePath());
		this.iHasDocService.saveHasDoc(hd);
		this.reportAttachmentService.save(ra);
		//删除当天之前的文件夹
		FileUtils.deleteOutdateFolders(delDir, timeStr.substring(0, 8));
	}

}
