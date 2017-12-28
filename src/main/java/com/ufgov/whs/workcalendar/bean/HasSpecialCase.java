package com.ufgov.whs.workcalendar.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "HAS_SPECIAL_CASE")
public class HasSpecialCase {
	@Id
	private String id;

	@Column(name = "WC_ID")
	private String wcId;

	@Column(name = "CASE_TYPE")
	private String caseType;

	@Column(name = "CASE_DATE")
	private String caseDate;

	@Column(name = "ONDUTY_TIME")
	private String onDutyTime;

	@Column(name = "OFFDUTY_TIME")
	private String offDutyTime;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getWcId() {
		return wcId;
	}

	public void setWcId(String wcId) {
		this.wcId = wcId;
	}

	public String getCaseType() {
		return caseType;
	}

	public void setCaseType(String caseType) {
		this.caseType = caseType;
	}

	public String getCaseDate() {
		return caseDate;
	}

	public void setCaseDate(String caseDate) {
		this.caseDate = caseDate;
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

}
