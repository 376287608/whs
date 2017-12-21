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

import org.apache.commons.lang3.StringUtils;
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
import com.ufgov.whs.system.bankuser.bean.BankUser;
import com.ufgov.whs.system.bankuser.bean.VBankUser;
import com.ufgov.whs.system.user.bean.SysUser;
import com.ufgov.whs.system.utils.ResultConstant;
import com.ufgov.whs.system.utils.StatuConstant;
import com.ufgov.whs.system.utils.SysConstant;
import com.ufgov.whs.system.utils.UserUtil;
import com.ufgov.whs.workcalendar.bean.HasWorkDay;
import com.ufgov.whs.workcalendar.service.IHasWorkDayService;

/**
 * 审批单service
 * @author fucj
 * @date 2015年1月13日
 */
@Service
@Transactional(readOnly=true)
public class ApprovalReportService{
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
	private ApprovalFormDao approvalFormDao;
	
	@Autowired
	private FormAttachmentDao formAttachmentDao ;
	
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
		ReportAttachment reportAttachment = null ;
		//list不为空
		if(list != null && list.size()>0){
			Iterator<ReportAttachment> iterator = list.iterator();
			while(iterator.hasNext()){
				reportAttachment = iterator.next();
				//场景等于0
				if(reportAttachment.getScene().equals(0)){
					ReportAttachment attachment = null ;
					//业务类型原有的附件
					if(reportAttachment.getDocType() != null){
						attachment = reportAttachmentDao.getByDocTypeAndSoOn(reportAttachment.getFormId(), reportAttachment.getDocType(), "1");
					//其他附件
					}else if(reportAttachment.getDocType() == null && reportAttachment.getOtherFlag() != null){
						attachment = reportAttachmentDao.getByOtherFlagAndSoOn(reportAttachment.getFormId(), reportAttachment.getOtherFlag(), "1");
					}
					if(attachment != null){
						iterator.remove();
					}
				}
			}
		}
		return list ;
	}
	
	/**
	 * 查找附件的上一版本
	 * @param reportAttachments
	 * @return
	 * @throws Exception
	 */
	public boolean setPreversion(List<ReportAttachment> reportAttachments) throws Exception{
		if(reportAttachments == null) return false ;
		for(ReportAttachment attachment : reportAttachments){
			ReportAttachment reportAttachment = null ;
			if(attachment.getDocType() != null){
				reportAttachment = reportAttachmentDao.getPreversionByDocType(attachment.getFormId(), attachment.getDocType());
			}else if(!StringUtils.isBlank(attachment.getOtherFlag())){
				reportAttachment = reportAttachmentDao.getPreversionByOtherFlag(attachment.getFormId(), attachment.getOtherFlag());
			}
			if(reportAttachment != null){
				attachment.setPreVersion(reportAttachment.getDocId());
			}
		}
		return true ;
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
	 * 查询提交人员
	 * @param id
	 * @return 用户对象
	 */
	public List<VBankUser> getOtherOperator(String reportId) {
		ProInstance p = processInstanceService.getProInstanceByReportId(reportId,ResultConstant.PROCESS_STATUS_QD);
		if(p==null){
			p = processInstanceService.getProInstanceByReportId(reportId,ResultConstant.PROCESS_STATUS_ZT);
		}
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
	public String turnback(String formId,String applyName,String applyOrgCode,String businessName,String completeTime,int stepId,int userId,String loginName,String operationOpinion) throws Exception {
		String message = save(formId, applyName,applyOrgCode,businessName,completeTime,operationOpinion);
		if(message.equals("保存成功")){
			ProInstance pi = processInstanceService.getProInstanceByReportId(formId,ResultConstant.PROCESS_STATUS_QD);
			Timestamp ts = (Timestamp) pi.getCurrentstepTime();
			ApprovalReport ar = getApprovalReport(formId);
			businessLogService.insertBusinessLog("退回", formId, pi.getCurrentstep(), formId, ts,operationOpinion,ar.getBusinessVerifyCode());
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
	public String submit(String formId,String applyName,String applyOrgCode,String businessName,String completeTime,int stepId,int userId,String loginName,String operationOpinion) throws Exception {
		String message = save(formId, applyName,applyOrgCode,businessName,completeTime,operationOpinion);
		if(message.equals("保存成功")){
			ApprovalReport ar = getApprovalReport(formId);
			ProInstance pi = processInstanceService.getProInstanceByReportId(formId,ResultConstant.PROCESS_STATUS_QD);
			Timestamp ts = (Timestamp) pi.getCurrentstepTime();
			businessLogService.insertBusinessLog("提交", formId, pi.getCurrentstep(), formId, ts,operationOpinion,ar.getBusinessVerifyCode());
			pi.setCurrentuser(loginName);
			pi.setCurrentstep(stepId);
			pi.setCurrentstepTime(DateUtils.getSysDate());
			processInstanceService.save(pi);
			message="审批已流转到下一个节点";	
		}
		return message;		
	}
	
	@Transactional(readOnly = false)
	public String save(String formId,String applyName,String applyOrgCode,String businessName,String completeTime,String operationOpinion){
		String message="保存失败";
		try {
			ApprovalReport ar = getApprovalReport(formId);
			ar.setApplyName(applyName);
			ar.setApplyOrgCode(applyOrgCode);
			ar.setBusinessName(businessName);
			boolean flag = isInner();
			if(flag){
				ar.setStatuBank(StatuConstant.REPORTSTATU_SPZ);
				ar.setReportState(StatuConstant.REPORTSTATU_SPZ);
			}else{
				Date cTime =DateUtils.parseDate(completeTime, "yyyy-MM-dd HH:mm:ss");
				BuBusiness b = buBusinessService.getBuBusinessById(ar.getBusinessId());
				int time_limited = b.getTimeLimited();
				String dayString = iHasWorkDayService.getHasWorkDay(DateUtils.getDate(),time_limited);
				Date d = DateUtils.parseDate(dayString, "yyyy-MM-dd");
				ar.setAcceptEndtime(DateUtils.getDateEnd(d));
				if(cTime.after(ar.getCompleteTime())){
					ar.setWarnFlag1("0");	
				}
				ar.setCompleteTime(cTime);	
				ar.setStatuBank(StatuConstant.REPORTSTATU_CLZ);
				ar.setReportState(StatuConstant.REPORTSTATU_CLZ);
			}
			save(ar);
			ProInstance pi = processInstanceService.getProInstanceByReportId(formId,ResultConstant.PROCESS_STATUS_QD);
			Timestamp ts = (Timestamp) pi.getCurrentstepTime();
			businessLogService.insertBusinessLog("保存", formId, pi.getCurrentstep(), formId, ts,operationOpinion,ar.getBusinessVerifyCode());
			//pi.setCurrentuser(loginName);
			//pi.setCurrentstep(stepId);
			//pi.setCurrentstepTime(DateUtils.getSysDate());
			//processInstanceService.save(pi);
			message="保存成功";
			return message;
		} catch (ParseException e) {
			message="日期格式有误";
			logger.error("日期格式有误" + e.getMessage());
			return message;
			//throw new Exception("日期格式有误。");
		}	
	}
	
	@Transactional(readOnly = false)
	public String view(String formId) {
		ApprovalReport ar = getApprovalReport(formId);
		ProInstance pi = processInstanceService.getProInstanceByReportId(formId,ResultConstant.PROCESS_STATUS_QD);
		if(pi!=null){
			Timestamp ts = (Timestamp) pi.getCurrentstepTime();
			businessLogService.insertBusinessLog("查看", formId, pi.getCurrentstep(), formId, ts,"",ar.getBusinessVerifyCode());	
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
	 * 开具补正通知书 
	 * @param id
	 * @return 用户对象
	 */
	@Transactional(readOnly = false)
	public String addAndCorrect(String formId,String applyName,String applyOrgCode,String businessName,String completeTime,String operationOpinion) throws Exception {
		String message = save(formId, applyName,applyOrgCode,businessName,completeTime,operationOpinion);
		if(message.equals("保存成功")){
			ApprovalReport ar = getApprovalReport(formId);
			if(ar.getAcceptResult()!=null&&ar.getAcceptResult().equals(ResultConstant.ACCEPT_RESULT_BZ)){
				message = turnCompanyToCorrect(formId);
			}else{
				//受理结论为补正，状态置为待补正
				updateApprovalReport(formId,ResultConstant.ACCEPT_RESULT_BZ,StatuConstant.REPORTSTATU_DBZ,StatuConstant.FORMSTATU_ADDITION);
				//添加操作日志
				ProInstance pi = processInstanceService.getProInstanceByReportId(formId,ResultConstant.PROCESS_STATUS_QD);
				businessLogService.insertBusinessLog("补正", formId, pi.getCurrentstep(), formId, DateUtils.getSysTimestamp(),"",ar.getBusinessVerifyCode());
				//将当前流程实例设为第一步骤审核人
				turnToFirstStep(formId,ResultConstant.PROCESS_STATUS_QD);
				message = "请银行前台人员开具补正通知书，通知企业";
			}
		}
		return message;
	}
	
	/**
	 * 补正 
	 * @param id
	 * @return 用户对象
	 */

	@Transactional(readOnly = false)
	public String turnCompanyToCorrect(String formId) throws Exception {
		String message = "补正失败";
		ApprovalReport ar = getApprovalReport(formId);
		updateApprovalReport(formId,ResultConstant.ACCEPT_RESULT_BZ,StatuConstant.REPORTSTATU_DBZ,StatuConstant.FORMSTATU_ADDITION);
		ar.setReportState(StatuConstant.REPORTSTATU_DBZ);
		save(ar);
		ProInstance pi = processInstanceService.getProInstanceByReportId(formId,ResultConstant.PROCESS_STATUS_QD);
		if(pi!=null){
			businessLogService.insertBusinessLog("补正", formId, pi.getCurrentstep(), formId, DateUtils.getSysTimestamp(),"",ar.getBusinessVerifyCode());
			//将当前流程实例设为第一步骤审核人
			turnToFirstStep(formId,ResultConstant.PROCESS_STATUS_ZT);
		}
		//企业单据设为补正
		ApprovalForm af = approvalFormDao.findOne(formId);
		String status1 = af.getStatuCompany();
		af.setStatuCompany(StatuConstant.FORMSTATU_ADDITION);
		approvalFormDao.save(af);
		//更新企业申请单据审核状态
		List<ReportAttachment> ralist = reportAttachmentDao.getReportAttachmentByIdAndScene(formId,0);
		if(ralist!=null && ralist.size()>0){
			updateFormAttachmentStatu(formId,ralist);
		}
		//发送消息
		messageService.updateNotReadMessage(formId);
		messageService.insertMessage(formId, af.getFormCode(), af.getBusinessName(), af.getSubmitTime(), status1, af.getStatuCompany(), DateUtils.getSysDate(), af.getContactName(), "0",af.getApplyBy(),af.getApplyName(),pi.getCurrentuser(),af.getBusinessId());
		message = "补正成功";
		return message;
		
	}

	/**
	 * 开具受理通知书 
	 * @param id
	 * @return 用户对象
	 */
	@Transactional(readOnly = false)
	public String acceptReport(String formId,String applyName,String applyOrgCode,String businessName,String completeTime,String operationOpinion) throws Exception {
		String message = save(formId, applyName,applyOrgCode,businessName,completeTime,operationOpinion);
		if(message.equals("保存成功")){
			ApprovalReport ar = getApprovalReport(formId);
			Date cTime =DateUtils.parseDate(completeTime, "yyyy-MM-dd HH:mm:ss");
			BuBusiness b = buBusinessService.getBuBusinessById(ar.getBusinessId());
			int time_limited2 = b.getTimeLimited2();
			String dayString = iHasWorkDayService.getHasWorkDay(DateUtils.getDate(),time_limited2);
			Date d = DateUtils.parseDate(dayString, "yyyy-MM-dd");
			ar.setFinishEndtime(DateUtils.getDateEnd(d));
			ar.setWarnFlag1("0");
			//受理结论为受理，银行状态为待审批
			updateApprovalReport(formId,ResultConstant.ACCEPT_RESULT_SL,StatuConstant.REPORTSTATU_DSP,StatuConstant.FORMSTATU_RECEIVE);				
			//添加操作日志
			ProInstance pi = processInstanceService.getProInstanceByReportId(formId,ResultConstant.PROCESS_STATUS_QD);
			businessLogService.insertBusinessLog("受理", formId, pi.getCurrentstep(), formId, DateUtils.getSysTimestamp(),"",ar.getBusinessVerifyCode());			
			//将当前流程实例设为第一步骤审核人
			turnToFirstStep(formId,ResultConstant.PROCESS_STATUS_JS);
			//企业单据设为待审批
			ApprovalForm af = approvalFormDao.findOne(formId);
			String status1 = af.getStatuCompany();
			af.setStatuCompany(StatuConstant.REPORTSTATU_DSP);
			approvalFormDao.save(af);			
			//更新企业申请单据审核状态
			List<ReportAttachment> ralist = reportAttachmentDao.getReportAttachmentByIdAndScene(formId,0);
			if(ralist!=null && ralist.size()>0){
				updateFormAttachmentStatu(formId,ralist);
			}
			//发送消息
			messageService.updateNotReadMessage(formId);
			messageService.insertMessage(formId, af.getFormCode(), af.getBusinessName(), af.getSubmitTime(), status1, af.getStatuCompany(), DateUtils.getSysDate(), af.getContactName(), "0",af.getApplyBy(),af.getApplyName(),pi.getCurrentuser(),af.getBusinessId());
			message = "请银行前台人员开具受理通知书，通知企业";
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
		//受理结论为主动废止，银行状态为终止
		updateApprovalReport(formId,ResultConstant.ACCEPT_RESULT_ZDZZ,StatuConstant.REPORTSTATU_YZZ,StatuConstant.REPORTSTATU_YZZ);
		//添加操作日志
		ProInstance pi = processInstanceService.getProInstanceByReportId(formId);
		businessLogService.insertBusinessLog("终止审批", formId, pi.getCurrentstep(), formId, DateUtils.getSysTimestamp(),"",ar.getBusinessVerifyCode());			
		//将当前流程实例设为第一步骤审核人
		pi.setStatus(ResultConstant.PROCESS_STATUS_FZ);	
		boolean flag = isInner();
		if(!flag){
			//企业单据设为已终止
			ApprovalForm af = approvalFormDao.findOne(formId);	
			String status1 = af.getStatuCompany();
			af.setStatuCompany(StatuConstant.REPORTSTATU_YZZ);		
			approvalFormDao.save(af);
			messageService.updateNotReadMessage(formId);
			messageService.insertMessage(formId, af.getFormCode(), af.getBusinessName(), af.getSubmitTime(), status1, af.getStatuCompany(), DateUtils.getSysDate(), af.getContactName(), "0",af.getApplyBy(),af.getApplyName(),pi.getCurrentuser(),af.getBusinessId());
		}
		message = "审批已终止";
		return message;
	}
	/**
	 * 人工录入并启动流程
	 * @param id
	 * @return 用户对象
	 */
	@Transactional(readOnly = false)
	public Map<String, Object> saveInputAndGetProcessList(String registerName, String phone,
			String email, String address, String noticeGet,
			List<Attachment> attachmentList,String applyName,
			String applyOrgCode,Integer businessId){
		Map<String, Object> info = new HashMap<String,Object>();
		info.put("msg", "获取流程列表失败");
		info.put("success", "false");
		try {
			info = saveInputReport(registerName, phone, email, address, noticeGet,
					attachmentList, applyName,applyOrgCode,businessId);
			if(info.get("msg").equals("保存成功")){
				List<Process> plist =  getProcessList(businessId); 
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
	 * 启动流程
	 * @param id
	 * @return 用户对象
	 */
	@Transactional(readOnly = false)
	public String startProcess(String formId,Integer processId,boolean flag){
		String message = "启动成功";
		if(flag){
			withdrawProcess(formId);
		}
		ApprovalReport ar = getApprovalReport(formId);
		Process p = processService.getProcessById(processId);
		Integer pid = processInstanceService.startInstance(formId, p);
		boolean innerflag = isInner();
		if(!innerflag){
			ar.setProcessId1(pid);
			ar.setProcesstypeId1(p.getId());
		}else{
			ar.setProcessId2(pid);
			ar.setProcesstypeId2(p.getId());
			ar.setStatuBank(StatuConstant.REPORTSTATU_SPZ);
			ar.setReportState(StatuConstant.REPORTSTATU_SPZ);
		}
		save(ar);
		businessLogService.generateBusinessLog("启动审批", "", ar.getId(),ar.getBusinessVerifyCode());
		return message;
	}
	
	/**
	 * 导入业务返回流程列表
	 * @param id
	 * @return 用户对象
	 */
	@Transactional(readOnly = false)
	public List<Process> getProcessList(Integer businessId) throws Exception {
		BankUser bu = UserUtil.getCurrentBankUser();
		Integer deptId = bu.getDeptId();
		List<Process> plist = processService.getProcessByBusinessId(businessId,deptId);
		return plist;
	}
	/**
	 * 修改审批单状态——外网 受理结论
	 * @param 
	 * @return 
	 */
	@Transactional(readOnly = false)
	public void updateApprovalReport(String reportId,String result,String bstatu,String cstatu){
		ApprovalReport ar = getApprovalReport(reportId);
		ar.setAcceptResult(result);
		ar.setStatuCompany(cstatu);
		ar.setStatuBank(bstatu);
		ar.setAcceptTime(DateUtils.getSysDate());
		save(ar);
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
		return message;
	}
	/**
	 * 保存输入的审批单
	 * @param 
	 * @return 
	 */
	@Transactional(readOnly = false)
	public Map<String, Object> saveInputReport(String registerName, String phone,
			String email, String address, String noticeGet,
			List<Attachment> attachmentList,String applyName,
			String applyOrgCode,Integer businessId) throws Exception {
		String message;
		Map<String, Object> info = new HashMap<String, Object>();
		ApprovalReport ar = new ApprovalReport();
		String businessName = buBusinessService.getBusinessNameById(businessId);
		ar.setContactName(registerName);
		ar.setContactTele(phone);
		ar.setContactMail(email);
		ar.setContactAddress(address);
		ar.setNoticeGet(noticeGet);
		ar.setBusinessId(businessId);
		ar.setBusinessName(businessName);
		String id = UUIDUtil.genUUID();
		ar.setId(id);
		ar.setFormCode(DateUtils.getDateRandom());
		ar.setApplyTime(DateUtils.getSysDate());
		ar.setCompleteTime(DateUtils.getSysDate());
		//ar.setApplyCreditCode(cu.getCertificateCode());
		ar.setApplyOrgCode(applyOrgCode);
		ar.setApplyName(applyName);
		ar.setCreateTime(DateUtils.getSysDate());
		ar.setSubmitTime(DateUtils.getSysDate());
		ar.setApplyBy(UserUtil.getCurrentUser().getLoginName());
		ar.setReportState(StatuConstant.REPORTSTATU_DSP);
		ar.setStatuBank(StatuConstant.REPORTSTATU_DSP);
		ar.setModifyTime(DateUtils.getSysDate());
		ar.setModifyBy(UserUtil.getCurrentUser().getLoginName());
		ar.setIsfinish(StatuConstant.FINISHSTATU_WBJ);
		List<ApprovalReport> lar = new ArrayList<ApprovalReport>();
		lar.add(ar);
		SqlUtils.setBusinessVerifyCode(lar, approvalReportDao, "1");
		//设置受理日期
		BuBusiness b = buBusinessService.getBuBusinessById(ar.getBusinessId());
		int time_limited = b.getTimeLimited2();
		String dayString = iHasWorkDayService.getHasWorkDay(DateUtils.getDate(),time_limited);
		Date d = DateUtils.parseDate(dayString, "yyyy-MM-dd");
		ar.setFinishEndtime(DateUtils.getDateEnd(d));
		ar.setWarnFlag1("0");
		save(ar);
		if (attachmentList != null && attachmentList.size() > 0) {
			saveReportAttachment(attachmentList, id);
		}
		message = "保存成功";
		info.put("formId", id);
		info.put("msg", message);
		info.put("businessId", businessId);
		return info;
	}

	/**
	 * 保存附件公共方法
	 * 
	 * @param attachList
	 *            statu
	 * @return null
	 */
	public void saveReportAttachment(List<Attachment> attachmentList,String reportId) {
		List<ReportAttachment> ralist = getReportAttachment(reportId);
		if(ralist!=null && ralist.size()>0){
			for (Attachment attach: attachmentList) {
				for (ReportAttachment ra : ralist) {
					if (attach.getId() != null
							&& attach.getId().equals(ra.getDocType())) {
						if (ra.getStatu().equals("1")) {
							reportAttachmentService.delete(ra);
						}
					}else if (attach.getOtherFlag() != null
							&& attach.getOtherFlag().trim()
									.equals(ra.getOtherFlag())) {
						reportAttachmentService.delete(ra);
					 }
					}
				}
		}
		for (int i = 0; i < attachmentList.size(); i++) {
			Attachment attach = attachmentList.get(i);
			//if (attach.getAttachmentId() != null
			//		&& !attach.getAttachmentId().trim().equals("")) {
				ReportAttachment fa = new ReportAttachment();
				fa.setDocId(attach.getAttachmentId());
				fa.setFormId(reportId);
				fa.setDocType(attach.getId());
				fa.setDocName(attach.getDocName());
				fa.setScene(0);
				fa.setCreateTime(DateUtils.getSysDate());
				fa.setFiletypeName(attach.getFiletypeName());
				if (attach.getId() != null && !attach.getId().equals("")) {
					BuAttachmentType bat = buAttachmentTypeService
							.getBuAttachmentTypeById(attach.getId());
					if(bat!=null){
						fa.setDisplayOrder(bat.getFiletypeIndex());
						fa.setCheckType(bat.getCheckType() == null ? "" : bat
								.getCheckType());
						fa.setIslegal(bat.getIsLegal() == null ? "" : bat
								.getIsLegal());
					}

				} else {
					Integer maxOrder = reportAttachmentService
							.getMaxDisplayOrderByFormId(reportId);
					if (maxOrder == null) {
						maxOrder = 0;
					}
					fa.setOtherFlag(attach.getOtherFlag());
					fa.setDisplayOrder(maxOrder + 1);
					fa.setCheckType("0");
					fa.setIslegal("0");
				}
				fa.setDelFlag("1");
				fa.setStatu("1");
				reportAttachmentService.save(fa);
			}
		//}
	}
	
	/**
	 * 更新表单附件状态
	 * @param id
	 * @return 用户对象
	 */
	@Transactional(readOnly = false)
	public void updateFormAttachmentStatu(String formId,List<ReportAttachment> ralist) throws Exception {
		List<FormAttachment> falist = formAttachmentDao.getFormAttachmentByFormId(formId);	
		if(falist!=null && falist.size()>0){
			for(ReportAttachment ra:ralist){
				for(FormAttachment fa:falist){
					if(ra.getDocId()!=null){
						if(fa.getDocId()!=null&&fa.getDocId().equals(ra.getDocId())){
							fa.setStatu(ra.getStatu());
							formAttachmentDao.save(fa);
						}
					}else if(ra.getOtherFlag()!=null&&ra.getOtherFlag().trim().equals("")){
						if(fa.getOtherFlag()!=null&&fa.getOtherFlag().equals(ra.getOtherFlag())){
							fa.setStatu(ra.getStatu());
							formAttachmentDao.save(fa);
						}
					}
				}
			}
		}
 
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
	 * @param flag 内外网标识
	 * @return
	 * @throws Exception
	 */
	public PageImpl getToTransactList(PageRequest pageRequest,Class clazz,SysUser user,boolean flag) throws Exception {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder();
		sql.append("select t.* from approval_report t,pro_instance p where 1=1 ");
		sql.append(" and isfinish != 1 ") ;
		if(flag){//内网
			sql.append(" and t.process_id2 = p.id ");
		}else{
			sql.append(" and t.process_id1 = p.id ");
		}
		sql.append(" and p.del_flag = '1' ");
		//当前操作人
		sql.append(" and p.currentuser = '"+user.getLoginName()+"' ");
		//待办理
		if(flag){//内网
			sql.append(" and t.statu_bank in ( '"+StatuConstant.REPORTSTATU_SPZ+"','"+StatuConstant.REPORTSTATU_DBZ+"') ") ;
		}else{
			sql.append(" and t.statu_bank in ( '"+StatuConstant.REPORTSTATU_DSL+"','"+StatuConstant.REPORTSTATU_DBZ+"','"+
					StatuConstant.REPORTSTATU_CLZ+"','"+StatuConstant.FORMSTATU_YBZ+"','"+StatuConstant.REPORTSTATU_DSP+"') ") ;
		}
	    return ipaginationservice.getPageImpl(sql.toString(), pageRequest, clazz);
	}
	
	/**
	 * 待办结
	 * @param pageRequest
	 * @param clazz
	 * @param user
	 * @param flag
	 * @return
	 * @throws Exception
	 */
	public PageImpl getToFinishList(PageRequest pageRequest,Class clazz,SysUser user,boolean flag) throws Exception {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder();
		sql.append("select t.* from approval_report t,pro_instance p where 1=1 ");
		sql.append(" and isfinish != 1 ") ;
		if(flag){//内网
			sql.append(" and t.process_id2 = p.id ");
		}else{
			sql.append(" and t.process_id1 = p.id ");
		}
		sql.append(" and p.del_flag = '1' ");
		//当前操作人
		sql.append(" and p.currentuser = '"+user.getLoginName()+"' ");
		//审批中
		sql.append(" and t.statu_bank in ( '"+StatuConstant.REPORTSTATU_SPZ+"','"+StatuConstant.REPORTSTATU_YBJ+"') ") ;
	    return ipaginationservice.getPageImpl(sql.toString(), pageRequest, clazz);
	}
	
	/**
	 * 转派
	 * @param id
	 * @return 用户对象
	 */
	@Transactional(readOnly = false)
	public String turnOther(String formId,String applyName,String applyOrgCode,String businessName,String completeTime,int stepId,int userId,String loginName,String operationOpinion) throws Exception {
		String message = save(formId, applyName,applyOrgCode,businessName,completeTime,operationOpinion);
		ApprovalReport ar = getApprovalReport(formId);
		if(message.equals("保存成功")){
			ProInstance pi = processInstanceService.getProInstanceByReportId(formId,ResultConstant.PROCESS_STATUS_QD);
			Timestamp ts = (Timestamp) pi.getCurrentstepTime();
			businessLogService.insertBusinessLog("转派", formId, pi.getCurrentstep(), formId, ts,operationOpinion,ar.getBusinessVerifyCode());
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
	public String passThough(String formId,String applyName,String applyOrgCode,String businessName,String completeTime,String operationOpinion) throws Exception {
		String message = save(formId, applyName,applyOrgCode,businessName,completeTime,operationOpinion);
		if(message.equals("保存成功")){
			ApprovalReport ar = getApprovalReport(formId);
			//办结结论为通过
			updateFinishResult(formId,ResultConstant.FINISH_RESULT_TY,StatuConstant.REPORTSTATU_YBJ,StatuConstant.REPORTSTATU_YBJ);
			//添加操作日志
			ProInstance pi = processInstanceService.getProInstanceByReportId(formId,ResultConstant.PROCESS_STATUS_QD);
			businessLogService.insertBusinessLog("办结通过", formId, pi.getCurrentstep(), formId, DateUtils.getSysTimestamp(),"",ar.getBusinessVerifyCode());
			//将当前流程实例设为第一步骤审核人
			turnToFirstStep(formId,ResultConstant.PROCESS_STATUS_JS);
			message = "请银行前台人员通知企业办结";
		}
		return message;
	}
	
	/**
	 * 办结不通过 
	 * @param id
	 * @return 用户对象
	 */
	@Transactional(readOnly = false)
	public String refuseToPass(String formId,String applyName,String applyOrgCode,String businessName,String completeTime,String operationOpinion) throws Exception {
		String message = save(formId, applyName,applyOrgCode,businessName,completeTime,operationOpinion);
		if(message.equals("保存成功")){
			ApprovalReport ar = getApprovalReport(formId);
			//办结结论为不通过
			updateFinishResult(formId,ResultConstant.FINISH_RESULT_BTY,StatuConstant.REPORTSTATU_YBJ,StatuConstant.REPORTSTATU_YBJ);
			//添加操作日志
			ProInstance pi = processInstanceService.getProInstanceByReportId(formId,ResultConstant.PROCESS_STATUS_QD);
			businessLogService.insertBusinessLog("办结不通过", formId, pi.getCurrentstep(), formId, DateUtils.getSysTimestamp(),"",ar.getBusinessVerifyCode());
			//将当前流程实例设为第一步骤审核人
			turnToFirstStep(formId,ResultConstant.PROCESS_STATUS_JS);
			message = "请银行前台人员通知企业审核不通过";
		}
		return message;
	}
	
	/**
	 * 办结—— —— —— 银行内网前台办结
	 * @param id
	 * @return 用户对象
	 */
	@Transactional(readOnly = false)
	public String afterFinish(String formId,String businessDocumentCode){
	    String message = "请同步在互联网子系统中进行操作";
	    ApprovalReport ar = getApprovalReport(formId);
	    if(businessDocumentCode!=null && !businessDocumentCode.trim().equals("")){
	    	ar.setBusinessDocumentCode(businessDocumentCode);
			businessLogService.insertBusinessLog("办结加业务凭证编码", formId,null, formId, DateUtils.getSysTimestamp(),"",ar.getBusinessVerifyCode());			
	    }
	    ar.setIsfinish(StatuConstant.FINISHSTATU_YBJ);
	    save(ar);
		return message;
	}
	
	/**
	 * 办结—— —— —— 外网加水印
	 * @param id
	 * @return 用户对象
	 */
	@Transactional(readOnly = false)
	public String addPWToFinish(String formId){
	    String message = "";
	    ApprovalForm af = approvalFormDao.findOne(formId);
	    //1.获取附件加水印
	    List<FormAttachment> falist = formAttachmentDao.getFormAttachmentByFormIdAndStatuAndScene(formId,"3",0);
	    List<HasDoc> docs = null;
	    if (falist != null && falist.size() > 0) {
			Set<String> faDocIds = new LinkedHashSet<String>();
			for (FormAttachment fa : falist) {
				String docId = fa.getDocId();
				if (docId != null) {
					faDocIds.add(docId);
				}
			}
			List<String> docIds = new ArrayList<String>(faDocIds.size());
			docIds.addAll(faDocIds);
			docs = hasDocDao.findSomeByIds(docIds);
		}
	    ArrayList<String> inputFiles = new ArrayList<String>();
	    if(docs!=null){
	    	Map<String,String> inputFilesMap = getPdfFileList2Local(formId,docs);
	    	Set<Entry<String, String>> set = inputFilesMap.entrySet();
	    	for(Iterator<Entry<String, String>> iter = set.iterator(); iter.hasNext();){
	    		Entry ientry = (Entry)iter.next();
	    		String value = (String)ientry.getValue();
	    		inputFiles.add(value);
	    	}
		    if(inputFiles.size()>0){
		    	Map<String,String> outputFiles = PageAndWaterMarkUtils.addWaterMarkPageNum2Pdf(inputFiles);
		    	Set oset = outputFiles.entrySet();
		    	for(Iterator iter = oset.iterator(); iter.hasNext();){
		    	   Map.Entry entry = (Map.Entry)iter.next();		    	   
		    	   String key = (String)entry.getKey();
		    	   String value = (String)entry.getValue();
		    	   //批注文件名
		    	   File pdf =new File(value.trim());  		    	   
		           String fileName = pdf.getName(); 
		           
		           HasDoc hd = new HasDoc();
		           hd.setId(UUIDUtil.genUUID());
				   hd.setDocName(hd.getId());
				   hd.setDocSize(new BigDecimal(pdf.length()));
				   hd.setDocSrcName(fileName);
				   hd.setSaveAddr(FileUtils.genSaveFilePath(null, File.separator));
				   
				   String docid = getKey(inputFilesMap,key);
				   FormAttachment srcfa = formAttachmentDao.getFormAttachmentByDocId(docid);
				   FormAttachment fa = new FormAttachment();
				   fa.setDocId(hd.getId());
				   fa.setFormId(srcfa.getFormId());
				   fa.setDocType(srcfa.getDocType());
				   fa.setDocName(hd.getDocName());
				   fa.setScene(1);
				   fa.setCreateTime(DateUtils.getSysDate());
				   fa.setFiletypeName(srcfa.getFiletypeName());
				   fa.setDisplayOrder(srcfa.getDisplayOrder());
				   fa.setOtherFlag(srcfa.getOtherFlag());
				   fa.setCheckType(srcfa.getCheckType());
				   fa.setIslegal(srcfa.getIslegal());
				   fa.setStatu(srcfa.getStatu());
				   fa.setDelFlag(srcfa.getDelFlag());
				   DocAddrInfo dai = docAddrInfoDao.findOne(SysConstant.LOGICADDR);
				   FileUtils.pushLocalFileToRemote(
						   FileUtils.getRootPath()+File.separator + hd.getSaveAddr() + hd.getDocName(), 
							pdf.getAbsolutePath());
				   iHasDocService.saveHasDoc(hd);
				   ReportAttachment ra = BeanMapper.map(fa, ReportAttachment.class);
				   formAttachmentDao.save(fa);
				   reportAttachmentDao.save(ra);
		    	 }

		    }

	    }
	    //2.申请单办结
	    af.setIsfinish(StatuConstant.FINISHSTATU_YBJ);
	    af.setFinishResult(ResultConstant.FINISH_RESULT_TY);
	    af.setFinishTime(DateUtils.getSysDate());
	    af.setStatuBank(StatuConstant.REPORTSTATU_YBJ);
	    af.setStatuCompany(StatuConstant.REPORTSTATU_YBJ);
	    approvalFormDao.save(af);
	    //3.外网审批单办结
	    ApprovalReport ar = getApprovalReport(formId);
	    ar.setIsfinish(StatuConstant.FINISHSTATU_YBJ);
	    ar.setFinishResult(ResultConstant.FINISH_RESULT_TY);
	    ar.setFinishTime(DateUtils.getSysDate());
	    ar.setStatuBank(StatuConstant.REPORTSTATU_YBJ);
	    ar.setStatuCompany(StatuConstant.REPORTSTATU_YBJ);
	    ar.setReportState(StatuConstant.REPORTSTATU_YBJ);
	    save(ar);
	    message ="请银行前台人员，通知企业提交纸质材料，领取办结凭证";
		return message;
	}
	
	
	/**
	 * 在办业务（参与过）
	 * @param pageRequest
	 * @param clazz
	 * @param user
	 * @return
	 * @throws Exception
	 */
	public PageImpl getTransactingList(PageRequest pageRequest,Class clazz,SysUser user,boolean flag) throws Exception {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder();
		sql.append("select * from ");
		sql.append(" (select * from approval_report where 1=1");
		sql.append(" and isfinish != 1 ") ;
		sql.append(" and statu_bank in ( '");
		if(flag){//内网
			sql.append(StatuConstant.REPORTSTATU_SPZ+"','"+StatuConstant.REPORTSTATU_DBZ);
		}else{
			sql.append(StatuConstant.REPORTSTATU_DSL+"','"+StatuConstant.REPORTSTATU_DBZ+"','"+
				StatuConstant.REPORTSTATU_CLZ+"','"+StatuConstant.FORMSTATU_YBZ+"','"+StatuConstant.REPORTSTATU_DSP);
		}
		sql.append("')) t ");
		sql.append(" INNER JOIN ");
		sql.append(" (select report_id,operator_by from business_log where operator_by = '"+user.getLoginName()+"' GROUP BY report_id,operator_by ) b ");
		sql.append(" on t.id = b.report_id ");
		sql.append(" INNER JOIN ");
		sql.append(" ( SELECT p.id pro_instance_id, b.`name` currentuser, p.currentstep_time FROM pro_instance p, sys_user u, bank_user b WHERE p.currentuser = u.login_name and u.id = b.user_id and p.currentuser != '"+user.getLoginName()+"') p ");
		if(flag){//内网
			sql.append(" on t.process_id2 = p.pro_instance_id ");
		}else{
			sql.append(" on t.process_id1 = p.pro_instance_id ");
		}
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
		sql.append(" select id from approval_report where isfinish = '1' ");
		sql.append(" ) group by report_id ,operator_by ) t where operator_by = '"+user.getLoginName()+"') ");
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
				transactBusiness.setBackUser(transactBusiness.getReceiveBy());
				transactBusiness.setBackTime(transactBusiness.getRecieveTime());
			}
			
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		map.put("count", page.getTotalElements());
		return map;
	}
	
	/**
	 * 导出列表
	 * @param pageRequest
	 * @param clazz
	 * @param loginName
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	public PageImpl getExportList(PageRequest pageRequest,Class clazz,String loginName) throws Exception {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder();
		sql.append("select t.* from approval_report t, pro_instance p where t.process_id1 = p.id "
				+ "and t.accept_result = '受理' and isfinish = '0' and p.currentuser = '"+loginName+"' ");
	    return ipaginationservice.getPageImpl(sql.toString(), pageRequest, clazz);
	}
	
	/**
	 * 导入列表
	 * @param pageRequest
	 * @param clazz
	 * @param loginName
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	public PageImpl getImportList(PageRequest pageRequest,Class clazz,String loginName) throws Exception {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder();
		sql.append(" select * from approval_report where statu_bank = '"+StatuConstant.REPORTSTATU_DSP+"' ");
		sql.append("  and export_name = '"+loginName+"' ");
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
			String formCode, String businessName, String statuBank,
			String startDate, String endDate,Integer userId) throws Exception {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder();
		sql.append("select * from approval_report where 1=1 ");
		//可查询的审批单必须启动流程
		if(isInner()){//内网 
			sql.append(" and process_id2 is not null ");
		}else{ //外网
			sql.append(" and process_id1 is not null ");
		}
		//根据用户来判定部门和本部门的业务
		sql.append(" and business_id in ( select b.business_id from bu_dept_business b,sys_dept_role r,sys_user_role u "
				+ "where b.verify_dept_id = r.dept_id and r.role_id = u.role_id and u.user_id = "+userId+" )");
		// 以下代码可能会有sql注入 需要确认
		// 申请编号
		if (!isEmpty(formCode)) {
			sql.append(" and form_code like '%" + formCode + "%' ");
		}
		// 业务名称
		if (!isEmpty(businessName)) {
			sql.append(" and business_name like '%" + businessName + "%' ");
		}
		// 业务状态
		if (!isEmpty(statuBank) &&  !statuBank.equals("全部")) {
			sql.append(" and statu_bank = '" + statuBank + "' ");
		}
		// 提交时间
		if (!isEmpty(startDate) && !isEmpty(endDate)) {
			sql.append(" and DATE_FORMAT(modify_time,'%Y-%m-%d') >='"
					+ startDate
					+ "' and DATE_FORMAT(modify_time,'%Y-%m-%d') <='" + endDate
					+ "' ");
		}
		return ipaginationservice.getPageImpl(sql.toString(), pageRequest,
				clazz);
	}
	
	/**
	 * 审批单状态
	 * @param flag
	 * @return
	 */
	public List<VBankStatus> getBankStatus (boolean flag) throws Exception{
		StringBuffer sb=new StringBuffer();
		sb.append( " select * from v_bank_status where flag in ('3' ");
		//内网  1 外网 2内网 3公共
		if(flag){
			sb.append(", '2'");
		}else{
			sb.append(", '1'");
		}
		sb.append(" )");
		List<Map<String, Object>> statusList = jdbc.queryForList(sb.toString());
		List<VBankStatus> bankStatusList = null ;
		if(statusList!=null && statusList.size()>0){
			bankStatusList =  BeanMapper.mapList(statusList, VBankStatus.class);
		}
		return bankStatusList ;
	}
	
	/**
	 * 判断是否是内网
	 * @param request
	 * @return
	 */
	public boolean isInner(){
		//内网标识
		boolean flag = false ;
		//获取网络标识 1 互联网 2 内网
		DocAddrInfo docAddrInfo = docAddrInfoService.queryById("SD");
		//内网
		if(docAddrInfo != null && docAddrInfo.getRealAddr().equals("2")){
			flag = true ;
		}
		return flag ;
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
	
	
	
	public Map<String,String>  getPdfFileList2Local(String formId,List<HasDoc> docs){
		//当前时间字符串用于区分多用户操作
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String nowStr = sdf.format(new Date());
		String t = Thread.currentThread().getContextClassLoader().getResource("").getPath();
		String delDir = t.substring(0, t.indexOf("WEB-INF")) 
				+ "static" + File.separator + "water" + File.separator;
		//删除过期文件，只保留当天的
		FileUtils.deleteOutdateFolders(delDir, nowStr.substring(0, 8));
		t = delDir + nowStr + File.separator + formId + File.separator;
		//第二步，获取相关附件到本地，位置：WebRoot/static/water/{#nowStr}/attachment/		
		DocAddrInfo dai = docAddrInfoDao.findOne(SysConstant.LOGICADDR);
		Map<String,String> inputFiles = new HashMap<String,String>();
		//if (dai != null) {
			for (HasDoc hd : docs) {
				String file = t + "attachment" + File.separator + hd.getSaveAddr() + hd.getDocName()+".pdf";
				inputFiles.put(hd.getId(),file);
				FileUtils.getRemoteFilesToLocal(
						//ExportImportServiceImpl.getSharedFolderPath(dai) + hd.getSaveAddr() + hd.getDocName(), 
						FileUtils.getRootPath()+File.separator+ hd.getSaveAddr() + hd.getDocName(),
						file);
			}
		//}
		return inputFiles;
	}
 
	//根据map的value获取map的key  
    private String getKey(Map<String,String> map,String value){  
        String key="";  
        for (Map.Entry<String, String> entry : map.entrySet()) {  
            if(value.equals(entry.getValue())){  
                key=entry.getKey();  
            }  
        }  
        return key;  
    }  
}
