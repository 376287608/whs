package com.ufgov.whs.attachment.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest;

import com.ufgov.whs.approval.bean.ApprovalReport;

/**
 * 文件导入导出接口
 */
public interface IExportImportService {
	
	public List<ApprovalReport> upload(DefaultMultipartHttpServletRequest multiRequest) throws Exception;
	
	public String download(String ids) throws Exception;

}
