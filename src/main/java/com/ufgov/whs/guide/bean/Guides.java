package com.ufgov.whs.guide.bean;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Guides entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "guides")
public class Guides implements java.io.Serializable {

	// Fields

	private Integer id;
	private String guidesName;
	private String guidesContent;
	private String isPublic;
	private Integer displayOrder;
//	private String istop;
	private String type;
	private String createBy;
	private Timestamp createDate;
	private String updateBy;
	private Timestamp updateDate;
	private String remarks;
	private String delFlag;

	// Constructors

	/** default constructor */
	public Guides() {
	}

	/** minimal constructor */
	public Guides(String guidesName) {
		this.guidesName = guidesName;
	}

	/** full constructor */
	public Guides(String guidesName, String guidesContent, String isPublic,
			Integer order, String istop, String type, String createBy,
			Timestamp createDate, String updateBy, Timestamp updateDate,
			String remarks, String delFlag) {
		this.guidesName = guidesName;
		this.guidesContent = guidesContent;
		this.isPublic = isPublic;
		this.displayOrder = order;
//		this.istop = istop;
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

	@Column(name = "guides_name", nullable = false)
	public String getGuidesName() {
		return this.guidesName;
	}

	public void setGuidesName(String guidesName) {
		this.guidesName = guidesName;
	}

	@Column(name = "guides_content")
	public String getGuidesContent() {
		return this.guidesContent;
	}

	public void setGuidesContent(String guidesContent) {
		this.guidesContent = guidesContent;
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

	/*@Column(name = "istop", length = 1)
	public String getIstop() {
		return this.istop;
	}

	public void setIstop(String istop) {
		this.istop = istop;
	}*/

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