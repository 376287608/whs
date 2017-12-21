package com.ufgov.whs.workcalendar.bean;

import java.io.Serializable;

import javax.persistence.Column;

public class WorkDayPK implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Column(name = "ID")
	private String id;
	@Column(name = "WORK_INDEX")
	private int workIndex;

	public WorkDayPK() {
	}

	public WorkDayPK(String id, int workIndex) {
		this.id = id;
		this.workIndex = workIndex;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getWorkIndex() {
		return workIndex;
	}

	public void setWorkIndex(int workIndex) {
		this.workIndex = workIndex;
	}

}
