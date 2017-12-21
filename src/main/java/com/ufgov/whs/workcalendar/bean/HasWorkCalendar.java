package com.ufgov.whs.workcalendar.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "HAS_WORKCALENDAR")
public class HasWorkCalendar {
	@Id
	private String id;// 工作日历ID

	@Column(name = "START_DATE")
	private String startDate;// 开始日期

	@Column(name = "END_DATE")
	private String endDate;// 结束日期

	@Column(name = "ONDUTY_TIME")
	private String onDutyTime;

	@Column(name = "OFFDUTY_TIME")
	private String offDutyTime;

	@Column(name = "WORKDAY_TOTAL")
	private int workdayTotal;// 工作日天数

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
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

	public int getWorkdayTotal() {
		return workdayTotal;
	}

	public void setWorkdayTotal(int workdayTotal) {
		this.workdayTotal = workdayTotal;
	}

}
