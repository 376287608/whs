package com.ufgov.whs.law.bean;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * LawAttachment entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "law_attachment")
public class LawAttachment implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer lawId;
	private String docName;
	private Integer displayOrder ;
	private String docId;

	// Constructors

	/** default constructor */
	public LawAttachment() {
	}

	/** full constructor */
	public LawAttachment(Integer id, Integer lawId, String docName, String docId) {
		this.id = id;
		this.lawId = lawId;
		this.docName = docName;
		this.docId = docId;
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

	@Column(name = "law_id", nullable = false)
	public Integer getLawId() {
		return this.lawId;
	}

	public void setLawId(Integer lawId) {
		this.lawId = lawId;
	}

	@Column(name = "doc_name", nullable = false)
	public String getDocName() {
		return this.docName;
	}

	public void setDocName(String docName) {
		this.docName = docName;
	}

	@Column(name = "doc_id", nullable = false, length = 32)
	public String getDocId() {
		return this.docId;
	}

	public void setDocId(String docId) {
		this.docId = docId;
	}

	@Column(name = "display_order", nullable = false)
	public Integer getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(Integer displayOrder) {
		this.displayOrder = displayOrder;
	}
}