package com.ufgov.whs.attachment.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 附件存储元数据实体类
 */
@Entity
@Table(name = "HAS_ADDR_INFO")
public class DocAddrInfo implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "LOGIC_ADDR")
	private String logicAddr;

	@Column(name = "REAL_ADDR")
	private String realAddr;

	@Column(name = "WEB_ADDR")
	private String webAddr;

	@Column(name = "REMOTE_ADDR")
	private String remoteAddr;

	@Column(name = "LOW_LOGIC_ADDR")
	private String lowLogicAddr;

	@Column(name = "LOW_REAL_ADDR")
	private String lowRealAddr;

	@Column(name = "READ_ENABLED")
	private String readEnabled;

	@Column(name = "WRITE_ENABLED")
	private String writeEnabled;

	@Column(name = "USERNAME")
	private String userName;

	@Column(name = "PWD")
	private String pwd;

	public DocAddrInfo() {

	}

	public String getLogicAddr() {
		return logicAddr;
	}

	public void setLogicAddr(String logicAddr) {
		this.logicAddr = logicAddr;
	}

	public String getRealAddr() {
		return realAddr;
	}

	public void setRealAddr(String realAddr) {
		this.realAddr = realAddr;
	}

	public String getWebAddr() {
		return webAddr;
	}

	public void setWebAddr(String webAddr) {
		this.webAddr = webAddr;
	}

	public String getRemoteAddr() {
		return remoteAddr;
	}

	public void setRemoteAddr(String remoteAddr) {
		this.remoteAddr = remoteAddr;
	}

	public String getLowLogicAddr() {
		return lowLogicAddr;
	}

	public void setLowLogicAddr(String lowLogicAddr) {
		this.lowLogicAddr = lowLogicAddr;
	}

	public String getLowRealAddr() {
		return lowRealAddr;
	}

	public void setLowRealAddr(String lowRealAddr) {
		this.lowRealAddr = lowRealAddr;
	}


	public String getReadEnabled() {
		return readEnabled;
	}

	public void setReadEnabled(String readEnabled) {
		this.readEnabled = readEnabled;
	}

	public String getWriteEnabled() {
		return writeEnabled;
	}

	public void setWriteEnabled(String writeEnabled) {
		this.writeEnabled = writeEnabled;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

}
