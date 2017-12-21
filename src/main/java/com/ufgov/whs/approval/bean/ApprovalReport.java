package com.ufgov.whs.approval.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import javax.persistence.Transient;

/**
 * ApprovalReport entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "approval_report")
public class ApprovalReport implements java.io.Serializable {

	// Fields

	private String id;
	private Integer businessId;
	private String businessName;
	private String applyCode;
	private String applyCreditCode;
	private String applyOrgCode;
	private String applyName;
	private String contactName;
	private String contactTele;
	private String contactMail;
	private String contactAddress;
	private String noticeGet;
	private Date createTime;
	private String applyBy;
	private Date submitTime;
	private String reasonDesc;
	private Date completeTime;
	private Date applyTime;
	private String statuCompany;
	private String statuBank;
	private String modifyBy;
	private Date modifyTime;
	private Date recieveTime;
	private String formCode;
	private String assignReceive;
	private String finishUser ;
	private Date finishTime;
	private String finishResult;
	private Date acceptTime;
	private String acceptResult;
	private String businessVerifyCode;
	private String businessDocumentCode;
	private String isfinish;
	private String receiveBy;
	private String remark;
	private Integer processId1;
	private Integer processId2;
	private Integer processtypeId1;
	private Integer processtypeId2;
	private String reportState;
	private String destroyState;
	private String documentState;
	private String exportName ;
	private Date acceptEndtime;
	private Date finishEndtime;
	private String warnFlag1;
	private String warnFlag2;
	
	private String agent;
	private Date agentTime;
	

	// Constructors

	/** default constructor */
	public ApprovalReport() {
	}

	/** minimal constructor */
	public ApprovalReport(String id, Integer businessId, String businessName,
			String applyName, Date createTime, Date submitTime) {
		this.id = id;
		this.businessId = businessId;
		this.businessName = businessName;
		this.applyName = applyName;
		this.createTime = createTime;
		this.submitTime = submitTime;
	}

	/** full constructor */
	public ApprovalReport(String id, Integer businessId, String businessName,
			String applyCode, String applyCreditCode, String applyOrgCode,
			String applyName, String contactName, String contactTele,
			String contactMail, String contactAddress, String noticeGet,
			Date createTime, String applyBy, Date submitTime,
			String reasonDesc, Date completeTime, Date applyTime,
			String statuCompany, String statuBank, String modifyBy,
			Date modifyTime, Date recieveTime, String formCode,
			String assignReceive, Date finishTime, String finishResult,
			Date acceptTime, String acceptResult, String isfinish,
			String receiveBy, String remark, Integer processId1,
			Integer processId2, Integer processtypeId1, Integer processtypeId2,
			String reportState, String destroyState, String documentState) {
		this.id = id;
		this.businessId = businessId;
		this.businessName = businessName;
		this.applyCode = applyCode;
		this.applyCreditCode = applyCreditCode;
		this.applyOrgCode = applyOrgCode;
		this.applyName = applyName;
		this.contactName = contactName;
		this.contactTele = contactTele;
		this.contactMail = contactMail;
		this.contactAddress = contactAddress;
		this.noticeGet = noticeGet;
		this.createTime = createTime;
		this.applyBy = applyBy;
		this.submitTime = submitTime;
		this.reasonDesc = reasonDesc;
		this.completeTime = completeTime;
		this.applyTime = applyTime;
		this.statuCompany = statuCompany;
		this.statuBank = statuBank;
		this.modifyBy = modifyBy;
		this.modifyTime = modifyTime;
		this.recieveTime = recieveTime;
		this.formCode = formCode;
		this.assignReceive = assignReceive;
		this.finishTime = finishTime;
		this.finishResult = finishResult;
		this.acceptTime = acceptTime;
		this.acceptResult = acceptResult;
		this.isfinish = isfinish;
		this.receiveBy = receiveBy;
		this.remark = remark;
		this.processId1 = processId1;
		this.processId2 = processId2;
		this.processtypeId1 = processtypeId1;
		this.processtypeId2 = processtypeId2;
		this.reportState = reportState;
		this.destroyState = destroyState;
		this.documentState = documentState;
	}

	// Property accessors
	@Id
	@Column(name = "id", unique = true, nullable = false)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "business_id", nullable = false)
	public Integer getBusinessId() {
		return this.businessId;
	}

	public void setBusinessId(Integer businessId) {
		this.businessId = businessId;
	}

	@Column(name = "business_name", nullable = false)
	public String getBusinessName() {
		return this.businessName;
	}

	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}

	@Column(name = "apply_code")
	public String getApplyCode() {
		return this.applyCode;
	}

	public void setApplyCode(String applyCode) {
		this.applyCode = applyCode;
	}

	@Column(name = "apply_credit_code")
	public String getApplyCreditCode() {
		return this.applyCreditCode;
	}

	public void setApplyCreditCode(String applyCreditCode) {
		this.applyCreditCode = applyCreditCode;
	}

	@Column(name = "apply_org_code")
	public String getApplyOrgCode() {
		return this.applyOrgCode;
	}

	public void setApplyOrgCode(String applyOrgCode) {
		this.applyOrgCode = applyOrgCode;
	}

	@Column(name = "apply_name", nullable = false)
	public String getApplyName() {
		return this.applyName;
	}

	public void setApplyName(String applyName) {
		this.applyName = applyName;
	}

	@Column(name = "contact_name")
	public String getContactName() {
		return this.contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	@Column(name = "contact_tele")
	public String getContactTele() {
		return this.contactTele;
	}

	public void setContactTele(String contactTele) {
		this.contactTele = contactTele;
	}

	@Column(name = "contact_mail")
	public String getContactMail() {
		return this.contactMail;
	}

	public void setContactMail(String contactMail) {
		this.contactMail = contactMail;
	}

	@Column(name = "contact_address")
	public String getContactAddress() {
		return this.contactAddress;
	}

	public void setContactAddress(String contactAddress) {
		this.contactAddress = contactAddress;
	}

	@Column(name = "notice_get", length = 1)
	public String getNoticeGet() {
		return this.noticeGet;
	}

	public void setNoticeGet(String noticeGet) {
		this.noticeGet = noticeGet;
	}

	@Column(name = "create_time", nullable = false, length = 19)
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(name = "apply_by")
	public String getApplyBy() {
		return this.applyBy;
	}

	public void setApplyBy(String applyBy) {
		this.applyBy = applyBy;
	}

	@Column(name = "submit_time",length = 19)
	public Date getSubmitTime() {
		return this.submitTime;
	}

	public void setSubmitTime(Date submitTime) {
		this.submitTime = submitTime;
	}

	@Column(name = "reason_desc")
	public String getReasonDesc() {
		return this.reasonDesc;
	}

	public void setReasonDesc(String reasonDesc) {
		this.reasonDesc = reasonDesc;
	}

	@Column(name = "complete_time", length = 19)
	public Date getCompleteTime() {
		return this.completeTime;
	}

	public void setCompleteTime(Date completeTime) {
		this.completeTime = completeTime;
	}

	@Column(name = "apply_time", length = 19)
	public Date getApplyTime() {
		return this.applyTime;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}

	@Column(name = "statu_company")
	public String getStatuCompany() {
		return this.statuCompany;
	}

	public void setStatuCompany(String statuCompany) {
		this.statuCompany = statuCompany;
	}

	@Column(name = "statu_bank")
	public String getStatuBank() {
		return this.statuBank;
	}

	public void setStatuBank(String statuBank) {
		this.statuBank = statuBank;
	}

	@Column(name = "modify_by")
	public String getModifyBy() {
		return this.modifyBy;
	}

	public void setModifyBy(String modifyBy) {
		this.modifyBy = modifyBy;
	}

	@Column(name = "modify_time", length = 19)
	public Date getModifyTime() {
		return this.modifyTime;
	}

	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}

	@Column(name = "recieve_time", length = 19)
	public Date getRecieveTime() {
		return this.recieveTime;
	}

	public void setRecieveTime(Date recieveTime) {
		this.recieveTime = recieveTime;
	}

	@Column(name = "form_code")
	public String getFormCode() {
		return this.formCode;
	}

	public void setFormCode(String formCode) {
		this.formCode = formCode;
	}

	@Column(name = "assign_receive")
	public String getAssignReceive() {
		return this.assignReceive;
	}

	public void setAssignReceive(String assignReceive) {
		this.assignReceive = assignReceive;
	}

	@Column(name = "finish_time", length = 19)
	public Date getFinishTime() {
		return this.finishTime;
	}

	public void setFinishTime(Date finishTime) {
		this.finishTime = finishTime;
	}

	@Column(name = "finish_result")
	public String getFinishResult() {
		return this.finishResult;
	}

	public void setFinishResult(String finishResult) {
		this.finishResult = finishResult;
	}

	@Column(name = "accept_time", length = 19)
	public Date getAcceptTime() {
		return this.acceptTime;
	}

	public void setAcceptTime(Date acceptTime) {
		this.acceptTime = acceptTime;
	}

	@Column(name = "accept_result")
	public String getAcceptResult() {
		return this.acceptResult;
	}

	public void setAcceptResult(String acceptResult) {
		this.acceptResult = acceptResult;
	}

	@Column(name = "isfinish", length = 1)
	public String getIsfinish() {
		return this.isfinish;
	}

	public void setIsfinish(String isfinish) {
		this.isfinish = isfinish;
	}

	@Column(name = "receive_by")
	public String getReceiveBy() {
		return this.receiveBy;
	}

	public void setReceiveBy(String receiveBy) {
		this.receiveBy = receiveBy;
	}

	@Column(name = "remark")
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Column(name = "process_id1")
	public Integer getProcessId1() {
		return this.processId1;
	}

	public void setProcessId1(Integer processId1) {
		this.processId1 = processId1;
	}

	@Column(name = "process_id2")
	public Integer getProcessId2() {
		return this.processId2;
	}

	public void setProcessId2(Integer processId2) {
		this.processId2 = processId2;
	}

	@Column(name = "processtype_id1")
	public Integer getProcesstypeId1() {
		return this.processtypeId1;
	}

	public void setProcesstypeId1(Integer processtypeId1) {
		this.processtypeId1 = processtypeId1;
	}

	@Column(name = "processtype_id2")
	public Integer getProcesstypeId2() {
		return this.processtypeId2;
	}

	public void setProcesstypeId2(Integer processtypeId2) {
		this.processtypeId2 = processtypeId2;
	}

	@Column(name = "report_state")
	public String getReportState() {
		return this.reportState;
	}

	public void setReportState(String reportState) {
		this.reportState = reportState;
	}

	@Column(name = "destroy_state")
	public String getDestroyState() {
		return this.destroyState;
	}

	public void setDestroyState(String destroyState) {
		this.destroyState = destroyState;
	}

	@Column(name = "document_state")
	public String getDocumentState() {
		return this.documentState;
	}

	public void setDocumentState(String documentState) {
		this.documentState = documentState;
	}
	
	@Column(name = "finish_user")
	public String getFinishUser() {
		return finishUser;
	}

	public void setFinishUser(String finishUser) {
		this.finishUser = finishUser;
	}
	@Column(name = "business_verify_code", length = 12)
	public String getBusinessVerifyCode() {
		return businessVerifyCode;
	}

	public void setBusinessVerifyCode(String businessVerifyCode) {
		this.businessVerifyCode = businessVerifyCode;
	}

	@Column(name = "export_name")
	public String getExportName() {
		return exportName;
	}

	public void setExportName(String exportName) {
		this.exportName = exportName;
	}

	public String getBusinessDocumentCode() {
		return businessDocumentCode;
	}

	public void setBusinessDocumentCode(String businessDocumentCode) {
		this.businessDocumentCode = businessDocumentCode;
	}
	
	@Column(name = "accept_endtime")
	public Date getAcceptEndtime() {
		return acceptEndtime;
	}

	public void setAcceptEndtime(Date acceptEndtime) {
		this.acceptEndtime = acceptEndtime;
	}

	@Column(name = "finish_endtime")
	public Date getFinishEndtime() {
		return finishEndtime;
	}

	public void setFinishEndtime(Date finishEndtime) {
		this.finishEndtime = finishEndtime;
	}

	@Column(name = "warn_flag1")
	public String getWarnFlag1() {
		return warnFlag1;
	}

	public void setWarnFlag1(String warnFlag1) {
		this.warnFlag1 = warnFlag1;
	}
	
	@Column(name = "warn_flag2")
	public String getWarnFlag2() {
		return warnFlag2;
	}
	
	public void setWarnFlag2(String warnFlag2) {
		this.warnFlag2 = warnFlag2;
	}
	
	@Transient
	public String getAgent() {
		return agent;
	}

	public void setAgent(String agent) {
		this.agent = agent;
	}
	@Transient
	public Date getAgentTime() {
		return agentTime;
	}

	public void setAgentTime(Date agentTime) {
		this.agentTime = agentTime;
	}

}