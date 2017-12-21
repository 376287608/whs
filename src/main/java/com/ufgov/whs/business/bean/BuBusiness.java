package com.ufgov.whs.business.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * BuBusiness entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "bu_business")
public class BuBusiness implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer pid;
	private String businessNo;
	private String businessName;
	private Integer businessOrder;
	private Integer timeLimited;
	private Integer timeLimited2;
	private Integer timeLimited3;
	private Integer delayLimited;
	private String filetemplateDocId ;
	private String fileDocId ;
	private String createBy;
	private Date createDate;
	private String updateBy;
	private Date updateDate;
	private String remarks;
	private String isPublic;
	private String delFlag;
	private String endNode;
	private String checked = "false";

	// Constructors

	/** default constructor */
	public BuBusiness() {
	}

	/** minimal constructor */
	public BuBusiness(Integer id, String businessNo, String businessName,
			Integer timeLimited, Integer timeLimited2) {
		this.id = id;
		this.businessNo = businessNo;
		this.businessName = businessName;
		this.timeLimited = timeLimited;
		this.timeLimited2 = timeLimited2;
	}

	/** full constructor */
	public BuBusiness(Integer id, Integer pid, String businessNo,
			String businessName, Integer businessOrder, Integer timeLimited,
			Integer timeLimited2, Integer timeLimited3, Integer delayLimited,
			String createBy, Date createDate, String updateBy, Date updateDate,
			String remarks, String delFlag) {
		this.id = id;
		this.pid = pid;
		this.businessNo = businessNo;
		this.businessName = businessName;
		this.businessOrder = businessOrder;
		this.timeLimited = timeLimited;
		this.timeLimited2 = timeLimited2;
		this.timeLimited3 = timeLimited3;
		this.delayLimited = delayLimited;
		this.createBy = createBy;
		this.createDate = createDate;
		this.updateBy = updateBy;
		this.updateDate = updateDate;
		this.remarks = remarks;
		this.delFlag = delFlag;
	}

	// Property accessors
	@Id
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "pid")
	public Integer getPid() {
		return this.pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	@Column(name = "business_no", nullable = false)
	public String getBusinessNo() {
		return this.businessNo;
	}

	public void setBusinessNo(String businessNo) {
		this.businessNo = businessNo;
	}

	@Column(name = "business_name", nullable = false)
	public String getBusinessName() {
		return this.businessName;
	}

	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}

	@Column(name = "business_order")
	public Integer getBusinessOrder() {
		return this.businessOrder;
	}

	public void setBusinessOrder(Integer businessOrder) {
		this.businessOrder = businessOrder;
	}

	@Column(name = "time_limited", nullable = false)
	public Integer getTimeLimited() {
		return this.timeLimited;
	}

	public void setTimeLimited(Integer timeLimited) {
		this.timeLimited = timeLimited;
	}

	@Column(name = "time_limited2", nullable = false)
	public Integer getTimeLimited2() {
		return this.timeLimited2;
	}

	public void setTimeLimited2(Integer timeLimited2) {
		this.timeLimited2 = timeLimited2;
	}

	@Column(name = "time_limited3")
	public Integer getTimeLimited3() {
		return this.timeLimited3;
	}

	public void setTimeLimited3(Integer timeLimited3) {
		this.timeLimited3 = timeLimited3;
	}

	@Column(name = "delay_limited")
	public Integer getDelayLimited() {
		return this.delayLimited;
	}

	public void setDelayLimited(Integer delayLimited) {
		this.delayLimited = delayLimited;
	}
	
	@Column(name = "filetemplate_doc_id")
	public String getFiletemplateDocId() {
		return filetemplateDocId;
	}

	public void setFiletemplateDocId(String filetemplateDocId) {
		this.filetemplateDocId = filetemplateDocId;
	}

	@Column(name = "file_doc_id")
	public String getFileDocId() {
		return fileDocId;
	}

	public void setFileDocId(String fileDocId) {
		this.fileDocId = fileDocId;
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
	
	@Column(name = "end_node", nullable = false)
	public String getEndNode() {
		return this.endNode;
	}

	public void setEndNode(String endNode) {
		this.endNode = endNode;
	}
	
	@Column(name = "is_public", length = 1)
	public String getIsPublic() {
		return this.isPublic;
	}

	public void setIsPublic(String isPublic) {
		this.isPublic = isPublic;
	}

	@Transient
	public String getChecked() {
		return checked;
	}

	public void setChecked(String checked) {
		this.checked = checked;
	}
}