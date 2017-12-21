package com.ufgov.whs.approval.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ufgov.whs.approval.service.ApprovalReportService;
import com.ufgov.whs.approval.service.SpecialJianGuanService;
import com.ufgov.whs.approval.bean.ApprovalReport;
import com.ufgov.whs.approval.bean.Attachment;
import com.ufgov.whs.approval.bean.ReportAttachment;
import com.ufgov.whs.approval.bean.TransactBusiness;
import com.ufgov.whs.approval.bean.VBankStatus;
import com.ufgov.whs.approval.service.ReportAttachmentService;
import com.ufgov.whs.business.bean.BuBusiness;
import com.ufgov.whs.businesslog.bean.BusinessLog;
import com.ufgov.whs.businesslog.service.BusinessLogService;
import com.ufgov.whs.message.service.MessageService;
import com.ufgov.whs.process.bean.ProInstance;
import com.ufgov.whs.process.bean.ProStep;
import com.ufgov.whs.process.service.ProStepService;
import com.ufgov.whs.process.service.ProcessInstanceService;
import com.ufgov.whs.system.bankuser.bean.BankUser;
import com.ufgov.whs.system.user.bean.SysUser;
import com.ufgov.whs.system.user.service.UserService;
import com.ufgov.whs.system.utils.SysConstant;


/**
 * 申请单操作controller
 * @author fucj
 * @date 2017年10月20日
 */
@Controller
@RequestMapping(value = "/specialJianGuan")
public class SpecialController{
	
	protected final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private ApprovalReportService approvalReportService ;
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	ReportAttachmentService reportAttachmentService;
	
	@Autowired
	SpecialJianGuanService specialJianGuanService;
	
	@Autowired
	private BusinessLogService businessLogService ;
	
	@Autowired
	private ProStepService proStepService ;
	
	@Autowired
	private UserService userService ;
	
	@Autowired
	private ProcessInstanceService  processInstanceService;
	
	/**
	 * 保存
	 * @return
	 */
	@RequestMapping(value="saveInput",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> save(
			@RequestParam(value = "formId") String formId,
			//@RequestParam(value = "reasonDesc") String reasonDesc,
			@RequestParam(value = "remark") String remark,
			@RequestParam(value = "businessNo") String businessNo,
			@RequestParam(value = "attachmentlist") String attachmentlist
			) throws Exception{
		ObjectMapper objectMapper = new ObjectMapper();  
	    JavaType javaType = objectMapper.getTypeFactory().constructParametricType(List.class, Attachment.class);
	    List<Attachment> attachmentList = objectMapper.readValue(attachmentlist, javaType); 
	    Map<String,Object> map = specialJianGuanService.save(formId,remark, businessNo,attachmentList);
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
			String message = specialJianGuanService.internalWithdrawal(formId);
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
	 * 录入业务获取流程列表
	 * @return
	 */
	@RequestMapping(value="saveInputAndGetProcessList",method = RequestMethod.POST)
	public @ResponseBody  Map<String,Object> saveInputAndGetProcessList(
			@RequestParam(value = "formId") String formId,
			@RequestParam(value = "reasonDesc") String reasonDesc,
			@RequestParam(value = "remark") String remark,
			@RequestParam(value = "businessNo") String businessNo,
			@RequestParam(value = "attachmentlist") String attachmentlist) throws Exception{		
			ObjectMapper objectMapper = new ObjectMapper();  
		    JavaType javaType = objectMapper.getTypeFactory().constructParametricType(List.class, Attachment.class);
		    List<Attachment> attachmentList = objectMapper.readValue(attachmentlist, javaType); 
			Map<String,Object> map = specialJianGuanService.saveInputAndGetProcessList(formId,reasonDesc,remark, businessNo,attachmentList);
			return map;
	}

	/**
	 * 内部提交
	 * @return
	 */
	@RequestMapping(value="submit",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> submit(
			@RequestParam(value = "formId") String formId,
			@RequestParam(value = "stepId") Integer stepId,
			@RequestParam(value = "userId") Integer userId,
			@RequestParam(value = "loginName") String loginName,
			@RequestParam(value = "operationOpinion") String operationOpinion
			) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("success", "false");
		try{
			String message = specialJianGuanService.submit(formId,stepId, userId, loginName,operationOpinion);
			map.put("msg", message);
			map.put("success", "true");
		}catch(Exception e){
			logger.error("提交失败！"+e.getMessage(), e);
			throw new Exception("提交失败！"+e.getMessage(),e);
		}
		return map;
	}
	
	/**
	 * 审批保存
	 * @return
	 */
	@RequestMapping(value="save",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> save(
			@RequestParam(value = "formId") String formId,
			@RequestParam(value = "operationOpinion") String operationOpinion
			) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "保存失败");
		map.put("success", "false");
		try{
			String message = specialJianGuanService.save(formId,operationOpinion);
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
	 * 内部退回
	 * @return
	 */
	@RequestMapping(value="turnback",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> turnback(
			@RequestParam(value = "formId") String formId,
			@RequestParam(value = "stepId") Integer stepId,
			@RequestParam(value = "userId") Integer userId,
			@RequestParam(value = "loginName") String loginName,
			@RequestParam(value = "operationOpinion") String operationOpinion
			) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "内部退回失败");
		map.put("success", "false");
		try{
			String message = specialJianGuanService.turnback(formId,stepId, userId, loginName,operationOpinion);
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
	 * 办结通过
	 * @return
	 */
	@RequestMapping(value="passThough",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> passThough(
			@RequestParam(value = "formId") String formId,
			@RequestParam(value = "operationOpinion") String operationOpinion
			) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "办结通过失败");
		map.put("success", "false");
		try{
			String message = specialJianGuanService.passThough(formId,operationOpinion);
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
	 * 撤销流程
	 * @return
	 */
	@RequestMapping(value="withdrawProcess",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> withdrawProcess(
			@RequestParam(value = "formId") String formId) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "撤销失败");
		map.put("success", "false");
		try{
			String message = specialJianGuanService.withdrawProcess(formId);
			if(message.equals("撤销成功")){
					map.put("msg", message);
					map.put("success", "true");
			}
		}catch(Exception e){
			logger.error("撤销流程失败！"+e.getMessage(), e);
			throw new Exception("撤销流程失败！"+e.getMessage(),e);
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
			@RequestParam(value = "stepId") Integer stepId,
			@RequestParam(value = "userId") Integer userId,
			@RequestParam(value = "loginName") String loginName,
			@RequestParam(value = "operationOpinion") String operationOpinion
			) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "转派失败");
		map.put("success", "false");
		try{
			String message = specialJianGuanService.turnOther(formId,stepId, userId, loginName,operationOpinion);
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
	 * 业务审批待办在办已完结列表
	 * @param pageNumber
	 * @param pageSize
	 * @param formCode 申请编号
	 * @param businessName 业务名称
	 * @param statuCompany 业务状态
	 * @param queryDate 查询时间段
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/ajaxToTransactList",method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody Map<String,Object> ajaxToTransactList(HttpServletRequest request,Integer pageNumber,
			Integer pageSize,String status) throws Exception {
		//校验分页参数
		if(null == pageNumber || null == pageSize || isEmpty(status)){
			return null ;
		}
		//当前用户
		SysUser user = (SysUser)SecurityUtils.getSubject().getSession().getAttribute("user");
		if(user == null || !status.matches("[0123]{1}")){
			return null ;
		}
		Page<ApprovalReport> page = null;
		Page<TransactBusiness> pageBusiness = null ;
		PageRequest pageRequest = specialJianGuanService.buildPageRequest(pageNumber, pageSize,"desc","apply_time");
		Map<String,Object> pageInfo = null ;
		try {
			// status 0 待办理 1 在办理 2 已办结 
			if("0".equals(status)){
				page = specialJianGuanService.getToTransactList(pageRequest,ApprovalReport.class,user);
			}else if("1".equals(status)){//在办理
				pageBusiness = specialJianGuanService.getTransactingList(pageRequest,TransactBusiness.class,user);
			}else if("2".equals(status)){//已办结
				page = specialJianGuanService.getfinishList(pageRequest,ApprovalReport.class,user);
			}else{
				return null ;
			}
			//返回信息
			if("1".equals(status)){
				pageInfo = specialJianGuanService.getBusinessPageInfo(user.getLoginName(),pageBusiness);
			}else{
				pageInfo = specialJianGuanService.getPageInfo(page);
			}
			pageInfo.put("success", "true");
			return pageInfo;
		} catch (Exception e) {
			pageInfo.put("success", "false");
			throw new Exception("列表查询失败");
		}
	}
	
	/**
	 * 待接收任务
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/getSaveList",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> getToReceive(Integer pageNumber,Integer pageSize) throws Exception {
		//校验分页参数
		if(null == pageNumber || null == pageSize){
			return null ;
		}
		//当前用户
		SysUser user = (SysUser)SecurityUtils.getSubject().getSession().getAttribute("user");
		//分页对象
		Page<ApprovalReport> page = null;
		Map<String,Object> pageInfo = null;
		PageRequest pageRequest = specialJianGuanService.buildPageRequest(pageNumber, pageSize,"desc","modify_time");
		try {
			page = specialJianGuanService.getTemporySaveList(pageRequest,ApprovalReport.class,user.getLoginName());
			pageInfo = specialJianGuanService.getPageInfo(page);
			pageInfo.put("success", "true");
		} catch (Exception e) {
			pageInfo.put("success", "false");
			throw new Exception("业务申请列表查询失败");
		}
		return pageInfo ;
	}
	
	/**
	 * 监测科审批单列表综合查询
	 * @param pageNumber
	 * @param pageSize
	 * @param formCode 申请编号
	 * @param businessName 业务名称
	 * @param statuBank 业务状态
	 * @param queryDate 查询时间段
	 * @return
	 * @throws Exception
	 */
   	@SuppressWarnings({ "unchecked", "finally" })
	@RequestMapping(value="/ajaxApprovalReportList",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> ajaxApprovalFormList(HttpServletRequest request,Integer pageNumber,Integer pageSize,String formCode,
			String applyName,String statuBank,String queryDate) throws Exception {
   		//返回信息
   		Map<String,Object> map = new HashMap<String, Object>();
		map.put("msg", "查询失败");
		map.put("success", "false");
		//校验分页参数
		if(null == pageNumber || null == pageSize){
			return map ;
		}
		//当前用户
//		SysUser user = (SysUser)SecurityUtils.getSubject().getSession().getAttribute("user");
		//开始查询时间
		String startDate = null ;
		//结束查询时间
		String endDate = null ;
		try {
			//如果查询时间不为空
			if(queryDate != null && !queryDate.trim().isEmpty()){
				String[] times = queryDate.split(" ");
				startDate = times[0] ;
				endDate = times[2] ;
				//判断时间格式是否是 yyyy-MM-dd
				if(!startDate.matches("\\d{4}-\\d{2}-\\d{2}") || !endDate.matches("\\d{4}-\\d{2}-\\d{2}")){
					map.put("msg", "时间格式错误");
					return map ;
				}
			}
			PageRequest pageRequest = specialJianGuanService.buildPageRequest(pageNumber, pageSize,"desc","modify_time");
			//分页对象
			Page<ApprovalReport> page = specialJianGuanService.getFindAll(pageRequest,ApprovalReport.class,formCode,applyName,statuBank,startDate,endDate);
			//判断是内网还是互联网
//			boolean flag = approvalReportService.isInner();
			//业务状态
//			List<VBankStatus> bankStatus = approvalReportService.getBankStatus(flag);
			map.put("rows", page.getContent());
			map.put("count", page.getTotalElements());
//			map.put("status", bankStatus);
			map.put("msg", "查询成功");
			map.put("success", "true");
			return map ;
		} catch(Exception e){
			logger.error("查询失败！"+e.getMessage(), e);
			throw new Exception("查询失败！"+e.getMessage(),e);
		}finally{
			return map ;
		}
	}
   	
   	/**
   	 * 根据内外网返回银行状态
   	 * @return
   	 */
	@SuppressWarnings("finally")
	@RequestMapping(value="/getSpecialJianGuanBankStatus",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> getSpecialJianGuanBankStatus() {
		Map<String,Object> info = new HashMap<String, Object>();
		info.put("msg", "状态查询失败");
		info.put("success", "false");
		try {
			//判断是内网还是互联网
			boolean flag = approvalReportService.isInner();
			//业务状态
			List<VBankStatus> bankStatus = specialJianGuanService.getSpecialJianGuanBankStatus(flag);
			info.put("statusOfBank", bankStatus);
			info.put("msg", "状态查询成功");
			info.put("success", "true");
		}catch(Exception e){
			logger.error("状态查询失败！"+e.getMessage(), e);
			throw new Exception("状态查询失败！"+e.getMessage(),e);
		}finally{
			return info ;
		}
	}
	
   	/**
   	 * 根据业务编号返回业务号
   	 * @return
   	 */
	@SuppressWarnings("finally")
	@RequestMapping(value="/getBusinessId",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> getBusinessId(
			@RequestParam(value = "businessNo") String businessNo) {
		Map<String,Object> info = new HashMap<String, Object>();
		info.put("msg", "状态查询失败");
		info.put("success", "false");
		try {
			Integer b = specialJianGuanService.getBusinessId(businessNo);
			if(b!=null){
				info.put("businessId", b);
				info.put("msg", "业务编号查询成功");
				info.put("success", "true");
			}else{
				info.put("msg", "查询不到业务编号，请核对");
			}
		}catch(Exception e){
			logger.error("状态查询失败！"+e.getMessage(), e);
			throw new Exception("状态查询失败！"+e.getMessage(),e);
		}finally{
			return info ;
		}
	}
   	
	/**
	 * 根据id返回审批单详情信息
	 * @param id
	 * @return
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value="/approvalReportInfo",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> approvalReportInfo(HttpServletRequest request,String id) {
		//返回信息
		Map<String,Object> info = new HashMap<String, Object>();
		info.put("msg", "查询失败");
		info.put("success", "false");
		//id不能为空
		if(isEmpty(id)){
			return info ;
		}
		try {
			//根据id查询详情信息
			ApprovalReport approvalReport = approvalReportService.getApprovalReport(id);
			if(approvalReport == null){
				return info ;
			}
			if(approvalReport.getProcessId2()!=null){
				//查询经办人
				ProInstance pi = processInstanceService.get(approvalReport.getProcessId2());
				if(pi!=null ){
					ProStep firstStep = proStepService.getFirstStep(pi.getProcessId());
					BusinessLog jingbanLog = businessLogService.getOperatorLogByStepId(approvalReport.getId(), firstStep.getStepOrder());
					if(jingbanLog!=null){
						BankUser su = userService.getBankUser(jingbanLog.getOperatorBy());
						approvalReport.setAgent(su.getName()); 
						approvalReport.setAgentTime(jingbanLog.getEndDate());
					}
				}
			}else{
				approvalReport.setAgent(approvalReport.getApplyName());
				approvalReport.setAgentTime(approvalReport.getModifyTime());
			}

			//当前用户
			SysUser user = (SysUser) SecurityUtils.getSubject().getSession().getAttribute("user");
			//查找相关附件
			List<ReportAttachment> attachments = approvalReportService.getReportAttachment(id);
			//当前意见
			BusinessLog businessLog = businessLogService.getCurrentUserBusinessLog(user.getLoginName(), id);
			String currentSug = null ;
			if(businessLog != null){
				currentSug = businessLog.getOperationOpinon();
			}
			//历史意见
			List<BusinessLog> businessLogList = businessLogService.getByReportId(id);
			//最终审核人
			ProStep proStep = null ;
			//如果是内网 则查询该审批单最后审批人
			//if(approvalReportService.isInner()){
			proStep = proStepService.getMaxStepByReportId(id);
			//}
			info.put("item", approvalReport);
			info.put("attachments", attachments);
			info.put("currentSug", currentSug);
			info.put("sug", businessLogList);
			info.put("topUser", proStep);
			info.put("msg", "查询成功");
			info.put("success", "true");
		}catch(Exception e){
			logger.error("查询失败！"+e.getMessage(), e);
			throw new Exception("查询失败！"+e.getMessage(),e);
		}finally{
			return info ;
		}
	  }
	
	/**
	 * 判断字符串是否为空
	 * @param str
	 * @return
	 */
	public boolean isEmpty(String str){
		if(str == null || str.trim().isEmpty()){
			return true ;
		}
		return false ;
	}
}
