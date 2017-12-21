package com.ufgov.whs.business.bean;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * BuDeptBusiness entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "bu_dept_business")
public class BuDeptBusiness implements java.io.Serializable {

	// Fields

	private Integer id;
	private BuBusiness buBusiness;
	private String verifyOrgId;
	private String verifyOrgName;
	private String verifyDeptId;
	private String verifyDeptName;
	private String createBy;
	private Timestamp createDate;
	private String updateBy;
	private Timestamp updateDate;
	private String remarks;

	// Constructors

	/** default constructor */
	public BuDeptBusiness() {
	}

	/** minimal constructor */
	public BuDeptBusiness(BuBusiness buBusiness, String verifyDeptId,
			String verifyDeptName) {
		this.buBusiness = buBusiness;
		this.verifyDeptId = verifyDeptId;
		this.verifyDeptName = verifyDeptName;
	}

	/** full constructor */
	public BuDeptBusiness(BuBusiness buBusiness, String verifyOrgId,
			String verifyOrgName, String verifyDeptId, String verifyDeptName,
			String createBy, Timestamp createDate, String updateBy,
			Timestamp updateDate, String remarks) {
		this.buBusiness = buBusiness;
		this.verifyOrgId = verifyOrgId;
		this.verifyOrgName = verifyOrgName;
		this.verifyDeptId = verifyDeptId;
		this.verifyDeptName = verifyDeptName;
		this.createBy = createBy;
		this.createDate = createDate;
		this.updateBy = updateBy;
		this.updateDate = updateDate;
		this.remarks = remarks;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "business_id", nullable = false)
	public BuBusiness getBuBusiness() {
		return this.buBusiness;
	}

	public void setBuBusiness(BuBusiness buBusiness) {
		this.buBusiness = buBusiness;
	}

	@Column(name = "verify_org_id")
	public String getVerifyOrgId() {
		return this.verifyOrgId;
	}

	public void setVerifyOrgId(String verifyOrgId) {
		this.verifyOrgId = verifyOrgId;
	}

	@Column(name = "verify_org_name")
	public String getVerifyOrgName() {
		return this.verifyOrgName;
	}

	public void setVerifyOrgName(String verifyOrgName) {
		this.verifyOrgName = verifyOrgName;
	}

	@Column(name = "verify_dept_id", nullable = false)
	public String getVerifyDeptId() {
		return this.verifyDeptId;
	}

	public void setVerifyDeptId(String verifyDeptId) {
		this.verifyDeptId = verifyDeptId;
	}

	@Column(name = "verify_dept_name", nullable = false)
	public String getVerifyDeptName() {
		return this.verifyDeptName;
	}

	public void setVerifyDeptName(String verifyDeptName) {
		this.verifyDeptName = verifyDeptName;
	}

	@Column(name = "create_by")
	public String getCreateBy() {
		return this.createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	@Column(name = "create_date", length = 19)
	public Timestamp getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Timestamp createDate) {
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
	public Timestamp getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
	}

	@Column(name = "remarks")
	public String getRemarks() {
		return this.remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

}