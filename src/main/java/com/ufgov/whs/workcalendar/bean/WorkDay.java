package com.ufgov.whs.workcalendar.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
/**  工作日历设置  */
@Entity
@Table(name = "HAS_WORKDAY")
public class WorkDay implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public WorkDay() {
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "ID")
	private String id;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "WORK_INDEX")
	private String workIndex;
	
	@Column(name = "WORK_DATE")
	private String workDate;
	
	@Column(name = "ONDUTY_TIME")
	private String ondutyTime;
	
	@Column(name = "OFFDUTY_TIME")
	private String offdutyTime;
	
	public String getId(){
		return id;
	}
	public void setId(String id){
		this.id = id;
	}
	public String getWorkIndex(){
		return workIndex;
	}
	public void setWorkIndex(String workIndex){
		this.workIndex = workIndex;
	}
	public String getWorkDate(){
		return workDate;
	}
	public void setWorkDate(String workDate){
		this.workDate = workDate;
	}
	public String getOndutyTime(){
		return ondutyTime;
	}
	public void setOndutyTime(String ondutyTime){
		this.ondutyTime = ondutyTime;
	}
	public String getOffdutyTime(){
		return offdutyTime;
	}
	public void setOffdutyTime(String offdutyTime){
		this.offdutyTime = offdutyTime;
	}
	
}
