package com.ufgov.whs.workcalendar.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**  工作日历设置  */
@Entity
@Table(name = "HAS_WORKCALENDAR")
public class WorkCalendar implements Serializable{

	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public WorkCalendar(){}

	 @Id
	 private String id;//年份(主键)
	 
	 @Column(name = "START_DATE")
	 private String startDate;//开始日期
	 
	 @Column(name = "END_DATE")
	 private String endDate;//结束日期
	 
	 @Column(name = "ONDUTY_TIME")
	 private String ondutyTime;//上班时间
	 
	 @Column(name = "OFFDUTY_TIME")
	 private String offdutyTime;//下班时间
	 
	 @Column(name = "WORKDAY_TOTAL")
	 private String workdayTotal;//总工作天数
	 
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
	 public String getOndutyTime() {
	        return ondutyTime;
	 }

	 public void setOndutyTime(String ondutyTime) {
	        this.ondutyTime = ondutyTime;
	 }
	 public String getOffdutyTime() {
	        return offdutyTime;
	 }

	 public void setOffdutyTime(String offdutyTime) {
	        this.offdutyTime = offdutyTime;
	 }
	 public String getWorkdayTotal() {
	        return workdayTotal;
	 }

	 public void setWorkdayTotal(String workdayTotal) {
	        this.workdayTotal = workdayTotal;
	 }
}
