package com.ufgov.whs.attachment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest;

import com.ufgov.whs.approval.bean.ApprovalReport;
import com.ufgov.whs.attachment.bean.DocAddrInfo;
import com.ufgov.whs.attachment.service.IDocAddrInfoService;
import com.ufgov.whs.attachment.service.IExportImportService;

@Controller
@RequestMapping("/dataZip")
public class ExportImportController {

	@Autowired
	private IExportImportService exportImportService;
	
	@Autowired
	private IDocAddrInfoService docAddrInfoService ;
	
	/**
	 * 文件导出
	 */
	@RequestMapping(value = "/download", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> download(HttpServletRequest request, 
			HttpServletResponse response)throws Exception {
		Map<String, Object> map = new HashMap<String, Object>(2);
		map.put("msg", "导出失败");
		map.put("flag", "failure");
		String ids = request.getParameter("reportIds");
		try {			
			if (StringUtils.isNotBlank(ids)) {
				String zipLink = exportImportService.download(ids);
				//查出serverName
				List<DocAddrInfo> docAddrInfos = docAddrInfoService.getByWebAddr("WEBADDRESS");
				if(docAddrInfos!=null && docAddrInfos.size()>0){
					String serverName = docAddrInfos.get(0).getRealAddr();
					zipLink = request.getScheme()+"://"+serverName
							+ request.getContextPath() + "/"
							+ zipLink;
				}else{
					zipLink = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()
					+ request.getContextPath() + "/"
					+ zipLink;
				}
				System.out.println("修改后文件下载地址为："+zipLink);
				map.put("flag", "success");
				map.put("msg", "导出成功");
				map.put("zipUrl", zipLink);
			} else {
				throw new Exception("No valid id found!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("flag", "failure");
		}
		return map;
	}
	
	/**
	 * 文件导入
	 */
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	@ResponseBody  
	public Map<String, Object> upload(DefaultMultipartHttpServletRequest multiRequest,
			HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>(2);
		try{			
			List<ApprovalReport> list = exportImportService.upload(multiRequest);
			map.put("lar", list);
			map.put("flag", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("flag", "failure");
		}
		return map;
	}
}
