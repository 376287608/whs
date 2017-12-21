package com.ufgov.whs.workcalendar.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
/**  工作日历设置  */
@Entity
@Table(name = "HAS_SPECIAL_CASE")
public class SpecialCase implements Serializable{

	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	 @Id
	 private String id;//特例ID(主键)
	 
	 @Column(name = "WC_ID")
	 private String wcId;//工作日历ID
	 
	 @Column(name = "CASE_TYPE")
	 private String caseType;//特例类型
	 
	 @Column(name = "CASE_DATE")
	 private String caseDate;//特例日期
	 
	 @Column(name = "ONDUTY_TIME")
	 private String ondutyTime;//上班时间
	 
	 @Column(name = "OFFDUTY_TIME")
	 private String offdutyTime;//下班时间
	 
	 public String getId() {
	        return id;
	 }

	 public void setId(String id) {
	        this.id = id;
	 }
	 
	 public String getWcId(){
		 return wcId;
	 }
	 public void setWcId(String wcId){
		 this.wcId = wcId;
	 }
	 public String getCaseType(){
		 return caseType;
	 }
	 public void setCaseType(String caseType){
		 this.caseType = caseType;
	 }
	 public String getCaseDate(){
		 return caseDate;
	 }
	 public void setCaseDate(String caseDate){
		 this.caseDate =caseDate;
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
