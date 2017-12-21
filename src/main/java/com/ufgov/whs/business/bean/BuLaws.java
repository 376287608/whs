package com.ufgov.whs.business.bean;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * BuLaws entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "bu_laws")
public class BuLaws implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer businessId;
	private Integer lawId;
	private String createBy;
	private Timestamp createDate;
	private String updateBy;
	private Timestamp updateDate;
	private String remarks;

	// Constructors

	/** default constructor */
	public BuLaws() {
	}

	/** minimal constructor */
	public BuLaws(Integer businessId, Integer lawId) {
		this.businessId = businessId;
		this.lawId = lawId;
	}

	/** full constructor */
	public BuLaws(Integer businessId, Integer lawId, String createBy,
			Timestamp createDate, String updateBy, Timestamp updateDate,
			String remarks) {
		this.businessId = businessId;
		this.lawId = lawId;
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

	@Column(name = "business_id", nullable = false)
	public Integer getBusinessId() {
		return this.businessId;
	}

	public void setBusinessId(Integer businessId) {
		this.businessId = businessId;
	}

	@Column(name = "law_id", nullable = false)
	public Integer getLawId() {
		return this.lawId;
	}

	public void setLawId(Integer lawId) {
		this.lawId = lawId;
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