package com.ufgov.whs.message.bean;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Message entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "message")
public class Message implements java.io.Serializable {

	/**
	 * 
	 */
	//private static final long serialVersionUID = 1L;
	
	// Fields
	private Integer id;
	private String formId;
	private String formCode;
	private String businessName;
	private Date submitTime;
	private String status1;
	private String status2;
	private Date updateTime;
	private String companyLoginName;
	private String bankLoginName;
	private String companyName ;
	private String contantName;
	private Integer businessId ;
	private String readFlag;
	private String delFlag;

	// Constructors

	/** default constructor */
	public Message() {
	}

	/** minimal constructor */
	public Message(String formId, String formCode) {
		this.formId = formId;
		this.formCode = formCode;
	}

	/** full constructor */
	public Message(String formId, String formCode, String businessName,
			Date submitTime, String status1, String status2, Date updateTime,
			String contantName, String readFlag) {
		this.formId = formId;
		this.formCode = formCode;
		this.businessName = businessName;
		this.submitTime = submitTime;
		this.status1 = status1;
		this.status2 = status2;
		this.updateTime = updateTime;
		this.contantName = contantName;
		this.readFlag = readFlag;
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

	@Column(name = "form_id", nullable = false, length = 32)
	public String getFormId() {
		return this.formId;
	}

	public void setFormId(String formId) {
		this.formId = formId;
	}

	@Column(name = "form_code", nullable = false)
	public String getFormCode() {
		return this.formCode;
	}

	public void setFormCode(String formCode) {
		this.formCode = formCode;
	}

	@Column(name = "business_name")
	public String getBusinessName() {
		return this.businessName;
	}

	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}

	@Column(name = "submit_time", length = 19)
	public Date getSubmitTime() {
		return this.submitTime;
	}

	public void setSubmitTime(Date submitTime) {
		this.submitTime = submitTime;
	}

	@Column(name = "status1")
	public String getStatus1() {
		return this.status1;
	}

	public void setStatus1(String status1) {
		this.status1 = status1;
	}

	@Column(name = "status2")
	public String getStatus2() {
		return this.status2;
	}

	public void setStatus2(String status2) {
		this.status2 = status2;
	}

	@Column(name = "update_time", length = 19)
	public Date getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@Column(name = "contant_name")
	public String getContantName() {
		return this.contantName;
	}

	public void setContantName(String contantName) {
		this.contantName = contantName;
	}

	@Column(name = "read_flag", length = 1)
	public String getReadFlag() {
		return this.readFlag;
	}

	public void setReadFlag(String readFlag) {
		this.readFlag = readFlag;
	}

	@Column(name = "company_name")
	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	
	@Column(name = "company_login_name")
	public String getCompanyLoginName() {
		return companyLoginName;
	}

	public void setCompanyLoginName(String companyLoginName) {
		this.companyLoginName = companyLoginName;
	}

	@Column(name = "bank_login_name")
	public String getBankLoginName() {
		return bankLoginName;
	}

	public void setBankLoginName(String bankLoginName) {
		this.bankLoginName = bankLoginName;
	}

	@Column(name = "business_id")
	public Integer getBusinessId() {
		return businessId;
	}

	public void setBusinessId(Integer businessId) {
		this.businessId = businessId;
	}
	
	@Column(name = "del_flag", length = 1)
	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	
	
	
}