package com.ufgov.whs.law.bean;

import static javax.persistence.GenerationType.IDENTITY;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Laws entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "laws")
public class Laws implements java.io.Serializable {

	// Fields

	private Integer id;
	private String lawName;
	private String lawContent;
	private String isPublic;
	private Integer displayOrder;
	private String type;
	private String createBy;
	private Timestamp createDate;
	private String updateBy;
	private Timestamp updateDate;
	private String remarks;
	private String delFlag;

	// Constructors

	/** default constructor */
	public Laws() {
	}

	/** minimal constructor */
	public Laws(String lawName) {
		this.lawName = lawName;
	}

	/** full constructor */
	public Laws(String lawName, String lawContent, String isPublic,
			Integer order, String type, String createBy, Timestamp createDate,
			String updateBy, Timestamp updateDate, String remarks,
			String delFlag) {
		this.lawName = lawName;
		this.lawContent = lawContent;
		this.isPublic = isPublic;
		this.displayOrder = order;
		this.type = type;
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

	@Column(name = "law_name", nullable = false)
	public String getLawName() {
		return this.lawName;
	}

	public void setLawName(String lawName) {
		this.lawName = lawName;
	}

	@Column(name = "law_content")
	public String getLawContent() {
		return this.lawContent;
	}

	public void setLawContent(String lawContent) {
		this.lawContent = lawContent;
	}

	@Column(name = "is_public", length = 1)
	public String getIsPublic() {
		return this.isPublic;
	}

	public void setIsPublic(String isPublic) {
		this.isPublic = isPublic;
	}

	@Column(name = "display_order")
	public Integer getDisplayOrder() {
		return this.displayOrder;
	}

	public void setDisplayOrder(Integer displayOrder) {
		this.displayOrder = displayOrder;
	}

	@Column(name = "type")
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
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

	@Column(name = "del_flag", length = 1)
	public String getDelFlag() {
		return this.delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

}