package com.ufgov.whs.system.resource.bean;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
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

import com.ufgov.whs.system.role.bean.SysRolePermission;

/**
 * SysResource entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "sys_resource")
public class SysResource implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer parentId;
	private String resourceType;
	private String name;
	private Integer sort;
	private String href;
	private String description;
	private String createBy;
	private Timestamp createDate;
	private String updateBy;
	private Timestamp updateDate;
	private String remarks;
	private String delFlag;
	// Constructors

	/** default constructor */
	public SysResource() {
	}

	/** minimal constructor */
	public SysResource(String name) {
		this.name = name;
	}

	/** full constructor */
	public SysResource(Integer parentId, String resourceType, String name,
			Integer sort, String href, String description, String createBy,
			Timestamp createDate, String updateBy, Timestamp updateDate,
			String remarks, String delFlag) {
		this.parentId = parentId;
		this.resourceType = resourceType;
		this.name = name;
		this.sort = sort;
		this.href = href;
		this.description = description;
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

	@Column(name = "parent_id")
	public Integer getParentId() {
		return this.parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	@Column(name = "resource_type")
	public String getResourceType() {
		return this.resourceType;
	}

	public void setResourceType(String resourceType) {
		this.resourceType = resourceType;
	}

	@Column(name = "name", nullable = false)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "sort")
	public Integer getSort() {
		return this.sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	@Column(name = "href")
	public String getHref() {
		return this.href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	@Column(name = "description")
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
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

	public static SysResource toObject(Map<String, Object> map) {  
	    SysResource resource = new SysResource();  
	    resource.setId((Integer) map.get("id"));
	    resource.setName((String) map.get("name"));
	    resource.setResourceType((String) map.get("resource_type"));
	    resource.setParentId((Integer) map.get("parent_id"));
	    //resource.setRolePermissions(<set>);
	    resource.setSort((Integer) map.get("sort"));
	    resource.setHref((String) map.get("href"));
	   // resource.set((String) map.get("state"));
	    resource.setDescription((String) map.get("description"));
	    resource.setRemarks((String) map.get("remarks"));
	    return resource;  
	}  
	  
	public static List<SysResource> toObject(List<Map<String, Object>> lists){  
	    List<SysResource> resources = new ArrayList<SysResource>();  
	    for (Map<String, Object> map : lists) {  
	    	SysResource resource =  SysResource.toObject(map);  
	        if (resource != null) {  
	        	resources.add(resource);  
	        }  
	    }  
	    return resources;  
	}
}