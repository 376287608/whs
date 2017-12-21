package com.ufgov.whs.approval.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.ufgov.whs.approval.bean.ApprovalForm;
import com.ufgov.whs.approval.bean.Attachment;
import com.ufgov.whs.approval.service.ApprovalFormService;
import com.ufgov.whs.common.utils.DateUtils;
import com.ufgov.whs.message.service.MessageService;
import com.ufgov.whs.process.bean.Process;
import com.ufgov.whs.system.utils.StatuConstant;
import com.ufgov.whs.system.utils.UserUtil;

/**
 * 申请单操作controller
 * @author fucj
 * @date 2017年10月20日
 */
@Controller
@RequestMapping(value = "/formoperation")
public class FormOperationController{
	
	protected final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private ApprovalFormService approvalFormService ;
	
	@Autowired
	private MessageService messageService;
	
	/**
	 * 退回
	 * @return
	 */
	@RequestMapping(value="turnback",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> turnback(
			@RequestParam(value = "formId") String formId) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "退回失败");
		map.put("success", "false");
		try{
			String message = approvalFormService.turnback(formId);
			map.put("msg", message);
			map.put("success", "true");
		}catch(Exception e){
			logger.error("退回失败！"+e.getMessage(), e);
			throw new Exception("退回失败！"+e.getMessage(),e);
		}
		return map;
	}
	
	/**
	 * 获取流程列表
	 * @return
	 */
	@RequestMapping(value="getProcessList",method = RequestMethod.POST)
	public @ResponseBody  Map<String,Object> getProcessList(
			@RequestParam(value = "businessId") Integer businessId) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "获取流程列表失败");
		map.put("success", "false");
		List<Process> plist = approvalFormService.getProcessList(businessId);
		if(plist!=null && plist.size()>0){
			map.put("msg", "获取流程列表成功");
			map.put("success", "true");
			map.put("processList", plist);
		}
		return map;
	}
	
	/**
	 * 接收并启动流程
	 * @return
	 */
	@RequestMapping(value="receive",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> receive(
			@RequestParam(value = "formId") String formId,
			@RequestParam(value = "processId") Integer processId) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "接收失败");
		map.put("success", "false");
		try{
			String message = approvalFormService.recieve(formId,processId);
			map.put("msg", message);
			map.put("success", "true");
		}catch(Exception e){
			logger.error("接收并启动流程失败！"+e.getMessage(), e);
			throw new Exception("接收并启动流程失败！"+e.getMessage(),e);
		}
		return map;
	}

	/**
	 * 企业主动撤回
	 * @return
	 */
	@RequestMapping(value="withdraw",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> withdraw(
			@RequestParam(value = "formId") String formId) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "撤回失败");
		map.put("success", "false");
		try{
			String message = approvalFormService.withdraw(formId);
			map.put("msg", message);
			if(!message.equals("fail")){
				map.put("success", "true");
			}
		}catch(Exception e){
			logger.error("撤回失败！"+e.getMessage(), e);
			throw new Exception("撤回失败！"+e.getMessage(),e);
		}
		return map;
	}
	/**
	 * 企业提交
	 * @return
	 */
	@RequestMapping(value="submit",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> submit(
			   @RequestParam(value = "formId") String formId,
			   @RequestParam(value = "businessId") Integer businessId,
			   @RequestParam(value = "registerName") String registerName,
			   @RequestParam(value = "phone") String phone,
			   @RequestParam(value = "email") String email,
			   @RequestParam(value = "address") String address,
			   @RequestParam(value = "noticeGet") String noticeGet,
			   @RequestParam(value = "attachmentlist") String attachmentlist) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "提交失败");
		map.put("success", "false");
		try{
			Integer userId = UserUtil.getCurrentUser().getId();
			ObjectMapper objectMapper = new ObjectMapper();  
		    JavaType javaType = objectMapper.getTypeFactory().constructParametricType(List.class, Attachment.class);
		    List<Attachment> attachmentList = objectMapper.readValue(attachmentlist, javaType); 
		    String message = approvalFormService.submit(userId, formId,businessId, registerName, phone, email, address, noticeGet, attachmentList);
		    map.put("msg", message);
		    if(!message.equals("fail")){
		    	map.put("success", "true");
		    }
		}catch(Exception e){
			logger.error("提交失败！"+e.getMessage(), e);
			throw new Exception("提交失败！"+e.getMessage(),e);
		}
		return map;
	}
	
	/**
	 * 企业保存
	 * @return
	 */
	@RequestMapping(value="save",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> save(
		   @RequestParam(value = "formId") String formId,
		   @RequestParam(value = "businessId") Integer businessId,
		   @RequestParam(value = "registerName") String registerName,
		   @RequestParam(value = "phone") String phone,
		   @RequestParam(value = "email") String email,
		   @RequestParam(value = "address") String address,
		   @RequestParam(value = "noticeGet") String noticeGet,
		   @RequestParam(value = "attachmentlist") String attachmentlist
		) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", "false");
		map.put("msg","保存失败");
		try{
			Integer userId = UserUtil.getCurrentUser().getId();
			ObjectMapper objectMapper = new ObjectMapper();  
		    JavaType javaType = objectMapper.getTypeFactory().constructParametricType(List.class, Attachment.class);
		    List<Attachment> attachmentList = objectMapper.readValue(attachmentlist, javaType);  
		    map = approvalFormService.save(userId, formId,businessId, registerName, phone, email, address, noticeGet, attachmentList);
		    map.put("success", "true");
		}catch(Exception e){
			logger.error("保存失败！"+e.getMessage(), e);
			throw new Exception("保存失败！"+e.getMessage(),e);
		}
		return map;
	}
	
	/**
	 * 企业撤销申请
	 * @return
	 */
	@RequestMapping(value="recall",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> cancel(
			@RequestParam(value = "formId") String formId) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "撤销失败");
		map.put("success", "false");
		try{
			String message = approvalFormService.recall(formId);
			map.put("msg", message);
			if(message.equals("撤销成功")){
		    	map.put("success", "true");
		    }
		}catch(Exception e){
			logger.error("撤销失败！"+e.getMessage(), e);
			throw new Exception("撤销失败！"+e.getMessage(),e);
		}
		return map;
	}
	
	/**
	 * 人工分派
	 * @return
	 */
	@RequestMapping(value="turnOther",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> turnOther(
			@RequestParam(value = "formId") String formId,
			@RequestParam(value = "loginName") String loginName
			) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "分派失败");
		map.put("success", "false");
		try{
			String message = approvalFormService.turnOther(formId,loginName);
			map.put("msg", message);
			if(message.equals("业务分派成功")){
		    	map.put("success", "true");
		    }
		}catch(Exception e){
			logger.error("分派失败！"+e.getMessage(), e);
			throw new Exception("分派失败！"+e.getMessage(),e);
		}
		return map;
	}
}
