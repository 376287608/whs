package com.ufgov.whs.attachment.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest;

/**
 * 附件服务接口
 */
public interface IAttachmentService {
	
	/**
	 * 附件上传
	 * @param multiRequest
	 * @return List<Map<String, Object>> 附件信息
	 * 原有方法返回(附件的id和原名称拼接的字符串，拼接格式为：id:srcName,id:srcName,id:srcName)
	 * @throws Exception
	 */
	public List<Map<String, Object>> upload(DefaultMultipartHttpServletRequest multiRequest) throws Exception;
	
	/**
	 * 附件下载
	 * @param docId
	 * @param isCut
	 * @return
	 */
	public void download(String docId, String isCut, HttpServletResponse response) throws Exception;
	
	/**
	 * 附件删除
	 * @param docId
	 * @return
	 * @throws Exception
	 */
	public String delete(String docId,String type) throws Exception;
	
	/**
	 * 附件审核
	 * @param docId
	 * @return
	 * @throws Exception
	 */
	public String verify(String docId,String result) throws Exception;

	/**
	 * 为了在线编辑而下载，目前就是为了加批注
	 */
	public Map<String, String> downloadForEdit(String docId);

	/**
	 * 把修改后的pdf保存到附件服务器
	 * @param timeStr 系统服务器暂存文件路径区分
	 * @param raId 
	 */
	public void savePdfToRemote(String timeStr, String docId);

}
