package com.ufgov.whs.attachment.service.impl;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.TimeZone;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ufgov.whs.attachment.bean.DocAddrInfo;
import com.ufgov.whs.attachment.service.IAttachmentParamService;
import com.ufgov.whs.attachment.service.IDocAddrInfoService;
import com.ufgov.whs.common.utils.ConfigReader;
import com.ufgov.whs.common.utils.FileUtils;
import com.ufgov.whs.system.utils.SysConstant;

/**
 * 附件上传下载删除基本参数服务实现类
 */
@Service
public class AttachmentParamImpl implements IAttachmentParamService{
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private IDocAddrInfoService iDocAddrInfoService;//附件存储元数据接口
	
	@Override
	public Map<String,String> getAttachmentParam() throws Exception{
		Map<String,String> params = new HashMap<String,String>();
		try{
			//1.共享文件夹路径
			//String logicAddr =SysConstant.LOGICADDR;//TODO从参数表获取，groupCode=003,cfgCode=smb;
//			String logicAddr = sysParamService.getParameter("003", "smb");
			//DocAddrInfo docAddr = iDocAddrInfoService.queryById(logicAddr);
			
			//String sharedFolderPath = this.getSharedFolderPath(docAddr);
			String path = ConfigReader.getIns().getProperties("appName");
			String sharedFolderPath = FileUtils.getRootPath(path);
			//2.存储文件的父目录
			//String parentDirectory = this.getParentDirectory(LoginUserService.getLoginCustomcode());
//			String parentDirectory = this.getParentDirectory(SysConstant.FILE_FILE);
			String parentDirectory = null;
			//3.域名
			//4.用户名
			//String[] domainNameAndUserName = this.getDomainNameAndUserName(docAddr.getUserName());
			//String username = docAddr.getUserName();
			//5.密码
			//String password = docAddr.getPwd();
			
			params.put("sharedFolderPath", sharedFolderPath);
			params.put("parentDirectory", parentDirectory);
			
			  System.out.println("getAttachmentParam():sharedFolderPath=="+params.get("sharedFolderPath")+":parentDirectory=="+params.get("parentDirectory"));
			//params.put("domainName", domainNameAndUserName[0]);
			//params.put("userName", domainNameAndUserName[1]);
			//params.put("userName", username);
			//params.put("password", password);
		}catch(Exception e){
			logger.error("获取附件上传下载删除所需的基本参数出错！" + e.getMessage());
			throw new Exception("获取附件上传下载删除所需的基本参数失败！");
		}
		return params;
	}
	
	@Override
	public Map<String,String> getAttachmentParam(String directory) throws Exception{
		Map<String,String> params = new HashMap<String,String>();
		try{
			//1.共享文件夹路径
			//String logicAddr =SysConstant.LOGICADDR;//TODO从参数表获取，groupCode=003,cfgCode=smb;
//			String logicAddr = sysParamService.getParameter("003", "smb");
			//DocAddrInfo docAddr = iDocAddrInfoService.queryById(logicAddr);
			
			//String sharedFolderPath = this.getSharedFolderPath(docAddr);
			String path = ConfigReader.getIns().getProperties("appName");
			String sharedFolderPath = FileUtils.getRootPath(path);
			//2.存储文件的父目录
			//String parentDirectory = this.getParentDirectory(LoginUserService.getLoginCustomcode());
			String parentDirectory = this.getParentDirectory(directory);
			//3.域名
			//4.用户名
			//String[] domainNameAndUserName = this.getDomainNameAndUserName(docAddr.getUserName());
			//String username = docAddr.getUserName();
			//5.密码
			//String password = docAddr.getPwd();
			
			params.put("sharedFolderPath", sharedFolderPath);
			params.put("parentDirectory", parentDirectory);
			
	        System.out.println("getAttachmentParam(String directory):sharedFolderPath=="+params.get("sharedFolderPath")+":parentDirectory=="+params.get("parentDirectory"));
			//params.put("domainName", domainNameAndUserName[0]);
			//params.put("userName", domainNameAndUserName[1]);
		//	params.put("userName", username);
		//	params.put("password", password);
		}catch(Exception e){
			logger.error("获取附件上传下载删除所需的基本参数出错！" + e.getMessage());
			throw new Exception("获取附件上传下载删除所需的基本参数失败！");
		}
		return params;
	}
	
	
	@Override
	public String getSharedFolderPath(DocAddrInfo docAddr) {
		String realAddr = docAddr.getRealAddr().replace("\\\\", "")
				.replace("\\", "/");
		StringBuffer buf = new StringBuffer();
		buf.append("smb://");
		buf.append(realAddr + "/");
		return buf.toString();
	}
	
	@Override
	public String getParentDirectory(String customCode) {
		String basePath = ConfigReader.getIns().getProperties("fileDir");
		//String seprator = "/";
		String seprator = File.separator;
		StringBuilder parentDirectory = new StringBuilder();
		parentDirectory.append(basePath);	
		parentDirectory.append(seprator);
		parentDirectory.append(customCode);
		parentDirectory.append(seprator);
		// 指定东八区，即北京时间
		Calendar cc = Calendar.getInstance(TimeZone.getTimeZone("GMT+8"));
		int year = cc.get(Calendar.YEAR);

		// 月份是从0开始计数的，所以此处进行加1
		int month = cc.get(Calendar.MONTH) + 1;
		int day = cc.get(Calendar.DAY_OF_MONTH);
		parentDirectory.append(year).append(seprator).append(month).append(seprator)
				.append(day).append(seprator);
		return parentDirectory.toString();
	}
	
	@Override
	public String[] getDomainNameAndUserName(String domainNameAndUserName){
		String[] domainAndUser = domainNameAndUserName.split("\\\\");
//		String domainName = "";
//		String userName = "";
//		if (domainAndUser.length > 1) {
//			domainName = domainAndUser[0];
//			userName = domainAndUser[1];
//		}
		return domainAndUser;
	}

	@Override
	public String getParentDirectoryParam(String type)
			throws Exception {
		// TODO Auto-generated method stub
		if(type!=null && type.equals("template")){
			return SysConstant.FILE_TEMPLATE;
		}else if(type!=null && type.equals("laws")){
			return SysConstant.FILE_FILE_LAWS;
		}else if(type!=null && type.equals("guides")){
			return SysConstant.FILE_FILE_GUIDES;
		}else if(type!=null && type.equals("register")){
			return SysConstant.FILE_REGISTER;
		}else if(type!=null && type.equals("business")){
			return SysConstant.FILE_BUSINESS;
		}
		return SysConstant.FILE_FILE;
	}
}
