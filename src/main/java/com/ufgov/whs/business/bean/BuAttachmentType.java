package com.ufgov.whs.business.bean;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * BuAttachmentType entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "bu_attachment_type")
public class BuAttachmentType implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer businessId;
	private Integer filetypeIndex;
	private String filename;
	private String isLegal;
	private String checkType;
	private String checktypeDesc;
	private String fileTemplate;
	private String createBy;
	private Date createDate;
	private String updateBy;
	private Date updateDate;
	private String remarks;
	private String delFlag;

	// Constructors

	/** default constructor */
	public BuAttachmentType() {
	}

	/** minimal constructor */
	public BuAttachmentType(Integer businessId) {
		this.businessId = businessId;
	}

	/** full constructor */
	public BuAttachmentType(Integer businessId, Integer filetypeIndex,
			String filetype, String isLegal, String checkType,
			String checktypeDesc, String fileTemplate, String createBy,
			Date createDate, String updateBy, Date updateDate, String remarks,
			String delFlag) {
		this.businessId = businessId;
		this.filetypeIndex = filetypeIndex;
		this.filename = filetype;
		this.isLegal = isLegal;
		this.checkType = checkType;
		this.checktypeDesc = checktypeDesc;
		this.fileTemplate = fileTemplate;
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

	@Column(name = "business_id", nullable = false)
	public Integer getBusinessId() {
		return this.businessId;
	}

	public void setBusinessId(Integer businessId) {
		this.businessId = businessId;
	}

	@Column(name = "filetype_index")
	public Integer getFiletypeIndex() {
		return this.filetypeIndex;
	}

	public void setFiletypeIndex(Integer filetypeIndex) {
		this.filetypeIndex = filetypeIndex;
	}

	@Column(name = "filename")
	public String getFiletype() {
		return this.filename;
	}

	public void setFiletype(String filename) {
		this.filename = filename;
	}

	@Column(name = "is_legal", length = 1)
	public String getIsLegal() {
		return this.isLegal;
	}

	public void setIsLegal(String isLegal) {
		this.isLegal = isLegal;
	}

	@Column(name = "check_type", length = 1)
	public String getCheckType() {
		return this.checkType;
	}

	public void setCheckType(String checkType) {
		this.checkType = checkType;
	}

	@Column(name = "checktype_desc", length = 32)
	public String getChecktypeDesc() {
		return this.checktypeDesc;
	}

	public void setChecktypeDesc(String checktypeDesc) {
		this.checktypeDesc = checktypeDesc;
	}

	@Column(name = "file_template", length = 32)
	public String getFileTemplate() {
		return this.fileTemplate;
	}

	public void setFileTemplate(String fileTemplate) {
		this.fileTemplate = fileTemplate;
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