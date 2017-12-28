package com.ufgov.whs.attachment.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest;

import com.google.gson.Gson;
import com.ufgov.whs.attachment.bean.DocAddrInfo;
import com.ufgov.whs.attachment.service.IAttachmentService;
import com.ufgov.whs.attachment.service.IDocAddrInfoService;
import com.ufgov.whs.common.utils.FileUtils;
import com.ufgov.whs.system.utils.UserUtil;



/**
 * 附件服务控制层
 */
@Controller
@RequestMapping("/attachment")
public class AttachmentController {
	
	@Autowired
	private IAttachmentService attachmentService;//附件服务
		
	@Autowired
	private IDocAddrInfoService docAddrInfoService ;
	/**
	 * 附件上传
	 * @param multiRequest
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/upload", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody  
	public String upload(
			DefaultMultipartHttpServletRequest multiRequest,
			HttpServletResponse response) throws Exception {
		//调用附件服务接口的附件上传方法
		// String realPath = FileUtils.getRootPath();
		// System.out.println(realPath);
		 List<Map<String, Object>> filelist = attachmentService.upload(multiRequest);
		 Gson gson = new Gson();
		 String info = gson.toJson(filelist);
		 return info;
	}
	
	/**
	 * 附件下载{附件id}
	 * @param request
	 * @param response
	 * @param docId
	 * @param isCut 0:截断2K文件  1：不截断文件
	 * @throws Exception
	 */
	@RequestMapping(value = "/down/{id}/{isCut}", method = RequestMethod.GET)
	public @ResponseBody void download(HttpServletRequest request,HttpServletResponse response,
			@PathVariable("id") String docId,@PathVariable("isCut") String isCut)throws Exception {
		attachmentService.download(docId, isCut, response);
	}
	
	/**
	 * 为了在线编辑而下载，目前就是为了加批注
	 * @return 
	 */
	@RequestMapping(value = "/downloadToEdit/{id}", method = RequestMethod.GET)
	public @ResponseBody Map<String, String> downloadForEdit(HttpServletRequest request,
			@PathVariable("id") String docId)throws Exception {
		Map<String, String> map = null;
		try {			
			if (StringUtils.isNotBlank(docId)) {
				map = attachmentService.downloadForEdit(docId);
				String host = "";
				//查出serverName
				List<DocAddrInfo> docAddrInfos = docAddrInfoService.getByWebAddr("WEBADDRESS");
				if(docAddrInfos!=null && docAddrInfos.size()>0){
					String serverName = docAddrInfos.get(0).getRealAddr();
					host = request.getScheme()+"://"+serverName;
				}else{
					host = request.getScheme() + "://" + request.getServerName() 
					+ ":" + request.getServerPort();
				}
				System.out.println("修改后host地址为："+host);
				map.put("flag", "success");
				map.put("host", host);
				map.put("userName", UserUtil.getCurrentBankUser().getName());
			} else {
				throw new Exception("No valid id found!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			if (map == null) {
				map = new HashMap<String, String>();
			}
			map.put("flag", "failure");
		}
		return map;
	}
	
	/**
	 * pdf编辑完成后保存到附件服务器
	 */
	@RequestMapping(value = "/savePdfAway", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> savePdfToRemote(String timeStr, String docId) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			this.attachmentService.savePdfToRemote(timeStr, docId);
			map.put("flag", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("flag", "failure");
		}
		return map;
	}

	/**
	 * 附件删除{附件id}
	 * @param multiRequest
	 * @param docId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete/{pk}/{type}", method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> delete(HttpServletRequest request,
			@PathVariable("pk") String docId,@PathVariable("type") String type) throws Exception {
		//调用附件服务接口的附件删除方法
		Map<String,Object> info = new HashMap<String, Object>();
		info.put("msg", "删除失败");
		info.put("success","false");
		String del = attachmentService.delete(docId,type);
		info.put("msg", del);
		if(del.equals("删除成功")){
			info.put("success","true");	
		}
		return info;
	}
	
	/**
	 * 附件审核通过否
	 * @param multiRequest
	 * @param docId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/verify/{pk}/{result}", method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> verify(HttpServletRequest request,
			@PathVariable("pk") String docId,@PathVariable("result") String result) throws Exception {
		Map<String,Object> info = new HashMap<String, Object>();
		info.put("msg", "操作失败");
		info.put("success","false");
		String message = attachmentService.verify(docId, result);
		if(message.equals("操作成功")){
			info.put("msg",message);
			info.put("success","true");
		}
		return info;
	}
}
