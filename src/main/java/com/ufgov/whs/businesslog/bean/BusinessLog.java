package com.ufgov.whs.businesslog.bean;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * BusinessLog entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "business_log")
public class BusinessLog implements java.io.Serializable {

	// Fields

	private Integer id;
	private String operatorBy;
	private Timestamp receiveDate;
	private Timestamp endDate;
	private String opertionName;
	private String operationOpinon;
	private String formId;
	private String reportId;
	private String businessVerifyCode ;
	private Integer stepId;

	// Constructors

	/** default constructor */
	public BusinessLog() {
	}

	/** full constructor */
	public BusinessLog(String operatorBy, Timestamp receiveDate,
			Timestamp endDate, String opertionName, String operationOpinon,
			String formId, String reportId) {
		this.operatorBy = operatorBy;
		this.receiveDate = receiveDate;
		this.endDate = endDate;
		this.opertionName = opertionName;
		this.operationOpinon = operationOpinon;
		this.formId = formId;
		this.reportId = reportId;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "operator_by")
	public String getOperatorBy() {
		return this.operatorBy;
	}

	public void setOperatorBy(String operatorBy) {
		this.operatorBy = operatorBy;
	}

	@Column(name = "receive_date", length = 19)
	public Timestamp getReceiveDate() {
		return this.receiveDate;
	}

	public void setReceiveDate(Timestamp receiveDate) {
		this.receiveDate = receiveDate;
	}

	@Column(name = "end_date", length = 19)
	public Timestamp getEndDate() {
		return this.endDate;
	}

	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}

	@Column(name = "opertion_name")
	public String getOpertionName() {
		return this.opertionName;
	}

	public void setOpertionName(String opertionName) {
		this.opertionName = opertionName;
	}

	@Column(name = "operation_opinon")
	public String getOperationOpinon() {
		return this.operationOpinon;
	}

	public void setOperationOpinon(String operationOpinon) {
		this.operationOpinon = operationOpinon;
	}

	@Column(name = "form_id")
	public String getFormId() {
		return this.formId;
	}

	public void setFormId(String formId) {
		this.formId = formId;
	}

	@Column(name = "report_id")
	public String getReportId() {
		return this.reportId;
	}

	public void setReportId(String reportId) {
		this.reportId = reportId;
	}
	
	@Column(name = "step_id")
	public Integer getStepId() {
		return stepId;
	}

	public void setStepId(Integer stepId) {
		this.stepId = stepId;
	}

	@Column(name = "business_verify_code")
	public String getBusinessVerifyCode() {
		return businessVerifyCode;
	}

	public void setBusinessVerifyCode(String businessVerifyCode) {
		this.businessVerifyCode = businessVerifyCode;
	}
	
}