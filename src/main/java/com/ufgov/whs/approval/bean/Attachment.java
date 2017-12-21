package com.ufgov.whs.approval.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * ApprovalForm entity. @author MyEclipse Persistence Tools
 */
public class Attachment implements java.io.Serializable {

	// Fields

	private Integer id;   //bu_attachment_type_id  form_attachment_doctype
	private String attachmentId;
	private String fileType;
	private String docName;
	private String otherFlag;
	private String filetypeName;
	public Attachment(){
		
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAttachmentId() {
		return attachmentId;
	}

	public void setAttachmentId(String attachmentId) {
		this.attachmentId = attachmentId;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public String getDocName() {
		return docName;
	}

	public void setDocName(String docName) {
		this.docName = docName;
	}

	public String getOtherFlag() {
		return otherFlag;
	}

	public void setOtherFlag(String otherFlag) {
		this.otherFlag = otherFlag;
	}

	public String getFiletypeName() {
		return filetypeName;
	}

	public void setFiletypeName(String filetypeName) {
		this.filetypeName = filetypeName;
	}

}