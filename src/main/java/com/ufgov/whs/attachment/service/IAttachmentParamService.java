package com.ufgov.whs.attachment.service;

import java.util.Map;

import com.ufgov.whs.attachment.bean.DocAddrInfo;

/**
 * 附件上传下载删除所需的基本参数服务接口
 */
public interface IAttachmentParamService {

	/**
	 * 获取附件上传下载删除所需的基本参数
	 * @return Map<String,String>
	 * @throws Exception 
	 */
	public Map<String, String> getAttachmentParam() throws Exception;
	
	/**
	 * 获取共享文件夹路径
	 * @param docAddr
	 * @return String
	 */
	public String getSharedFolderPath(DocAddrInfo docAddr) throws Exception;

	/**
	 * 获取文件存储的父目录
	 * @param customsCode 关区代码
	 * @return String
	 */
	public String getParentDirectory(String customCode) throws Exception;

	/**
	 * 获取域名和用户名
	 * @param userName 域名和用户名
	 * @return String[]
	 */
	public String[] getDomainNameAndUserName(String domainNameAndUserName) throws Exception;
	
	/**
	 * 获取附件上传下载删除所需的基本参数
	 * @return Map<String,String>
	 * @throws Exception 
	 */
	public String getParentDirectoryParam(String type) throws Exception;
	
	public Map<String, String> getAttachmentParam(String directory) throws Exception;
}
