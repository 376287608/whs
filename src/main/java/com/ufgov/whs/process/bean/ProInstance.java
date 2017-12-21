package com.ufgov.whs.process.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * ProInstance entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "pro_instance")
public class ProInstance implements java.io.Serializable {

	// Fields

	private Integer id;
	private String reportId;
	private Integer processId;
	private Integer currentstep;
	private String currentuser;
	private Date currentstepTime;
	private Date startTime;
	private String delFlag;
	private String status;

	// Constructors

	/** default constructor */
	public ProInstance() {
	}

	/** minimal constructor */
	public ProInstance(Integer id, String reportId, Integer processId,
			Integer currentstep) {
		this.id = id;
		this.reportId = reportId;
		this.processId = processId;
		this.currentstep = currentstep;
	}

	/** full constructor */
	public ProInstance(Integer id, String reportId, Integer processId,
			Integer currentstep, String currentuser, Date currentstepTime,
			Date startTime, String delFlag, String status) {
		this.id = id;
		this.reportId = reportId;
		this.processId = processId;
		this.currentstep = currentstep;
		this.currentuser = currentuser;
		this.currentstepTime = currentstepTime;
		this.startTime = startTime;
		this.delFlag = delFlag;
		this.status = status;
	}

	// Property accessors
	@Id
	@Column(name = "id", unique = true, nullable = false)
	@GeneratedValue
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "report_id", nullable = false)
	public String getReportId() {
		return this.reportId;
	}

	public void setReportId(String reportId) {
		this.reportId = reportId;
	}

	@Column(name = "process_id", nullable = false)
	public Integer getProcessId() {
		return this.processId;
	}

	public void setProcessId(Integer processId) {
		this.processId = processId;
	}

	@Column(name = "currentstep", nullable = false)
	public Integer getCurrentstep() {
		return this.currentstep;
	}

	public void setCurrentstep(Integer currentstep) {
		this.currentstep = currentstep;
	}

	@Column(name = "currentuser")
	public String getCurrentuser() {
		return this.currentuser;
	}

	public void setCurrentuser(String currentuser) {
		this.currentuser = currentuser;
	}

	@Column(name = "currentstep_time", length = 19)
	public Date getCurrentstepTime() {
		return this.currentstepTime;
	}

	public void setCurrentstepTime(Date currentstepTime) {
		this.currentstepTime = currentstepTime;
	}

	@Column(name = "start_time", length = 19)
	public Date getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	@Column(name = "del_flag", length = 1)
	public String getDelFlag() {
		return this.delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	@Column(name = "status")
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}