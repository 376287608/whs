package com.ufgov.whs.approval.bean;

import java.util.Date;

public class TransactBusiness extends ApprovalReport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 上一环节经办人
	 */
	private String backUser ;
	
	/**
	 * 上一环节经办时间
	 */
	private Date backTime ;
	
	/**
	 * 当前操作人
	 */
	private String currentuser ;
	
	/**
	 * 当前操作时间
	 */
	private Date currentstepTime ;

	public String getBackUser() {
		return backUser;
	}

	public void setBackUser(String backUser) {
		this.backUser = backUser;
	}

	public Date getBackTime() {
		return backTime;
	}

	public void setBackTime(Date backTime) {
		this.backTime = backTime;
	}

	public String getCurrentuser() {
		return currentuser;
	}

	public void setCurrentuser(String currentuser) {
		this.currentuser = currentuser;
	}

	public Date getCurrentstepTime() {
		return currentstepTime;
	}

	public void setCurrentstepTime(Date currentstepTime) {
		this.currentstepTime = currentstepTime;
	}
}
