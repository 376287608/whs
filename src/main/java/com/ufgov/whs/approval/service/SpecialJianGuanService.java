package com.ufgov.whs.approval.service;

import java.io.File;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ufgov.whs.approval.bean.ApprovalForm;
import com.ufgov.whs.approval.bean.ApprovalReport;
import com.ufgov.whs.approval.bean.Attachment;
import com.ufgov.whs.approval.bean.FormAttachment;
import com.ufgov.whs.approval.bean.ReportAttachment;
import com.ufgov.whs.approval.bean.TransactBusiness;
import com.ufgov.whs.approval.bean.VBankStatus;
import com.ufgov.whs.approval.dao.ApprovalFormDao;
import com.ufgov.whs.approval.dao.ApprovalReportDao;
import com.ufgov.whs.approval.dao.FormAttachmentDao;
import com.ufgov.whs.approval.dao.ReportAttachmentDao;
import com.ufgov.whs.attachment.bean.DocAddrInfo;
import com.ufgov.whs.attachment.bean.HasDoc;
import com.ufgov.whs.attachment.dao.DocAddrInfoDao;
import com.ufgov.whs.attachment.dao.HasDocDao;
import com.ufgov.whs.attachment.service.IDocAddrInfoService;
import com.ufgov.whs.attachment.service.IHasDocService;
import com.ufgov.whs.attachment.service.impl.ExportImportServiceImpl;
import com.ufgov.whs.business.bean.BuAttachmentType;
import com.ufgov.whs.business.bean.BuBusiness;
import com.ufgov.whs.business.service.BuAttachmentTypeService;
import com.ufgov.whs.business.service.BuBusinessService;
import com.ufgov.whs.businesslog.bean.BusinessLog;
import com.ufgov.whs.businesslog.service.BusinessLogService;
import com.ufgov.whs.common.mapper.BeanMapper;
import com.ufgov.whs.common.pagination.impl.IPaginationImpl;
import com.ufgov.whs.common.utils.DateUtils;
import com.ufgov.whs.common.utils.FileUtils;
import com.ufgov.whs.common.utils.PageAndWaterMarkUtils;
import com.ufgov.whs.common.utils.SqlUtils;
import com.ufgov.whs.common.utils.UUIDUtil;
import com.ufgov.whs.message.service.MessageService;
import com.ufgov.whs.process.bean.ProInstance;
import com.ufgov.whs.process.bean.Process;
import com.ufgov.whs.process.service.ProStepService;
import com.ufgov.whs.process.service.ProcessInstanceService;
import com.ufgov.whs.process.service.ProcessService;
import com.ufgov.whs.system.bankuser.bean.VBankUser;
import com.ufgov.whs.system.user.bean.SysUser;
import com.ufgov.whs.system.utils.ResultConstant;
import com.ufgov.whs.system.utils.StatuConstant;
import com.ufgov.whs.system.utils.SysConstant;
import com.ufgov.whs.system.utils.UserUtil;
import com.ufgov.whs.workcalendar.bean.HasWorkDay;
import com.ufgov.whs.workcalendar.service.IHasWorkDayService;

/**
 * 监管分析科service
 * @author fucj
 * @date 2015年1月13日
 */
@Service
@Transactional(readOnly=true)
public class SpecialJianGuanService{
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private ApprovalReportDao approvalReportDao;
	
	@Autowired
	private BusinessLogService businessLogService;
	
	@Autowired
    JdbcTemplate jdbc;
	
	@Autowired
	private ReportAttachmentDao reportAttachmentDao;
	
	@Autowired
	private ProStepService proStepService;
	
	@Autowired
	private ProcessInstanceService processInstanceService;
	
	@Autowired
	private IPaginationImpl ipaginationservice;
	
	@Autowired
	ProcessService processService;	

	@Autowired
	BuBusinessService buBusinessService;
		
	@Autowired
	ReportAttachmentService reportAttachmentService;
	
	@Autowired
	BuAttachmentTypeService buAttachmentTypeService;
	
	@Autowired
	private IDocAddrInfoService docAddrInfoService ;
	
	@Autowired
	private MessageService messageService;	
	
	@Autowired
	private IHasWorkDayService iHasWorkDayService;
	
	@Autowired
	private HasDocDao hasDocDao;
	
	@Autowired
	private DocAddrInfoDao docAddrInfoDao;
	
	@Autowired
	private IHasDocService iHasDocService;//附件元数据接口
	
	@Autowired
	ApprovalReportService approvalReportService;

	
	//@Autowired
	//private ResourceService resourceService;
	
	/**
	 * 保存审批单
	 * @param id
	 * @return 用户对象
	 */
	@Transactional(readOnly = false)
	public void save(ApprovalReport ar) {
		approvalReportDao.save(ar);		
	}
	/**
	 * 按申请序号查找附件
	 * @param id
	 * @return 用户对象
	 */
	public List<ReportAttachment> getReportAttachment(String reportId) {
		
		List<ReportAttachment> list = reportAttachmentDao.getReportAttachmentById(reportId);
		return list ;
	}
	
	/**
	 * 按id查询审批单
	 * @param id
	 * @return 用户对象
	 */
	public ApprovalReport getApprovalReport(String id) {
		return approvalReportDao.findOne(id);		
	}
	
	/**
	 * 查询退回人员
	 * @param id
	 * @return 用户对象
	 */
	public List<VBankUser> getPreviousOperator(String reportId) {
		ProInstance p = processInstanceService.getProInstanceByReportId(reportId,ResultConstant.PROCESS_STATUS_QD);
		Integer businessId = getApprovalReport(reportId).getBusinessId();
		List<VBankUser> userlist = proStepService.getPreviousOperator(p.getProcessId(), p.getCurrentstep(),businessId);
		return userlist;
	}
	
	/**
	 * 查询提交人员
	 * @param id
	 * @return 用户对象
	 */
	public List<VBankUser> getNextOperator(String reportId) {
		ProInstance p = processInstanceService.getProInstanceByReportId(reportId,ResultConstant.PROCESS_STATUS_QD);
		Integer businessId = getApprovalReport(reportId).getBusinessId();
		List<VBankUser> userlist = proStepService.getNextStepOperator(p.getProcessId(), p.getCurrentstep(),businessId);
		return userlist;
	}
	
	/**
	 * 查询转派人员
	 * @param id
	 * @return 用户对象
	 */
	public List<VBankUser> getOtherOperator(String reportId) {
		ProInstance p = processInstanceService.getProInstanceByReportId(reportId,ResultConstant.PROCESS_STATUS_QD);
		Integer businessId = getApprovalReport(reportId).getBusinessId();
		List<VBankUser> userlist = proStepService.getOtherOperator(p.getProcessId(), p.getCurrentstep(),businessId);
		return userlist;
	}

	
	/**
	 * 退回
	 * @param id
	 * @return 
	 * @throws Exception 
	 */
	@Transactional(readOnly = false)
	public String turnback(String formId,int stepId,int userId,String loginName,String operationOpinion) throws Exception {
		String message = save(formId,operationOpinion);
		if(message.equals("保存成功")){
			ProInstance pi = processInstanceService.getProInstanceByReportId(formId,ResultConstant.PROCESS_STATUS_QD);
			Timestamp ts = (Timestamp) pi.getCurrentstepTime();
			ApprovalReport ar = getApprovalReport(formId);
			businessLogService.insertBusinessLog("退回", formId, pi.getCurrentstep(), formId, ts,operationOpinion,"");
			//String stepName = proStepService.getFirstStep(p.getId()).getStepName();
			//businessLogService.insertBusinessLog(stepName, formId, stepId, ar.getId());
			pi.setCurrentuser(loginName);
			pi.setCurrentstep(stepId);
			pi.setCurrentstepTime(DateUtils.getSysDate());
			processInstanceService.save(pi);
		    message="审批已流转回上一个节点";
		}
		return message;
		
	}
	/**
	 * 提交
	 * @param id
	 * @return 用户对象
	 */
	@Transactional(readOnly = false)
	public String submit(String formId,int stepId,int userId,String loginName,String operationOpinion) throws Exception {
		String message = save(formId,operationOpinion);
		if(message.equals("保存成功")){
			ApprovalReport ar = getApprovalReport(formId);
			ProInstance pi = processInstanceService.getProInstanceByReportId(formId,ResultConstant.PROCESS_STATUS_QD);
			Timestamp ts = (Timestamp) pi.getCurrentstepTime();
			businessLogService.insertBusinessLog("提交", formId, pi.getCurrentstep(), formId, ts,operationOpinion,"");
			pi.setCurrentuser(loginName);
			pi.setCurrentstep(stepId);
			pi.setCurrentstepTime(DateUtils.getSysDate());
			processInstanceService.save(pi);
			message="审批已流转到下一个节点";	
		}
		return message;		
	}
	
	@Transactional(readOnly = false)
	public Map<String, Object> save(String formId,String remark,String businessNo,List<Attachment> attachmentList){
		String message="保存失败";
		Map<String, Object> info = new HashMap<String, Object>();
		info.put("success", "false");
		String loginName = UserUtil.getCurrentLoginUser().getLoginName();
		try {
			ApprovalReport ar = new ApprovalReport();
			if(formId ==null || formId.trim().equals("")){
				String id = UUIDUtil.genUUID();
				ar.setId(id);
				ar.setCreateTime(DateUtils.getSysDate());
				ar.setFormCode(DateUtils.getDateRandom());
				ar.setApplyTime(DateUtils.getSysDate());
				formId = id;
				ar.setCreateTime(DateUtils.getSysDate());
				ar.setApplyBy(loginName);
				ar.setApplyName(UserUtil.getCurrentBankUser().getName());
			}else{
				ar = getApprovalReport(formId);		
			}
			BuBusiness b = buBusinessService.getBuBusinessByBusinessNo(businessNo);
			if(b!=null){
				ar.setBusinessId(b.getId());
				ar.setBusinessName(b.getBusinessName());
				//ar.setReasonDesc(reasonDesc);
				ar.setRemark(remark);
				ar.setIsfinish(StatuConstant.FINISHSTATU_WBJ);
				ar.setModifyTime(DateUtils.getSysDate());
				ar.setModifyBy(loginName);
				ar.setStatuBank(StatuConstant.REPORTSTATU_YBC);
				ar.setReportState(StatuConstant.REPORTSTATU_YBC);
				approvalReportService.save(ar);
				if (attachmentList != null && attachmentList.size() > 0) {
					saveReportAttachment(attachmentList,formId);
				}
				message = "保存成功";
				info.put("formId", formId);
				info.put("msg", message);
				info.put("success", "true");
				info.put("businessId",b.getId());
			}else{
				message="查询不到该业务，请核对业务是否设置";	
				info.put("formId", formId);
				info.put("msg", message);
			}
			return info;
		} catch (Exception e) {
			message="保存异常";
			info.put("msg", message);
			return info;
		}	
	}
	
	@Transactional(readOnly = false)
	public String save(String formId,String operationOpinion){
		String message="保存失败";
		try {
			ApprovalReport ar = getApprovalReport(formId);	
			if(ar == null){
				message = "获取审批报告单失败，请核对";
			}else{
				ProInstance pi = processInstanceService.getProInstanceByReportId(formId,ResultConstant.PROCESS_STATUS_QD);
				Timestamp ts = (Timestamp) pi.getCurrentstepTime();
				businessLogService.insertBusinessLog("保存", formId, pi.getCurrentstep(), formId, ts,operationOpinion,"");
				message="保存成功";
			}
			return message;
		} catch (Exception e) {
			message="保存异常";
			return message;
		}	
	}
	
	@Transactional(readOnly = false)
	public String view(String formId) {
		ApprovalReport ar = getApprovalReport(formId);
		ProInstance pi = processInstanceService.getProInstanceByReportId(formId,ResultConstant.PROCESS_STATUS_QD);
		if(pi!=null){
			Timestamp ts = (Timestamp) pi.getCurrentstepTime();
			businessLogService.insertBusinessLog("查看", formId, pi.getCurrentstep(), formId, ts,"","");	
		}
		return "操作成功";
	}
	/**
	 * 内部撤回
	 * @param id
	 * @return 用户对象
	 */
	@Transactional(readOnly = false)
	public String internalWithdrawal(String formId) {
		String message = "内部撤回失败";
		ProInstance pi = processInstanceService.getProInstanceByReportId(formId,ResultConstant.PROCESS_STATUS_QD);
		BusinessLog blog = businessLogService.getLastOperatorLog(formId);
		String operator = blog.getOperatorBy();
		Timestamp ts = (Timestamp) pi.getCurrentstepTime();
		ApprovalReport ar = getApprovalReport(formId);
		if(pi.getCurrentstep()>blog.getStepId() && operator.equals(UserUtil.getCurrentUser().getLoginName())){
			pi.setCurrentuser(operator);
			pi.setCurrentstep(blog.getStepId());
			pi.setCurrentstepTime(blog.getReceiveDate());
			processInstanceService.save(pi);
			businessLogService.insertBusinessLog("撤回", formId, pi.getCurrentstep(), formId, ts,"",ar.getBusinessVerifyCode());
			message = "审批已内部撤回";
		}	
		return message;
	}
	

	/**
	 * 终止预审批
	 * @param id
	 * @return 用户对象
	 */
	@Transactional(readOnly = false)
	public String endPreApproval(String formId) throws Exception {
		String message = "终止失败";
		ApprovalReport ar = getApprovalReport(formId);
		approvalReportService.updateApprovalReport(formId,ResultConstant.ACCEPT_RESULT_ZDZZ,StatuConstant.REPORTSTATU_YZZ,StatuConstant.REPORTSTATU_YZZ);
		ar.setReportState(ResultConstant.ACCEPT_RESULT_ZDZZ);
		save(ar);
		//添加操作日志
		ProInstance pi = processInstanceService.getProInstanceByReportId(formId);
		businessLogService.insertBusinessLog("终止审批", formId, pi.getCurrentstep(), formId, DateUtils.getSysTimestamp(),"",ar.getBusinessVerifyCode());			
		//将当前流程实例设为第一步骤审核人
		pi.setStatus(ResultConstant.PROCESS_STATUS_FZ);	
		message = "审批已终止";
		return message;
	}

	/**
	 * 修改审批单状态——内网 办结结论
	 * @param 
	 * @return 
	 */
	@Transactional(readOnly = false)
	public void updateFinishResult(String reportId,String finishResult,String bstatu,String cstatu){
		ApprovalReport ar = getApprovalReport(reportId);
		ar.setStatuCompany(cstatu);
		ar.setStatuBank(bstatu);
		ar.setFinishResult(finishResult);
		ar.setFinishTime(DateUtils.getSysDate());
		ar.setIsfinish(StatuConstant.FINISHSTATU_YBJ);
		save(ar);
	}
	
	/**
	 * 流程流转给第一审核人
	 * @param 
	 * @return 
	 */
	@Transactional(readOnly = false)
	public void turnToFirstStep(String formId,String instanceStatu){
		ProInstance pi = processInstanceService.getProInstanceByReportId(formId,ResultConstant.PROCESS_STATUS_QD);
		int firstStep = proStepService.getFirstStep(pi.getProcessId()).getStepOrder();			
		BusinessLog blog = businessLogService.getOperatorLogByStepId(formId,firstStep);		
		pi.setCurrentstep(firstStep);
		pi.setCurrentuser(blog.getOperatorBy());
		pi.setStatus(instanceStatu);
		processInstanceService.save(pi);
	}
	/**
	 * 撤销流程
	 * @param id
	 * @return 用户对象
	 */
	@Transactional(readOnly = false)
	public String withdrawProcess(String formId){
		String message = "撤销成功";
		ApprovalReport ar = getApprovalReport(formId);
		ProInstance pi = processInstanceService.getProInstanceByReportId(formId,ResultConstant.PROCESS_STATUS_QD);
		pi.setStatus(ResultConstant.PROCESS_STATUS_FZ);
		pi.setDelFlag("0");
		processInstanceService.save(pi);
		businessLogService.generateBusinessLog("撤销审批流程", "", formId,ar.getBusinessVerifyCode());
		ar.setStatuBank(StatuConstant.REPORTSTATU_YBC);
		ar.setReportState(StatuConstant.REPORTSTATU_YBC);
		save(ar);
		return message;
	}

	@Transactional(readOnly = false)
	public Map<String, Object> saveInputAndGetProcessList(String formId,String reasonDesc,String remark,String businessNo,List<Attachment> attachmentList){
		Map<String, Object> info = new HashMap<String,Object>();
		info.put("msg", "获取流程列表失败");
		info.put("success", "false");
		try {
			info = save(formId,remark, businessNo,attachmentList);
			if(info.get("msg").equals("保存成功")){
				ApprovalReport ar = getApprovalReport(info.get("formId").toString());	
				ar.setApplyTime(DateUtils.getSysDate());
				approvalReportService.save(ar);
				List<Process> plist =  approvalReportService.getProcessList(ar.getBusinessId()); 
				if(plist!=null && plist.size()>0){
					info.put("processList", plist);
					info.put("success", "true");
					info.put("msg", "获取流程列表成功");
				}
			}
		} catch (Exception e) {
			logger.error("获取流程列表失败！"+e.getMessage(), e);
		}
		return info;	
	}
	
	
	
	/**
	 * 创建分页请求对象
	 * @param pageNumber 当前页码
	 * @param pagzSize 显示条数
	 * @param sortType 排序类型
	 * @param sortField 排序字段
	 * @return
	 */
	public PageRequest buildPageRequest(int pageNumber, int pagzSize,
	           String sortType,String sortField) {
	       Sort sort = null;
	       List<String> orders=new ArrayList<String>();
	       orders.add(sortField);
	       if ("desc".equalsIgnoreCase(sortType)) {
	       		sort = new Sort(Direction.DESC, orders);
	       }else{
	   		sort = new Sort(Direction.ASC, orders);
	       }
	       return new PageRequest(pageNumber - 1, pagzSize, sort);
	   }
	
	/**
	 * 待办理
	 * 获取分页数据 包括记录和条数
	 * @param pageRequest
	 * @param clazz
	 * @param user
	 * @return
	 * @throws Exception
	 */
	public PageImpl getToTransactList(PageRequest pageRequest,Class clazz,SysUser user) throws Exception {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder();
		sql.append("select t.* from v_approvalreport_dept t,pro_instance p where 1=1 ");
		sql.append(" and t.isfinish != 1 and t.verify_dept_id='4' ") ;
		sql.append(" and t.process_id2 = p.id ");
		sql.append(" and p.del_flag = '1' ");
		//当前操作人
		sql.append(" and p.currentuser = '"+user.getLoginName()+"' ");
		sql.append(" and t.statu_bank in ( '"+StatuConstant.REPORTSTATU_SPZ+"') ") ;
		
	    return ipaginationservice.getPageImpl(sql.toString(), pageRequest, clazz);
	}
	
	/**
	 * 转派
	 * @param id
	 * @return 用户对象
	 */
	@Transactional(readOnly = false)
	public String turnOther(String formId,int stepId,int userId,String loginName,String operationOpinion) throws Exception {
		String message = save(formId,operationOpinion);
		ApprovalReport ar = getApprovalReport(formId);
		if(message.equals("保存成功")){
			ProInstance pi = processInstanceService.getProInstanceByReportId(formId,ResultConstant.PROCESS_STATUS_QD);
			Timestamp ts = (Timestamp) pi.getCurrentstepTime();
			businessLogService.insertBusinessLog("转派", formId, pi.getCurrentstep(), formId, ts,operationOpinion,"");
			pi.setCurrentuser(loginName);
			processInstanceService.save(pi);
			message="转派成功";	
		}
		return message;		
	}
	
	/**
	 * 办结通过 
	 * @param id
	 * @return 用户对象
	 */
	@Transactional(readOnly = false)
	public String passThough(String formId,String operationOpinion) throws Exception {
		String message = save(formId,operationOpinion);
		if(message.equals("保存成功")){
			ApprovalReport ar = getApprovalReport(formId);
			//办结结论为通过
			updateFinishResult(formId,ResultConstant.FINISH_RESULT_TY,StatuConstant.REPORTSTATU_YBJ,StatuConstant.REPORTSTATU_YBJ);
			//添加操作日志
			ProInstance pi = processInstanceService.getProInstanceByReportId(formId,ResultConstant.PROCESS_STATUS_QD);
			businessLogService.insertBusinessLog("办结通过", formId, pi.getCurrentstep(), formId, DateUtils.getSysTimestamp(),"",ar.getBusinessVerifyCode());
			//将当前流程实例设为第一步骤审核人
			turnToFirstStep(formId,ResultConstant.PROCESS_STATUS_JS);
			message = "办结通过";
		}
		return message;
	}
	
	/**
	 * 办结不通过 
	 * @param id
	 * @return 用户对象
	 */
	@Transactional(readOnly = false)
	public String refuseToPass(String formId,String operationOpinion) throws Exception {
		String message = save(formId,operationOpinion);
		if(message.equals("保存成功")){
			ApprovalReport ar = getApprovalReport(formId);
			//办结结论为不通过
			updateFinishResult(formId,ResultConstant.FINISH_RESULT_BTY,StatuConstant.REPORTSTATU_YBJ,StatuConstant.REPORTSTATU_YBJ);
			//添加操作日志
			ProInstance pi = processInstanceService.getProInstanceByReportId(formId,ResultConstant.PROCESS_STATUS_QD);
			businessLogService.insertBusinessLog("办结不通过", formId, pi.getCurrentstep(), formId, DateUtils.getSysTimestamp(),"",ar.getBusinessVerifyCode());
			//将当前流程实例设为第一步骤审核人
			turnToFirstStep(formId,ResultConstant.PROCESS_STATUS_JS);
			message = "审核不通过";
		}
		return message;
	}

	public void saveReportAttachment(List<Attachment> attachmentList,String reportId) {
		List<ReportAttachment> ralist = getReportAttachment(reportId);
		if(ralist!=null && ralist.size()>0){
			//将原有的都删除
			for (ReportAttachment ra : ralist) {
				reportAttachmentService.delete(ra);
			}
		}
		for (int i = 0; i < attachmentList.size(); i++) {
			Attachment attach = attachmentList.get(i);
			ReportAttachment fa = new ReportAttachment();
			fa.setDocId(attach.getAttachmentId());
			fa.setFormId(reportId);
			fa.setDocType(attach.getId());
			fa.setDocName(attach.getDocName());
			fa.setScene(0);
			fa.setCreateTime(DateUtils.getSysDate());
			fa.setFiletypeName(attach.getFiletypeName());		
			fa.setOtherFlag(attach.getOtherFlag());
			fa.setDisplayOrder(i + 1);
			fa.setCheckType("0");
			fa.setIslegal("0");
			fa.setDelFlag("1");
			fa.setStatu("1");
			reportAttachmentService.save(fa);
		}
	}
	
	/**
	 * 在办业务（参与过）
	 * @param pageRequest
	 * @param clazz
	 * @param user
	 * @return
	 * @throws Exception
	 */
	public PageImpl getTransactingList(PageRequest pageRequest,Class clazz,SysUser user) throws Exception {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder();
		sql.append("select * from ");
		sql.append(" (select * from v_approvalreport_dept where 1=1");
		sql.append(" and isfinish != 1  and  verify_dept_id='4' ") ;
		sql.append(" and statu_bank in ( '");
		sql.append(StatuConstant.REPORTSTATU_SPZ);
		
		sql.append("')) t ");
		sql.append(" INNER JOIN ");
		sql.append(" (select report_id,operator_by from business_log where operator_by = '"+user.getLoginName()+"' GROUP BY report_id,operator_by ) b ");
		sql.append(" on t.id = b.report_id ");
		sql.append(" INNER JOIN ");
		sql.append(" ( SELECT p.id pro_instance_id, b.name as currentuser, p.currentstep_time FROM pro_instance p, sys_user u, bank_user b WHERE p.currentuser = u.login_name and u.id = b.user_id and p.currentuser != '"+user.getLoginName()+"') p ");

		sql.append(" on t.process_id2 = p.pro_instance_id ");
		
	    return ipaginationservice.getPageImpl(sql.toString(), pageRequest, clazz);
	}
	
	/**
	 * 已办结
	 * @param pageRequest
	 * @param clazz
	 * @param user
	 * @return
	 * @throws Exception
	 */
	public PageImpl getfinishList(PageRequest pageRequest,Class clazz,SysUser user) throws Exception {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder();
		sql.append("select * from approval_report where id in ( ");
		sql.append(" select report_id from ( ");
		sql.append(" select report_id,operator_by from business_log where report_id in ( ");
		sql.append(" select id from v_approvalreport_dept where isfinish = '1'  and  verify_dept_id='4' ");
		sql.append(" ) group by report_id ,operator_by ) t where operator_by = '"+user.getLoginName()+"')");
	    return ipaginationservice.getPageImpl(sql.toString(), pageRequest, clazz);
	}
	
	/**
	 * 得到分页信息数据
	 * @param page
	 * @return
	 */
	public Map<String, Object> getPageInfo(Page<ApprovalReport> page) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", page.getContent());
		map.put("count", page.getTotalElements());
		return map;
	}
	
	/**
	 * 得到分页信息数据(在办)
	 * @param page
	 * @return
	 */
	public Map<String, Object> getBusinessPageInfo(String loginName,Page<TransactBusiness> page) {
		List<TransactBusiness> list = page.getContent() ;
		Iterator<TransactBusiness> iterator = list.iterator();
		while(iterator.hasNext()){
			TransactBusiness transactBusiness = iterator.next();
			//查找每个在办业务的上一环节人和上一环节经办时间
			BusinessLog businessLog = businessLogService.getBackByReportId(transactBusiness.getId(), loginName);
			if(businessLog != null){
				transactBusiness.setBackUser(businessLog.getOperatorBy());
				transactBusiness.setBackTime(businessLog.getEndDate());
			}else{//上一环节经办人为空  则使用接收人
				transactBusiness.setBackUser(transactBusiness.getApplyBy());
				transactBusiness.setBackTime(transactBusiness.getCreateTime());
			}
			
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		map.put("count", page.getTotalElements());
		return map;
	}
	
	
	/**
	 * 监管分析科查询状态
	 * @param flag
	 * @return
	 */
	public List<VBankStatus> getSpecialJianGuanBankStatus (boolean flag) throws Exception{
		StringBuffer sb=new StringBuffer();
		sb.append( " select * from v_specialjianguan_bank_status where flag = '3' ");
		List<Map<String, Object>> statusList = jdbc.queryForList(sb.toString());
		List<VBankStatus> bankStatusList = null ;
		if(statusList!=null && statusList.size()>0){
			bankStatusList =  BeanMapper.mapList(statusList, VBankStatus.class);
		}
		return bankStatusList ;
	}
	
	/**
	 * 暂存列表
	 * @param pageRequest
	 * @param clazz
	 * @param loginName
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	public PageImpl getTemporySaveList(PageRequest pageRequest,Class clazz,String loginName) throws Exception {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder();
		BuBusiness b = buBusinessService.getBuBusinessByBusinessNo(SysConstant.ANALYSIS_BUSINESS);
		sql.append(" select * from approval_report where statu_bank = '"+StatuConstant.REPORTSTATU_YBC+"' ");
		sql.append("  and apply_by = '"+loginName+"' and business_id = "+b.getId());
	    return ipaginationservice.getPageImpl(sql.toString(), pageRequest, clazz);
	}
	
	/**
	 * 业务申请 获取分页数据 包括记录和条数
	 * 
	 * @param pageRequest
	 *            分页请求对象
	 * @param clazz
	 *            泛型
	 * @param formCode
	 *            申请编号
	 * @param businessName
	 *            业务名称
	 * @param statuCompany
	 *            业务状态
	 * @param startDate
	 *            开始日期
	 * @param endDate
	 *            结束日期
	 * @return
	 * @throws Exception
	 */
	public PageImpl getFindAll(PageRequest pageRequest, Class clazz,
			String formCode, String applyName, String statuBank,
			String startDate, String endDate) throws Exception {
		// TODO Auto-generated method stub
		int businessId = 0;
		BuBusiness b = buBusinessService.getBuBusinessByBusinessNo(SysConstant.ANALYSIS_BUSINESS);
		if(b!=null){
			businessId = b.getId();
		}
		StringBuilder sql = new StringBuilder();
		sql.append("select * from v_approvalreport_dept where 1=1 and verify_dept_id='4' ");
		if(businessId==0){
			return null;
		}else{
			sql.append(" and business_id =" + businessId + " ");
		}
		// 以下代码可能会有sql注入 需要确认
		// 申请编号
		if (!isEmpty(formCode)) {
			sql.append(" and form_code like '%" + formCode + "%' ");
		}
		// 业务名称
		if (!isEmpty(applyName)) {
			sql.append(" and apply_name like '%" + applyName + "%' ");
		}
		// 业务状态
		if (!isEmpty(statuBank) &&  !statuBank.equals("全部")) {
			sql.append(" and statu_bank = '" + statuBank + "' ");
		}
		// 全部 增加待审批过滤
		if (!isEmpty(statuBank) &&  statuBank.equals("全部")) {
			sql.append(" and statu_bank <> '" + StatuConstant.REPORTSTATU_YBC + "' ");
		}
		// 提交时间
		if (!isEmpty(startDate) && !isEmpty(endDate)) {
			sql.append(" and DATE_FORMAT(apply_time,'%Y-%m-%d') >='"
					+ startDate
					+ "' and DATE_FORMAT(apply_time,'%Y-%m-%d') <='" + endDate
					+ "' ");
		}
		return ipaginationservice.getPageImpl(sql.toString(), pageRequest,
				clazz);
	}
	
	public Integer getBusinessId(String businessNo){
		Integer businessId = null;
		BuBusiness b = buBusinessService.getBuBusinessByBusinessNo(businessNo);
		if(b!=null){
			businessId = b.getId();
		}
		return businessId;
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

	@Transactional(readOnly = false)
	public void saveAttach(String docId,String pzDocId){
		reportAttachmentService.saveReportAttachment(docId, pzDocId); 
	}

}
