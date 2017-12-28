package com.ufgov.whs.approval.bean;

/**
 * 业务处理状态
 * @author xlli
 *
 */
public class VBankStatus {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 状态
	 */
	private String status ;
	
	/**
	 * 内外网标识 1为外网 2为内网 3为公共
	 */
	private String flag ;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

}
