package com.ufgov.whs.process.bean;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * ProStep entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "pro_step")
public class ProStep implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer processId;
	private String stepName;
	private Integer stepOrder;
	private Integer approvalRoleId;
	private String approvalRoleName;
	private String createBy;
	private Date createDate;
	private String updateBy;
	private Date updateDate;
	private String remarks;
	private String delFlag;

	// Constructors

	/** default constructor */
	public ProStep() {
	}

	/** minimal constructor */
	public ProStep(Integer id, Integer processId, Integer businessId,
			String stepName, Integer stepOrder, Integer approvalRoleId,
			String approvalRoleName) {
		this.id = id;
		this.processId = processId;
		this.stepName = stepName;
		this.stepOrder = stepOrder;
		this.approvalRoleId = approvalRoleId;
		this.approvalRoleName = approvalRoleName;
	}

	/** full constructor */
	public ProStep(Integer id, Integer processId, Integer businessId,
			String stepName, Integer stepOrder, Integer approvalRoleId,
			String approvalRoleName, String createBy, Date createDate,
			String updateBy, Date updateDate, String remarks, String delFlag) {
		this.id = id;
		this.processId = processId;
		this.stepName = stepName;
		this.stepOrder = stepOrder;
		this.approvalRoleId = approvalRoleId;
		this.approvalRoleName = approvalRoleName;
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

	@Column(name = "process_id", nullable = false)
	public Integer getProcessId() {
		return this.processId;
	}

	public void setProcessId(Integer processId) {
		this.processId = processId;
	}

	@Column(name = "step_name", nullable = false)
	public String getStepName() {
		return this.stepName;
	}

	public void setStepName(String stepName) {
		this.stepName = stepName;
	}

	@Column(name = "step_order", nullable = false)
	public Integer getStepOrder() {
		return this.stepOrder;
	}

	public void setStepOrder(Integer stepOrder) {
		this.stepOrder = stepOrder;
	}

	@Column(name = "approval_role_id", nullable = false)
	public Integer getApprovalRoleId() {
		return this.approvalRoleId;
	}

	public void setApprovalRoleId(Integer approvalRoleId) {
		this.approvalRoleId = approvalRoleId;
	}

	@Column(name = "approval_role_name", nullable = false)
	public String getApprovalRoleName() {
		return this.approvalRoleName;
	}

	public void setApprovalRoleName(String approvalRoleName) {
		this.approvalRoleName = approvalRoleName;
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