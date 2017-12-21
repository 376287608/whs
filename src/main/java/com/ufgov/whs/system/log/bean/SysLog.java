package com.ufgov.whs.system.log.bean;

import static javax.persistence.GenerationType.IDENTITY;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * SysLog entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "sys_log")
public class SysLog implements java.io.Serializable {

	// Fields

	private Integer id;
	private String operationCode;
	private String opertionName;
	private String createBy;
	private Timestamp createDate;
	private String remoteAddr;
	private String params;
	private Integer executeTime;

	// Constructors

	/** default constructor */
	public SysLog() {
	}

	/** minimal constructor */
	public SysLog(Integer id) {
		this.id = id;
	}

	/** full constructor */
	public SysLog(Integer id, String operationCode, String opertionName,
			String createBy, Timestamp createDate, String remoteAddr,
			String params, Integer executeTime) {
		this.id = id;
		this.operationCode = operationCode;
		this.opertionName = opertionName;
		this.createBy = createBy;
		this.createDate = createDate;
		this.remoteAddr = remoteAddr;
		this.params = params;
		this.executeTime = executeTime;
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

	@Column(name = "operation_code")
	public String getOperationCode() {
		return this.operationCode;
	}

	public void setOperationCode(String operationCode) {
		this.operationCode = operationCode;
	}

	@Column(name = "opertion_name")
	public String getOpertionName() {
		return this.opertionName;
	}

	public void setOpertionName(String opertionName) {
		this.opertionName = opertionName;
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

	@Column(name = "remote_addr")
	public String getRemoteAddr() {
		return this.remoteAddr;
	}

	public void setRemoteAddr(String remoteAddr) {
		this.remoteAddr = remoteAddr;
	}

	@Column(name = "params")
	public String getParams() {
		return this.params;
	}

	public void setParams(String params) {
		this.params = params;
	}

	@Column(name = "execute_time")
	public Integer getExecuteTime() {
		return this.executeTime;
	}

	public void setExecuteTime(Integer executeTime) {
		this.executeTime = executeTime;
	}

}