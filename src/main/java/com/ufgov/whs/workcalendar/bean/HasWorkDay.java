package com.ufgov.whs.workcalendar.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.springframework.data.annotation.Transient;

@Entity
@Table(name = "HAS_WORKDAY")
public class HasWorkDay implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@EmbeddedId
	private WorkDayPK id;

	@Column(name = "WORK_DATE")
	private String workDate;

	@Column(name = "ONDUTY_TIME")
	private String onDutyTime;

	@Column(name = "OFFDUTY_TIME")
	private String offDutyTime;
	
	private int rowNo;

	public WorkDayPK getId() {
		return id;
	}

	public void setId(WorkDayPK id) {
		this.id = id;
	}

	public String getWorkDate() {
		return workDate;
	}

	public void setWorkDate(String workDate) {
		this.workDate = workDate;
	}

	public String getOnDutyTime() {
		return onDutyTime;
	}

	public void setOnDutyTime(String onDutyTime) {
		this.onDutyTime = onDutyTime;
	}

	public String getOffDutyTime() {
		return offDutyTime;
	}

	public void setOffDutyTime(String offDutyTime) {
		this.offDutyTime = offDutyTime;
	}
	
	@Transient
	public int getRowNo() {
		return rowNo;
	}

	public void setRowNo(int rowNo) {
		this.rowNo = rowNo;
	}

}
