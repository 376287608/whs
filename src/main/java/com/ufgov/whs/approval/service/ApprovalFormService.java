package com.ufgov.whs.approval.service;

import java.io.File;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;

import com.ufgov.whs.approval.bean.ApprovalForm;
import com.ufgov.whs.approval.bean.ApprovalReport;
import com.ufgov.whs.approval.bean.Attachment;
import com.ufgov.whs.approval.bean.FormAttachment;
import com.ufgov.whs.approval.bean.ReportAttachment;
import com.ufgov.whs.approval.dao.ApprovalFormDao;
import com.ufgov.whs.approval.dao.ApprovalReportDao;
import com.ufgov.whs.approval.dao.FormAttachmentDao;
import com.ufgov.whs.attachment.bean.DocAddrInfo;
import com.ufgov.whs.attachment.bean.HasDoc;
import com.ufgov.whs.attachment.dao.DocAddrInfoDao;
import com.ufgov.whs.attachment.dao.HasDocDao;
import com.ufgov.whs.attachment.service.IDocAddrInfoService;
import com.ufgov.whs.attachment.service.IExportImportService;
import com.ufgov.whs.attachment.service.IHasDocService;
import com.ufgov.whs.attachment.service.impl.ExportImportServiceImpl;
import com.ufgov.whs.business.bean.BuAttachmentType;
import com.ufgov.whs.business.bean.BuBusiness;
import com.ufgov.whs.business.service.BuAttachmentTypeService;
import com.ufgov.whs.business.service.BuBusinessService;
import com.ufgov.whs.business.service.BusinessService;
import com.ufgov.whs.businesslog.service.BusinessLogService;
import com.ufgov.whs.common.mapper.BeanMapper;
import com.ufgov.whs.common.pagination.impl.IPaginationImpl;
import com.ufgov.whs.common.utils.DateUtils;
import com.ufgov.whs.common.utils.FileUtils;
import com.ufgov.whs.common.utils.PageAndWaterMarkUtils;
import com.ufgov.whs.common.utils.SerializeUtils;
import com.ufgov.whs.common.utils.UUIDUtil;
import com.ufgov.whs.company.bean.CompanyUser;
import com.ufgov.whs.company.dao.CompanyUserDao;
import com.ufgov.whs.company.service.CompanyUserService;
import com.ufgov.whs.message.service.MessageService;
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
import com.ufgov.whs.workcalendar.dao.HasWorkDayDao;
import com.ufgov.whs.workcalendar.service.IHasWorkDayService;
import com.ufgov.whs.process.bean.ProInstance;
import com.ufgov.whs.process.bean.Process;

/**
 * 权限service
 * 
 * @author fucj
 * @date 2015年1月13日
 */
@Service
@Transactional(readOnly = true)
public class ApprovalFormService {

	@Autowired
	private ApprovalFormDao approvalFormDao;

	@Autowired
	private ApprovalReportDao approvalReportDao;

	@Autowired
	JdbcTemplate jdbc;

	@Autowired
	BusinessService businessService;

	@Autowired
	private CompanyUserDao companyUserDao;

	@Autowired
	private IPaginationImpl ipaginationservice;

	@Autowired
	private FormAttachmentService formAttachmentService;

	@Autowired
	ProcessInstanceService processInstanceService;

	@Autowired
	ProcessService processService;

	@Autowired
	ApprovalReportService approvalReportService;

	@Autowired
	ReportAttachmentService reportAttachmentService;

	@Autowired
	BusinessLogService businessLogService;

	@Autowired
	CompanyUserService companyUserService;

	@Autowired
	BuBusinessService buBusinessService;

	@Autowired
	BuAttachmentTypeService buAttachmentTypeService;
	
	@Autowired
	ProStepService  proStepService;
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private HasDocDao hasDocDao;
	
	@Autowired
	private DocAddrInfoDao docAddrInfoDao;
	
	@Autowired
	private IHasDocService iHasDocService;//附件元数据接口
	
	@Autowired
	private IHasWorkDayService iHasWorkDayService;

	
	/**
	 * 按id查询申请单
	 * 
	 * @param id
	 * @return 用户对象
	 */
	public List<FormAttachment> getFormAttachmentAndDelFlag(String formId,String delFlag) {
		return formAttachmentService.getFormAttachmentByFormIdAndDelFlag(formId,delFlag);
	}

	/**
	 * 删除申请表单
	 * 
	 * @param id
	 */
	@Transactional(readOnly = false)
	public void delete(Integer id) {
		approvalFormDao.delete(id);
	}

	/**
	 * 按id及statu查询申请单
	 * 
	 * @param id
	 *            ,statu
	 * @return 用户对象
	 */
	public List<FormAttachment> getFormAttachment(String formId, String statu) {
		return formAttachmentService.getFormAttachmentByFormIdAndStatu(formId,
				statu);
	}

	/**
	 * 保存申请单
	 * 
	 * @param id
	 * @return 用户对象
	 */
	@Transactional(readOnly = false)
	public void save(ApprovalForm af) {
		approvalFormDao.save(af);
	}
	
	@Transactional(readOnly = false)
	public List<Process> getProcessList(Integer businessId) throws Exception {
		BankUser bu = UserUtil.getCurrentBankUser();
		Integer deptId = bu.getDeptId();
		List<Process> plist = processService.getProcessByBusinessId(businessId,deptId);
		return plist;
	}
	
	@Transactional(readOnly = false)
	public String recieve(String formId,Integer processId) throws ParseException {
		String message = "接收成功";
		// 接收并启动流程
		ApprovalForm af = get(formId);
		String status1 = af.getStatuCompany();
		af.setRecieveTime(DateUtils.getSysDate());
		af.setReceiveBy(UserUtil.getCurrentUser().getLoginName());
		af.setApplyTime(DateUtils.getSysDate());
		//af.setReceiveBy("majq");
		af.setStatuCompany(StatuConstant.FORMSTATU_RECEIVE);
		ApprovalReport ar = BeanMapper.map(af, ApprovalReport.class);
		String attachstatu = "1";
		List<FormAttachment> falist = getFormAttachment(formId, attachstatu);
		List<ReportAttachment> ralist = BeanMapper.mapList(falist,
				ReportAttachment.class);
		Process p = processService.getProcessById(processId);
		if (p == null) {
			message = "当前业务未设置审批流程，请核对";
			return message;
		}
		Integer pid = processInstanceService.startInstance(ar.getId(), p);
		save(af);
		ar.setProcessId1(pid);
		ar.setProcesstypeId1(p.getId());
		ar.setStatuBank(StatuConstant.REPORTSTATU_DSL);
		ar.setReportState(StatuConstant.REPORTSTATU_DSL);
		ar.setStatuCompany(StatuConstant.FORMSTATU_RECEIVE);
		ar.setIsfinish(StatuConstant.FINISHSTATU_WBJ);
		//设置受理日期
		BuBusiness b = buBusinessService.getBuBusinessById(af.getBusinessId());
		int time_limited = b.getTimeLimited();
		String dayString = iHasWorkDayService.getHasWorkDay(DateUtils.getDate(),time_limited);
		Date d = DateUtils.parseDate(dayString, "yyyy-MM-dd");
		ar.setAcceptEndtime(DateUtils.getDateEnd(d));
		ar.setWarnFlag1("0");
		approvalReportService.save(ar);
		reportAttachmentService.save(ralist);
		businessLogService.generateBusinessLog("启动预审批", af.getId(), ar.getId(),ar.getBusinessVerifyCode());
		messageService.updateNotReadMessage(formId);
		messageService.insertMessage(formId, af.getFormCode(), af.getBusinessName(), af.getSubmitTime(), status1, af.getStatuCompany(), DateUtils.getSysDate(), af.getContactName(), "0",af.getApplyBy(),af.getApplyName(),UserUtil.getCurrentUser().getLoginName(),af.getBusinessId());
		//int stepId = proStepService.getFirstStep(p.getId()).getId();
		//String stepName = proStepService.getFirstStep(p.getId()).getStepName();
		//businessLogService.insertBusinessLog(stepName, formId, stepId, ar.getId());
		return message;
	}

	@Transactional(readOnly = false)
	public String withdraw(String formId) {
		String message;
		ApprovalForm af = get(formId);
		String status = af.getStatuCompany();
		if (status.equals(StatuConstant.FORMSTATU_SUBMIT)) {
			af.setStatuCompany(StatuConstant.FORMSTATU_SAVE);
			message = "撤回完成";
		} else {
			message = "撤回失败";
		}
		return message;
	}
	
	@Transactional(readOnly = false)
	public String turnback(String formId) {
		//退回
		ApprovalForm af = get(formId);
		messageService.updateNotReadMessage(formId);
		messageService.insertMessage(formId, af.getFormCode(), af.getBusinessName(), af.getSubmitTime(), af.getStatuCompany(), StatuConstant.FORMSTATU_RETURN, DateUtils.getSysDate(), af.getContactName(), "0",af.getApplyBy(),af.getApplyName(),UserUtil.getCurrentUser().getLoginName(),af.getBusinessId());
		af.setStatuCompany(StatuConstant.FORMSTATU_RETURN);
		save(af);
		String message="业务申请已退回给企业";
		return message;
	}

	@Transactional(readOnly = false)
	public String turnOther(String formId,String loginName) {
		//退回
		ApprovalForm af = get(formId);
		//af.setAssignReceive(loginName);
		af.setReceiveBy(loginName);
		save(af);
		String message="业务分派成功";
		return message;
	}
	
	@Transactional(readOnly = false)
	public String recall(String formId) {
		String message;
		ApprovalForm af = get(formId);
		String status = af.getStatuCompany();
		if (status.equals(StatuConstant.FORMSTATU_RECEIVE)
				|| status.equals(StatuConstant.FORMSTATU_ADDITION)
				|| status.equals(StatuConstant.FORMSTATU_YBZ)) {
			af.setStatuCompany(StatuConstant.FORMSTATU_RECALL);
			message = "撤销成功";
		} else {
			message = "该单据无法撤销";
		}
		return message;
	}

	@Transactional(readOnly = false)
	public String submit(Integer userId, String formId, Integer businessId,
			String registerName, String phone, String email, String address,
			String noticeGet, List<Attachment> attachmentList) throws Exception {
		String message = "fail";
		Map<String, Object> info = save(userId, formId, businessId,
				registerName, phone, email, address, noticeGet, attachmentList);
		if (isWorkTimeSubmit()) {
			if (formId == null || formId.trim().equals("")) {
				formId = (String) info.get("formId");
			}
			ApprovalForm af = get(formId);
			if (af.getStatuCompany().equals(StatuConstant.FORMSTATU_ADDITION)) {
				// 1 提交 单据状态改为已补正
				af.setStatuCompany(StatuConstant.FORMSTATU_YBZ);
				af.setCompleteTime(DateUtils.getSysDate());
				af.setSubmitTime(DateUtils.getSysDate());
				save(af);
				// 2.将审核未通过的附件复制到审批单的附件列表中
				String attachstatu = "1";
				List<FormAttachment> falist = getFormAttachment(formId,
						attachstatu);
				// 3.审批单状态改为已补正
				ApprovalReport ar = approvalReportService.getApprovalReport(formId);
				ar.setStatuCompany(StatuConstant.FORMSTATU_YBZ);
				ar.setStatuBank(StatuConstant.FORMSTATU_YBZ);
				ar.setReportState(StatuConstant.FORMSTATU_YBZ);
				ar.setCompleteTime(DateUtils.getSysDate());
				ar.setSubmitTime(DateUtils.getSysDate());
				//设置警告日期
				BuBusiness b = buBusinessService.getBuBusinessById(ar.getBusinessId());
				int time_limited = b.getTimeLimited();
				String dayString = iHasWorkDayService.getHasWorkDay(DateUtils.getDate(),time_limited);
				Date d = DateUtils.parseDate(dayString, "yyyy-MM-dd");
				ar.setAcceptEndtime(DateUtils.getDateEnd(d));
				ar.setWarnFlag1("0");
				
				approvalReportService.save(ar);
				if(falist!=null && falist.size()>0){
					//4.修改的已经审批过的未通过的附件设置删除标记，未修改的不做删除
					updateReportAttachmentDelFlag(falist,formId);	
					//5.将新上传的保存到附件列表
					List<ReportAttachment> ralist = BeanMapper.mapList(falist,
							ReportAttachment.class);
					reportAttachmentService.save(ralist);
				}
				//流程设为启动
				ProInstance pi = processInstanceService.getProInstanceByReportId(formId,ResultConstant.PROCESS_STATUS_ZT);
				if(pi!=null){
					pi.setStatus(ResultConstant.PROCESS_STATUS_QD);
					processInstanceService.save(pi);	
				}
				message = "提交成功";
			} else {
				af.setStatuCompany(StatuConstant.FORMSTATU_SUBMIT);
				af.setSubmitTime(DateUtils.getSysDate());
				af.setCompleteTime(DateUtils.getSysDate());
				af.setFormCode(DateUtils.getDateRandom());
				String userName = getAssignRecieve(af.getBusinessId(),SysConstant.ACCEPT_ROLE);
				af.setAssignReceive(userName);
				af.setReceiveBy(userName);
				//af.setAssignReceive("majq");
				//af.setReceiveBy("majq");
				save(af);
				message = "您申请的业务已经提交给国家外汇管理局中关村国家自主创新示范区中心支局，请等待处理";
			}
		} else {
			message = "请您在法定工作日早9点—16点30时段内提交。";
		}
		return message;
	}

	@Transactional(readOnly = false)
	public Map<String, Object> save(Integer userId, String formId,
			Integer businessId, String registerName, String phone,
			String email, String address, String noticeGet,
			List<Attachment> attachmentList) throws Exception {
		String message="fail";
		Map<String, Object> info = new HashMap<String, Object>();
		if (formId != null && !formId.trim().equals("")) {
			info.put("formId", formId);
			String loginName = UserUtil.getCurrentLoginUser().getLoginName();
			ApprovalForm af = get(formId);
			af.setContactName(registerName);
			af.setContactTele(phone);
			af.setContactMail(email);
			af.setContactAddress(address);
			af.setNoticeGet(noticeGet);
			af.setModifyTime(DateUtils.getSysDate());
			af.setModifyBy(loginName);
			af.setIsfinish(StatuConstant.FINISHSTATU_WBJ);
			save(af);
			// totest
			List<FormAttachment> falist = getFormAttachmentAndDelFlag(formId,"1");
			if (attachmentList != null && attachmentList.size() > 0) {
				for (int i = attachmentList.size() - 1; i >= 0; i--) {
					Attachment attach = attachmentList.get(i);
					for (FormAttachment fa : falist) {
						if(attach.getAttachmentId()!=null && !attach.getAttachmentId().trim().equals("")){
							if(attach.getAttachmentId().trim().equals("null")){
								attachmentList.remove(attach);
								break;
							}
							if(fa.getDocId()!=null && !fa.getDocId().trim().equals("")){
								if(fa.getDocId().equals(attach.getAttachmentId())){
									attachmentList.remove(attach);
									break;
								}
							}
						}
					}
				}
				/*for (int i= attachmentList.size()-1;i>=0;i-- ) {
					Attachment attach = attachmentList.get(i);
					for (FormAttachment fa : falist) {
						if(attach.getAttachmentId()!=null && !attach.getAttachmentId().trim().equals("")
								&&!attach.getAttachmentId().trim().equals("null")){
							if(fa.getDocId()!=null && !fa.getDocId().trim().equals("")){
								if(fa.getDocId().equals(attach.getAttachmentId())){
									attachmentList.remove(attach);
									break;
								}
							}
						}
						else{
							if (attach.getId() != null
									&& attach.getId().equals(fa.getDocType())) {
								if (fa.getStatu().equals("1")) {
									formAttachmentService.delete(fa);
								}
							}else if (attach.getOtherFlag() != null
									&& attach.getOtherFlag().trim()
											.equals(fa.getOtherFlag())) {
								formAttachmentService.delete(fa);
							}
						}
					}
				}*/
				if (attachmentList != null && attachmentList.size() > 0) {
					saveFormAttachment(attachmentList, formId);
				}
			}
		} else {
			ApprovalForm af = new ApprovalForm();
			String businessName = buBusinessService
					.getBusinessNameById(businessId);
			af.setContactName(registerName);
			af.setContactTele(phone);
			af.setContactMail(email);
			af.setContactAddress(address);
			af.setNoticeGet(noticeGet);
			af.setBusinessId(businessId);
			af.setBusinessName(businessName);
			String id = UUIDUtil.genUUID();
			af.setId(id);
			af.setFormCode(DateUtils.getDateRandom());
			CompanyUser cu = companyUserService.getByUserId(userId);
			// af.setApplyCode(cu.getUserId().toString());
			af.setApplyCreditCode(cu.getCertificateCode());
			af.setApplyOrgCode(cu.getOrgBarcode());
			af.setApplyName(cu.getCompanyName());
			af.setCreateTime(DateUtils.getSysDate());
			af.setApplyBy(cu.getOrgBarcode());
			af.setStatuCompany(StatuConstant.FORMSTATU_SAVE);
			af.setModifyTime(DateUtils.getSysDate());
			af.setModifyBy(cu.getOrgBarcode());
			af.setIsfinish(StatuConstant.FINISHSTATU_WBJ);
			save(af);
			if (attachmentList != null && attachmentList.size() > 0) {
				saveFormAttachment(attachmentList, id);
			}
			info.put("formId", id);
		}
		message = "您的业务申请已经保存，等待提交";
		info.put("msg", message);
		return info;
	}

	/**
	 * 保存附件公共方法
	 * 
	 * @param attachList
	 *            statu
	 * @return null
	 */
	public void saveFormAttachment(List<Attachment> attachmentList,
			String formId) {
		List<FormAttachment> falist = getFormAttachmentAndDelFlag(formId,"1");
		if(falist!=null && falist.size()>0){
			for (Attachment attach: attachmentList) {
				for (FormAttachment fa : falist) {
					if (attach.getId() != null
							&& attach.getId().equals(fa.getDocType())) {
						if (fa.getStatu().equals("1")) {
							formAttachmentService.delete(fa);
						}else if(fa.getStatu().equals("2")){
							fa.setDelFlag("0");
							formAttachmentService.save(fa);
						}
					}else if (attach.getOtherFlag() != null
							&& attach.getOtherFlag().trim()
									.equals(fa.getOtherFlag())) {
						if (fa.getStatu().equals("1")) {
							formAttachmentService.delete(fa);
						}else if(fa.getStatu().equals("2")){
							fa.setDelFlag("0");
							formAttachmentService.save(fa);
						}
						//formAttachmentService.delete(fa);
					 }
					}
				}
		}
		for (int i = 0; i < attachmentList.size(); i++) {
			Attachment attach = attachmentList.get(i);
			//if (attach.getAttachmentId() != null
			//		&& !attach.getAttachmentId().trim().equals("")) {
				FormAttachment fa = new FormAttachment();
				fa.setDocId(attach.getAttachmentId());
				fa.setFormId(formId);
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

				}
				else {
					 if(attach.getOtherFlag() != null && !attach.getOtherFlag().equals("")){
							FormAttachment ff = formAttachmentService.getOneOtherFlag(formId,attach.getOtherFlag());
							if(ff!=null){
								fa.setDisplayOrder(ff.getDisplayOrder());	
							}else{
								Integer maxOrder = formAttachmentService
										.getMaxDisplayOrderByFormId(formId);
								if (maxOrder == null) {
									maxOrder = 0;
								}
								fa.setDisplayOrder(maxOrder + 1);
							}
							fa.setOtherFlag(attach.getOtherFlag());
							fa.setCheckType("0");
							fa.setIslegal("0");
					}
				}
				fa.setStatu("1");
				fa.setDelFlag("1");
				formAttachmentService.save(fa);
			}
		//}
	}

	/**
	 * 按id查询申请单附件
	 * 
	 * @param id
	 * @return 申请单
	 */
	public ApprovalForm get(String id) {
		return approvalFormDao.findOne(id);
	}

	/**
	 * 分配业务接收人员 --查找已经分配的最少的
	 * 
	 * @param businessId
	 *            业务id
	 * @param rolename
	 *            角色名
	 */

	public String getAssignRecieve(Integer businessId, String rolename) {
		List<VBankUser> sulist = businessService.getAcceptUserBy(businessId,
				rolename);
		String username = "";
		int min = Integer.MAX_VALUE;
		if (sulist != null && sulist.size() > 0) {
			for (VBankUser su : sulist) {
				int count = approvalFormDao.countByAssignReceive(su
						.getLoginName());
				if (count < min) {
					min = count;
					username = su.getLoginName();
				}
			}
		}
		return username;
	}

	/**
	 * 判断是否在工作时间提交
	 */
	public boolean isWorkTimeSubmit() {
		String currenttime = DateUtils.getDateTime();
		StringBuilder sql = new StringBuilder();
		sql.append("select * from has_workday where '");
		sql.append(currenttime);
		sql.append("'>=onduty_time and '");
		sql.append(currenttime);
		sql.append("'<=offduty_time ");
		List<Map<String, Object>> dayList = jdbc.queryForList(sql.toString());
		if (dayList != null && dayList.size() > 0) {
			return true;
		}
		return true;
	}

	/**
	 * 更新删除标记
	 */	
	public void updateReportAttachmentDelFlag(List<FormAttachment> falist,String formId){
		for(FormAttachment fa:falist){
			if(fa.getDocType()!=null){
				List<ReportAttachment> ralist = reportAttachmentService.getReportAttachmentByIdAndDocType(formId, fa.getDocType(), "1");
				if(ralist!=null&&ralist.size()>0){
					for(ReportAttachment ra:ralist){
						ra.setDelFlag("0");
						reportAttachmentService.save(ra);
					}
				}
			}else if(fa.getOtherFlag() != null&& !fa.getOtherFlag().trim().equals("")){
				List<ReportAttachment> ralist = reportAttachmentService.getReportAttachmentByIdAndOtherFlag(formId, fa.getOtherFlag(), "1");
				if(ralist!=null&&ralist.size()>0){
					for(ReportAttachment ra:ralist){
						ra.setDelFlag("0");
						reportAttachmentService.save(ra);
					}
				}
			}
		}
	
	}

	/**
	 * 创建分页请求对象
	 * 
	 * @param pageNumber
	 *            当前页码
	 * @param pagzSize
	 *            显示条数
	 * @param sortType
	 *            排序类型
	 * @param sortField
	 *            排序字段
	 * @return
	 */
	public PageRequest buildPageRequest(int pageNumber, int pagzSize,
			String sortType, String sortField) {
		Sort sort = null;
		List<String> orders = new ArrayList<String>();
		orders.add(sortField);
		if ("desc".equalsIgnoreCase(sortType)) {
			sort = new Sort(Direction.DESC, orders);
		} else {
			sort = new Sort(Direction.ASC, orders);
		}
		return new PageRequest(pageNumber - 1, pagzSize, sort);
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
	 * @param user
	 *            当前用户
	 * @return
	 * @throws Exception
	 */
	public PageImpl getFindAll(PageRequest pageRequest, Class clazz,
			String formCode, String businessName, String statuCompany,
			String startDate, String endDate, SysUser user) throws Exception {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder();
		sql.append("select * from approval_form where apply_by ='"
				+ user.getLoginName() + "' ");
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
		if (!isEmpty(statuCompany) && !statuCompany.equals("全部")) {
			sql.append(" and statu_company = '" + statuCompany + "' ");
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
	 * 获取分页数据 包括记录和条数
	 * @param pageRequest
	 * @param clazz
	 * @param user
	 * @param flag 0待接收 1已退回
	 * @return
	 * @throws Exception
	 */
	public PageImpl getFindAll(PageRequest pageRequest, Class clazz,
			SysUser user,String flag) throws Exception {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder();
		sql.append("select * from approval_form where receive_by ='"
				+ user.getLoginName() + "' ");
		if(!StringUtils.isBlank(flag) && flag.equals("0")){
			sql.append(" and statu_company = '" + StatuConstant.FORMSTATU_SUBMIT
					+ "'");
		}else if(!StringUtils.isBlank(flag) && flag.equals("1")){
			sql.append(" and statu_company = '" + StatuConstant.FORMSTATU_RETURN
					+ "'");
		}
		return ipaginationservice.getPageImpl(sql.toString(), pageRequest,
				clazz);
	}
	
	/**
	 * 人工分派 获取分页数据 包括记录和条数
	 * @param pageRequest
	 * @param clazz
	 * @return
	 * @throws Exception
	 */
	public PageImpl getAllArtificial(PageRequest pageRequest, Class clazz,Integer userId) throws Exception {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder();
		sql.append(" select t.id,t.form_code formCode,t.business_Name businessName,t.business_id businessId,t.apply_Name applyName,"
				+ "t.contact_Name contactName,t.contact_Tele contactTele,bu.`name` receiveBy,t.statu_Company statuCompany,t.submit_time from ");
		sql.append(" approval_form t, ");
		sql.append(" bu_dept_business b, ");
		sql.append(" sys_dept_role d, ");
		sql.append(" sys_user_role u, ");
		sql.append(" sys_user u2, ");
		sql.append(" bank_user bu ");
		sql.append(" where t.business_id = b.business_id ");
		sql.append(" and b.verify_dept_id = d.dept_id ");
		sql.append(" and d.role_id = u.role_id ");
		sql.append(" and t.receive_by = u2.login_name ");
		sql.append(" and u2.id = bu.user_id ");
		sql.append(" and u.user_id = "+userId+" ");
		sql.append(" and t.statu_company = '" + StatuConstant.FORMSTATU_SUBMIT + "'");
		return ipaginationservice.getPageImpl(sql.toString(), pageRequest,
				clazz);
	}

	/**
	 * 判断字符串是否为空
	 * 
	 * @param str
	 * @return
	 */
	public boolean isEmpty(String str) {
		if (str == null || str.trim().isEmpty()) {
			return true;
		}
		return false;
	}

	/**
	 * 得到分页信息数据
	 * 
	 * @param page
	 * @return
	 */
	public Map<String, Object> getPageInfo(Page<ApprovalForm> page) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", page.getContent());
		map.put("count", page.getTotalElements());
		return map;
	}

	/**
	 * 根据id查找申请单
	 * 
	 * @param id
	 * @return
	 */
	public ApprovalForm getById(String id) {
		return approvalFormDao.findOne(id);
	}

	/**
	 * 待接收业务
	 * 
	 * @param loginName
	 * @return
	 */
	public List<ApprovalForm> getToReceive(String loginName) throws Exception {
		return approvalFormDao.getToReceive(loginName);
	}

}
