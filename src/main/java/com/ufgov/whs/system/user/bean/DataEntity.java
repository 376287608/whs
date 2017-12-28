package com.ufgov.whs.system.user.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.MappedSuperclass;

import com.ufgov.whs.common.utils.StringUtils;
import com.ufgov.whs.system.user.bean.SysUser;
import com.ufgov.whs.system.utils.UserUtil;

/**
 * 表中公用的数据字段
 * @author fucj
 * @date 2017年9月18日
 */

@MappedSuperclass
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public class DataEntity{
	
	/**
	 * 
	 */
	protected String createBy;	// 创建者
	protected Date createDate;	// 创建日期
	protected String updateBy;	// 更新者
	protected Date updateDate;	// 更新日期
	protected String delFlag; 	// 删除标记（0：正常；1：删除；2：审核）
	protected String remarks;	// 备注	
	
	@Column(name = "remarks",nullable = true)
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	@Column(name = "create_by",nullable = true)
	public String getCreateBy() {
		return createBy;
	}
	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	@Column(name = "create_date",nullable = true)
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	@Column(name = "update_by",nullable = true)
	public String getUpdateBy() {
		return updateBy;
	}
	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}
	@Column(name = "update_date",nullable = true)
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	@Column(name = "del_flag",nullable = true)
	public String getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	
	/**
	 * 插入之前执行方法，需要手动调用
	 */
	public void preInsert(){
		// 不限制ID为UUID，调用setIsNewRecord()使用自定义ID
		SysUser user = UserUtil.getCurrentUser();
		if (StringUtils.isNotBlank(user.getId().toString())){
			this.updateBy = user.getId().toString();
			this.createBy = user.getId().toString();
		}
		this.updateDate = new Date();
		this.createDate = this.updateDate;
	}
	/**
	 * 更新之前执行方法，需要手动调用
	 */
	public void preUpdate(){
		SysUser user = UserUtil.getCurrentUser();
		if (StringUtils.isNotBlank(user.getId().toString())){
			this.updateBy = user.getId().toString();
		}
		this.updateDate = new Date();
	}

}
 