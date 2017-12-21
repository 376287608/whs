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
import com.ufgov.whs.approval.service.ApprovalFormService;
import com.ufgov.whs.approval.service.ApprovalReportService;
import com.ufgov.whs.approval.bean.ApprovalReport;
import com.ufgov.whs.approval.bean.Attachment;
import com.ufgov.whs.common.utils.DateUtils;
import com.ufgov.whs.process.service.ProcessInstanceService;
import com.ufgov.whs.system.bankuser.bean.BankUser;
import com.ufgov.whs.system.bankuser.bean.VBankUser;
import com.ufgov.whs.system.bankuser.service.BankUserService;
import com.ufgov.whs.process.bean.Process;

/**
 * 审批单操作controller
 * @author fucj
 * @date 2017年10月20日
 */
@Controller
@RequestMapping(value = "/reportoperation")
public class ReportOperationController{
	
	protected final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private ApprovalFormService approvalFormService ;
	
	@Autowired
	private ApprovalReportService approvalReportService ;
	
	@Autowired
	private ProcessInstanceService processInstanceService;
	
	@Autowired
	private BankUserService bankUserService;
	
	/**
	 * 内部退回
	 * @return
	 */
	@RequestMapping(value="turnback",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> turnback(
			@RequestParam(value = "formId") String formId,
			@RequestParam(value = "applyName") String applyName,
			@RequestParam(value = "applyOrgCode") String applyOrgCode,
			@RequestParam(value = "businessName") String businessName,
			@RequestParam(value = "completeTime") String completeTime,
			@RequestParam(value = "stepId") Integer stepId,
			@RequestParam(value = "userId") Integer userId,
			@RequestParam(value = "loginName") String loginName,
			@RequestParam(value = "operationOpinion") String operationOpinion
			) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "内部退回失败");
		map.put("success", "false");
		try{
			ApprovalReport ar = approvalReportService.getApprovalReport(formId);
			ar.setApplyName(applyName);
			ar.setApplyOrgCode(applyOrgCode);
			ar.setBusinessName(businessName);
			ar.setCompleteTime(DateUtils.parseDate(completeTime, "yyyy-MM-dd HH:mm:ss"));
			approvalReportService.save(ar);
			String message = approvalReportService.turnback(formId, applyName,applyOrgCode,businessName,completeTime,stepId, userId, loginName,operationOpinion);
			if(message.equals("审批已流转回上一个节点")){
				map.put("msg",message);
				map.put("success", "true");
			}
		}catch(Exception e){
			logger.error("退回失败！"+e.getMessage(), e);
			throw new Exception("退回失败！"+e.getMessage(),e);
		}
		return map;
	}
	
	/**
	 * 内部退回获取退回人员列表
	 * @return
	 */
	@RequestMapping(value="backPersonList",method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> backPersonList(
			@RequestParam(value = "formId") String formId) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "退回获取操作人失败");
		map.put("success", "false");
		try{
			List<VBankUser> userlist =  approvalReportService.getPreviousOperator(formId);
			//审批单历史参与人
			List<BankUser> historyUsers = bankUserService.getHistoryUserByReportId(formId);
			if(userlist!=null && userlist.size()>0){
				map.put("user", userlist);
				map.put("historyUsers", historyUsers);
				map.put("success", "true");
				map.put("msg", "退回获取操作人成功");
			}
		}catch(Exception e){
			logger.error("退回获取操作人失败！"+e.getMessage(), e);
			throw new Exception("退回获取操作人失败！"+e.getMessage(),e);
		}
		return map;
	}
	
	/**
	 * 提交获取下一步人员列表
	 * @return
	 */
	@RequestMapping(value="submitPersonList",method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> submitPersonList(
			@RequestParam(value = "formId") String formId) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "查询提交人员失败");
		map.put("success", "false");
		try{
			List<VBankUser> userlist =  approvalReportService.getNextOperator(formId);
			if(userlist!=null && userlist.size()>0){
				map.put("user", userlist);
				map.put("msg", "查询提交人员成功");
				map.put("success", "true");
			}
		}catch(Exception e){
			logger.error("查询提交人员失败！"+e.getMessage(), e);
			throw new Exception("查询提交人员失败！"+e.getMessage(),e);
		}
		return map;
	}

	/**
	 * 内部提交
	 * @return
	 */
	@RequestMapping(value="submit",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> submit(
			@RequestParam(value = "formId") String formId,
			@RequestParam(value = "applyName") String applyName,
			@RequestParam(value = "applyOrgCode") String applyOrgCode,
			@RequestParam(value = "businessName") String businessName,
			@RequestParam(value = "completeTime") String completeTime,
			@RequestParam(value = "stepId") Integer stepId,
			@RequestParam(value = "userId") Integer userId,
			@RequestParam(value = "loginName") String loginName,
			@RequestParam(value = "operationOpinion") String operationOpinion
			) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", "false");
		try{
			String message = approvalReportService.submit(formId, applyName,applyOrgCode,businessName,completeTime,stepId, userId, loginName,operationOpinion);
			map.put("msg", message);
			map.put("success", "true");
		}catch(Exception e){
			logger.error("提交失败！"+e.getMessage(), e);
			throw new Exception("提交失败！"+e.getMessage(),e);
		}
		return map;
	}
	
	/**
	 * 保存
	 * @return
	 */
	@RequestMapping(value="save",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> save(
			@RequestParam(value = "formId") String formId,
			@RequestParam(value = "applyName") String applyName,
			@RequestParam(value = "applyOrgCode") String applyOrgCode,
			@RequestParam(value = "businessName") String businessName,
			@RequestParam(value = "completeTime") String completeTime,
			@RequestParam(value = "operationOpinion") String operationOpinion
			) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "保存失败");
		map.put("success", "false");
		try{
			String message = approvalReportService.save(formId, applyName,applyOrgCode,businessName,completeTime,operationOpinion);
			if(message.equals("保存成功")){
				map.put("msg", message);
				map.put("success", "true");
			}
		}catch(Exception e){
			logger.error("保存失败！"+e.getMessage(), e);
			throw new Exception("保存成功！"+e.getMessage(),e);
		}
		return map;
	}
	
	/**
	 * 内部撤回
	 * @return
	 */
	@RequestMapping(value="internalWithdrawal",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> internalWithdrawal(
			@RequestParam(value = "formId") String formId) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "内部撤回失败");
		map.put("success", "false");
		try{
			String message = approvalReportService.internalWithdrawal(formId);
			if(message.equals("审批已内部撤回")){
				map.put("msg", message);
				map.put("success", "true");
			}
		}catch(Exception e){
			logger.error("内部撤回失败！"+e.getMessage(), e);
			throw new Exception("内部撤回失败！"+e.getMessage(),e);
		}
		return map;
	}
	
	/**
	 * 补正
	 * @return
	 */
	@RequestMapping(value="turnCompanyToCorrect",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> turnCompanyToCorrect(
			@RequestParam(value = "formId") String formId
			) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "补正失败");
		map.put("success", "false");
		try{
			String message = approvalReportService.turnCompanyToCorrect(formId);
			map.put("msg", message);
			map.put("success", "true");
			//ar.setAcceptResult(acceptResult);
		}catch(Exception e){
			logger.error("补正失败！"+e.getMessage(), e);
			throw new Exception("补正失败！"+e.getMessage(),e);
		}
		return map;
	}
	
	
	/**
	 * 互联网补正
	 * @return
	 */
	@RequestMapping(value="addAndCorrect",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> addAndCorrect(
			@RequestParam(value = "formId") String formId,
			@RequestParam(value = "applyName") String applyName,
			@RequestParam(value = "applyOrgCode") String applyOrgCode,
			@RequestParam(value = "businessName") String businessName,
			@RequestParam(value = "completeTime") String completeTime,
			@RequestParam(value = "operationOpinion") String operationOpinion
			) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "待补正失败");
		map.put("success", "false");
		try{
			String message = approvalReportService.addAndCorrect(formId, applyName, applyOrgCode, businessName, completeTime, operationOpinion);
			map.put("msg", message);
			map.put("success", "true");
			//ar.setAcceptResult(acceptResult);
		}catch(Exception e){
			logger.error("补正失败！"+e.getMessage(), e);
			throw new Exception("补正失败！"+e.getMessage(),e);
		}
		return map;
	}
	
	/**
	 * 受理
	 * @return
	 */
	@RequestMapping(value="acceptReport",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> acceptReport(
			@RequestParam(value = "formId") String formId,
			@RequestParam(value = "applyName") String applyName,
			@RequestParam(value = "applyOrgCode") String applyOrgCode,
			@RequestParam(value = "businessName") String businessName,
			@RequestParam(value = "completeTime") String completeTime,
			@RequestParam(value = "operationOpinion") String operationOpinion
			) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "受理失败");
		map.put("success", "false");
		try{
			String message = approvalReportService.acceptReport(formId, applyName, applyOrgCode, businessName, completeTime,operationOpinion);
			map.put("msg", message);
			map.put("success", "true");
			//ar.setAcceptResult(acceptResult);
		}catch(Exception e){
			logger.error("受理失败！"+e.getMessage(), e);
			throw new Exception("受理失败！"+e.getMessage(),e);
		}
		return map;
	}
	
	
	/**
	 * 查看
	 * @return
	 */
	@RequestMapping(value="view",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> view(
			@RequestParam(value = "formId") String formId
			) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "查看失败");
		map.put("success", "false");
		try{
			 String message = approvalReportService.view(formId);
			 if(message.equals("操作成功")){
				map.put("msg", "操作成功");
				map.put("success", "true"); 
			 }
			//ar.setAcceptResult(acceptResult);
		}catch(Exception e){
			logger.error("查看失败！"+e.getMessage(), e);
			throw new Exception("查看失败！"+e.getMessage(),e);
		}
		return map;
	}
	
	/**
	 * 转派获取当前步骤其它操作人员列表
	 * @return
	 */
	@RequestMapping(value="sameLevelPersonList",method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> sameLevelPersonList(
			@RequestParam(value = "formId") String formId) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "查询转派人员失败");
		map.put("success", "false");
		try{
			List<VBankUser> userlist =  approvalReportService.getOtherOperator(formId);
			if(userlist!=null && userlist.size()>0){
				map.put("user", userlist);
				map.put("msg", "查询转派人员成功");
				map.put("success", "true");
			}
		}catch(Exception e){
			logger.error("查询转派人员失败！"+e.getMessage(), e);
			throw new Exception("查询转派人员失败！"+e.getMessage(),e);
		}
		return map;
	}
	

	/**
	 *转派
	 * @return
	 */
	@RequestMapping(value="turnOther",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> turnOther(
			@RequestParam(value = "formId") String formId,
			@RequestParam(value = "applyName") String applyName,
			@RequestParam(value = "applyOrgCode") String applyOrgCode,
			@RequestParam(value = "businessName") String businessName,
			@RequestParam(value = "completeTime") String completeTime,
			@RequestParam(value = "stepId") Integer stepId,
			@RequestParam(value = "userId") Integer userId,
			@RequestParam(value = "loginName") String loginName,
			@RequestParam(value = "operationOpinion") String operationOpinion
			) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "转派失败");
		map.put("success", "false");
		try{
			String message = approvalReportService.turnOther(formId, applyName,applyOrgCode,businessName,completeTime,stepId, userId, loginName,operationOpinion);
			if(message.equals("转派成功")){
				map.put("msg", message);
				map.put("success", "true");
			}
		}catch(Exception e){
			logger.error("转派失败！"+e.getMessage(), e);
			throw new Exception("转派失败！"+e.getMessage(),e);
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
		List<Process> plist = approvalReportService.getProcessList(businessId);
		if(plist!=null && plist.size()>0){
			map.put("msg", "获取流程列表成功");
			map.put("success", "true");
			map.put("processList", plist);
		}
		return map;
	}
	
	
	/**
	 * 录入业务获取流程列表
	 * @return
	 */
	@RequestMapping(value="saveInputAndGetProcessList",method = RequestMethod.POST)
	public @ResponseBody  Map<String,Object> saveInputAndGetProcessList(
			   @RequestParam(value = "registerName") String registerName,
			   @RequestParam(value = "phone") String phone,
			   @RequestParam(value = "email") String email,
			   @RequestParam(value = "address") String address,
			   @RequestParam(value = "noticeGet") String noticeGet,
			   @RequestParam(value = "attachmentlist") String attachmentlist,
			   @RequestParam(value = "applyName") String applyName,
			   @RequestParam(value = "applyOrgCode") String applyOrgCode,
			   @RequestParam(value = "businessId") Integer businessId) throws Exception{		
			ObjectMapper objectMapper = new ObjectMapper();  
		    JavaType javaType = objectMapper.getTypeFactory().constructParametricType(List.class, Attachment.class);
		    List<Attachment> attachmentList = objectMapper.readValue(attachmentlist, javaType); 
			Map<String,Object> map = approvalReportService.saveInputAndGetProcessList(registerName, phone, email, address, noticeGet,
					attachmentList, applyName,applyOrgCode,businessId);
			return map;
	}
	
	
	/**
	 * 启动流程
	 * @return
	 */
	@RequestMapping(value="startProcess",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> startProcess(
			@RequestParam(value = "formId") String formId,
			@RequestParam(value = "processId") Integer processId,
			@RequestParam(value = "flag") boolean flag) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "启动失败");
		map.put("success", "false");
		try{
			String message = approvalReportService.startProcess(formId,processId,flag);
			if(message.equals("启动成功")){
				map.put("msg", message);
				map.put("success", "true");
				map.put("formId", formId);
			}
		}catch(Exception e){
			logger.error("启动流程失败！"+e.getMessage(), e);
			throw new Exception("启动流程失败！"+e.getMessage(),e);
		}
		return map;
	}
	
	/**
	 * 撤销流程
	 * @return
	 */
	@RequestMapping(value="withdrawProcess",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> withdrawProcess(
			@RequestParam(value = "formId") String formId,
			@RequestParam(value = "businessId") Integer businessId) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "撤销失败");
		map.put("success", "false");
		try{
			//String message = approvalReportService.withdrawProcess(formId);
			//if(message.equals("撤销成功")){
				List<Process> plist = approvalReportService.getProcessList(businessId);
				if(plist!=null && plist.size()>0){
					map.put("msg", "获取流程列表成功");
					map.put("success", "true");
					map.put("processList", plist);
				}
			//}
		}catch(Exception e){
			logger.error("撤销流程失败！"+e.getMessage(), e);
			throw new Exception("撤销流程失败！"+e.getMessage(),e);
		}
		return map;
	}
	
	/**
	 * 终止预审批
	 * @return
	 */
	@RequestMapping(value="endPreApproval",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> endPreApproval(
			@RequestParam(value = "formId") String formId) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "终止失败");
		map.put("success", "false");
		try{
			String message = approvalReportService.endPreApproval(formId);
			map.put("msg", message);
			map.put("success", "true");
		}catch(Exception e){
			logger.error("终止审批失败！"+e.getMessage(), e);
			throw new Exception("终止审批失败！"+e.getMessage(),e);
		}
		return map;
	}
	
	/**
	 * 办结通过
	 * @return
	 */
	@RequestMapping(value="passThough",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> passThough(
			@RequestParam(value = "formId") String formId,
			@RequestParam(value = "applyName") String applyName,
			@RequestParam(value = "applyOrgCode") String applyOrgCode,
			@RequestParam(value = "businessName") String businessName,
			@RequestParam(value = "completeTime") String completeTime,
			@RequestParam(value = "operationOpinion") String operationOpinion
			) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "办结通过失败");
		map.put("success", "false");
		try{
			String message = approvalReportService.passThough(formId, applyName, applyOrgCode, businessName, completeTime,operationOpinion);
			map.put("msg", message);
			map.put("success", "true");
			//ar.setAcceptResult(acceptResult);
		}catch(Exception e){
			logger.error("办结通过失败！"+e.getMessage(), e);
			throw new Exception("办结通过失败！"+e.getMessage(),e);
		}
		return map;
	}
	
	
	/**
	 * 办结不通过
	 * @return
	 */
	@RequestMapping(value="refuseToPass",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> refuseToPass(
			@RequestParam(value = "formId") String formId,
			@RequestParam(value = "applyName") String applyName,
			@RequestParam(value = "applyOrgCode") String applyOrgCode,
			@RequestParam(value = "businessName") String businessName,
			@RequestParam(value = "completeTime") String completeTime,
			@RequestParam(value = "operationOpinion") String operationOpinion
			) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "办结不通过失败");
		map.put("success", "false");
		try{
			String message = approvalReportService.refuseToPass(formId, applyName, applyOrgCode, businessName, completeTime,operationOpinion);
			map.put("msg", message);
			map.put("success", "true");
			//ar.setAcceptResult(acceptResult);
		}catch(Exception e){
			logger.error("办结不通过失败！"+e.getMessage(), e);
			throw new Exception("办结不通过失败！"+e.getMessage(),e);
		}
		return map;
	}
	
	/**
	 * 办结——————————内网加业务凭证编码
	 * @return
	 */
	@RequestMapping(value="afterFinish",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> afterFinish(
			@RequestParam(value = "formId") String formId,
			@RequestParam(value = "businessDocumentCode") String businessDocumentCode
			) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "办结失败");
		map.put("success", "false");
		try{
			String message = approvalReportService.afterFinish(formId, businessDocumentCode);
			map.put("msg", message);
			map.put("success", "true");
			//ar.setAcceptResult(acceptResult);
		}catch(Exception e){
			logger.error("办结成功！"+e.getMessage(), e);
			throw new Exception("办结不成功！"+e.getMessage(),e);
		}
		return map;
	}
	
	/**
	 * 办结——————————互联网加水印
	 * @return
	 */
	@RequestMapping(value="addWaterPrint",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> addWaterPrint(
			@RequestParam(value = "formId") String formId
			) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "办结失败");
		map.put("success", "false");
		try{
			String message = approvalReportService.addPWToFinish(formId);
			map.put("msg", message);
			map.put("success", "true");
			//ar.setAcceptResult(acceptResult);
		}catch(Exception e){
			logger.error("办结成功！"+e.getMessage(), e);
			throw new Exception("办结不成功！"+e.getMessage(),e);
		}
		return map;
	}


}
