package com.ufgov.whs.approval.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Transient;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * ReportAttachment entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "report_attachment")
public class ReportAttachment implements java.io.Serializable {

	// Fields

	private Integer id;
	private String formId;
	private Integer docType;
	private String docName;
	private String docId;
	private Integer displayOrder;
	private String islegal;
	private String checkType;
	private Integer scene;
	private String statu;
	private Date createTime;
	private String otherFlag;
	private String filetypeName;
	private String delFlag;
	/**
	 * 上一版本 doc_id
	 */
	private String preVersion ;
	// Constructors

	/** default constructor */
	public ReportAttachment() {
	}

	/** full constructor */
	public ReportAttachment(String formId, Integer docType, String docName,
			String docId, Integer displayOrder, String islegal, String checkType,
			Integer scene, String statu) {
		this.formId = formId;
		this.docType = docType;
		this.docName = docName;
		this.docId = docId;
		this.displayOrder = displayOrder;
		this.islegal = islegal;
		this.checkType = checkType;
		this.scene = scene;
		this.statu = statu;
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

	@Column(name = "form_id")
	public String getFormId() {
		return this.formId;
	}

	public void setFormId(String formId) {
		this.formId = formId;
	}

	@Column(name = "doc_type")
	public Integer getDocType() {
		return this.docType;
	}

	public void setDocType(Integer docType) {
		this.docType = docType;
	}

	@Column(name = "doc_name")
	public String getDocName() {
		return this.docName;
	}

	public void setDocName(String docName) {
		this.docName = docName;
	}

	@Column(name = "doc_id", length = 32)
	public String getDocId() {
		return this.docId;
	}

	public void setDocId(String docId) {
		this.docId = docId;
	}

	@Column(name = "display_order")
	public Integer getDisplayOrder() {
		return this.displayOrder;
	}

	public void setDisplayOrder(Integer displayOrder) {
		this.displayOrder = displayOrder;
	}

	@Column(name = "islegal", length = 1)
	public String getIslegal() {
		return this.islegal;
	}

	public void setIslegal(String islegal) {
		this.islegal = islegal;
	}

	@Column(name = "check_type", length = 1)
	public String getCheckType() {
		return this.checkType;
	}

	public void setCheckType(String checkType) {
		this.checkType = checkType;
	}

	@Column(name = "scene")
	public Integer getScene() {
		return this.scene;
	}

	public void setScene(Integer scene) {
		this.scene = scene;
	}

	@Column(name = "statu", length = 1)
	public String getStatu() {
		return this.statu;
	}

	public void setStatu(String statu) {
		this.statu = statu;
	}
	
    @Column(name = "create_time", nullable = false, length = 19)
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@Column(name = "other_flag")
	public String getOtherFlag() {
		return otherFlag;
	}

	public void setOtherFlag(String otherFlag) {
		this.otherFlag = otherFlag;
	}
	
	@Column(name = "filetype_name")
	public String getFiletypeName() {
		return filetypeName;
	}

	public void setFiletypeName(String filetypeName) {
		this.filetypeName = filetypeName;
	}
	@Column(name = "del_flag", length = 1)
	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	@Transient
	public String getPreVersion() {
		return preVersion;
	}

	public void setPreVersion(String preVersion) {
		this.preVersion = preVersion;
	}
	
}