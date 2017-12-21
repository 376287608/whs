package com.ufgov.whs.process.bean;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Process entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "process")
public class Process implements java.io.Serializable {

	// Fields

	private Integer id;
	private String processName;
	private String processType;
	private Integer orgId;
	private Integer verifyLevel;
	private String createBy;
	private Date createDate;
	private String updateBy;
	private Date updateDate;
	private String remarks;
	private String delFlag;

	// Constructors

	/** default constructor */
	public Process() {
	}

	/** minimal constructor */
	public Process(Integer id, Integer orgId, Integer verifyLevel) {
		this.id = id;
		this.orgId = orgId;
		this.verifyLevel = verifyLevel;
	}

	/** full constructor */
	public Process(Integer id, String processName, String processType,
			Integer orgId, Integer verifyLevel, String createBy,
			Date createDate, String updateBy, Date updateDate, String remarks,
			String delFlag) {
		this.id = id;
		this.processName = processName;
		this.processType = processType;
		this.orgId = orgId;
		this.verifyLevel = verifyLevel;
		this.createBy = createBy;
		this.createDate = createDate;
		this.updateBy = updateBy;
		this.updateDate = updateDate;
		this.remarks = remarks;
		this.delFlag = delFlag;
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

	@Column(name = "process_name")
	public String getProcessName() {
		return this.processName;
	}

	public void setProcessName(String processName) {
		this.processName = processName;
	}

	@Column(name = "process_type", length = 1)
	public String getProcessType() {
		return this.processType;
	}

	public void setProcessType(String processType) {
		this.processType = processType;
	}

	@Column(name = "org_id", nullable = false)
	public Integer getOrgId() {
		return this.orgId;
	}

	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
	}

	@Column(name = "verify_level", nullable = false)
	public Integer getVerifyLevel() {
		return this.verifyLevel;
	}

	public void setVerifyLevel(Integer verifyLevel) {
		this.verifyLevel = verifyLevel;
	}

	@Column(name = "create_by")
	public String getCreateBy() {
		return this.createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	@Column(name = "create_date", length = 19)
	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Column(name = "update_by")
	public String getUpdateBy() {
		return this.updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	@Column(name = "update_date", length = 19)
	public Date getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	@Column(name = "remarks")
	public String getRemarks() {
		return this.remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	@Column(name = "del_flag", length = 1)
	public String getDelFlag() {
		return this.delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

}