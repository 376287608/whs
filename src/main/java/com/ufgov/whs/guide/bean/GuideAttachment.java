package com.ufgov.whs.guide.bean;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * GuideAttachment entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "guide_attachment")
public class GuideAttachment implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer guideId;
	private String docName;
	private Integer displayOrder ;
	private String docId;

	// Constructors

	/** default constructor */
	public GuideAttachment() {
	}

	/** full constructor */
	public GuideAttachment(Integer id, Integer guideId, String docName,
			String docId) {
		this.id = id;
		this.guideId = guideId;
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

	@Column(name = "guide_id", nullable = false)
	public Integer getGuideId() {
		return this.guideId;
	}

	public void setGuideId(Integer guideId) {
		this.guideId = guideId;
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