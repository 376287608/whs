package com.ufgov.whs.company.bean;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * CompanyUser entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "company_user")
public class CompanyUser implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userId;
	private String companyName;
	private String orgBarcode;
	private String tradeCode;
	private String certificateCode;
	private String registerName;
	private String credentialsType;
	private String credentialNumber;
	private String email;
	private String officePhone;
	private String phone;
	private String attachment;
	private String saveAddr;
	private Date registerDate;

	// Constructors

	/** default constructor */
	public CompanyUser() {
	}

	/** minimal constructor */
	public CompanyUser(Integer id, Integer userId, String companyName,
			String credentialsType, String credentialNumber) {
		this.id = id;
		this.userId = userId;
		this.companyName = companyName;
		this.credentialsType = credentialsType;
		this.credentialNumber = credentialNumber;
	}

	/** full constructor */
	public CompanyUser(Integer id, Integer userId, String companyName,
			String orgBarcode, String tradeCode, String certificateCode,
			String registerName, String credentialsType,
			String credentialNumber, String email, String officePhone,
			String phone, String attachment, String saveAddr, Date registerDate) {
		this.id = id;
		this.userId = userId;
		this.companyName = companyName;
		this.orgBarcode = orgBarcode;
		this.tradeCode = tradeCode;
		this.certificateCode = certificateCode;
		this.registerName = registerName;
		this.credentialsType = credentialsType;
		this.credentialNumber = credentialNumber;
		this.email = email;
		this.officePhone = officePhone;
		this.phone = phone;
		this.attachment = attachment;
		this.saveAddr = saveAddr;
		this.registerDate = registerDate;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "user_id", nullable = false)
	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	@Column(name = "company_name", nullable = false)
	public String getCompanyName() {
		return this.companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	@Column(name = "org_barcode", length = 9)
	public String getOrgBarcode() {
		return this.orgBarcode;
	}

	public void setOrgBarcode(String orgBarcode) {
		this.orgBarcode = orgBarcode;
	}

	@Column(name = "trade_code", length = 13)
	public String getTradeCode() {
		return this.tradeCode;
	}

	public void setTradeCode(String tradeCode) {
		this.tradeCode = tradeCode;
	}

	@Column(name = "certificate_code", length = 18)
	public String getCertificateCode() {
		return this.certificateCode;
	}

	public void setCertificateCode(String certificateCode) {
		this.certificateCode = certificateCode;
	}

	@Column(name = "register_name")
	public String getRegisterName() {
		return this.registerName;
	}

	public void setRegisterName(String registerName) {
		this.registerName = registerName;
	}

	@Column(name = "credentials_type", nullable = false)
	public String getCredentialsType() {
		return this.credentialsType;
	}

	public void setCredentialsType(String credentialsType) {
		this.credentialsType = credentialsType;
	}

	@Column(name = "credential_number", nullable = false)
	public String getCredentialNumber() {
		return this.credentialNumber;
	}

	public void setCredentialNumber(String credentialNumber) {
		this.credentialNumber = credentialNumber;
	}

	@Column(name = "email")
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "office_phone", length = 12)
	public String getOfficePhone() {
		return this.officePhone;
	}

	public void setOfficePhone(String officePhone) {
		this.officePhone = officePhone;
	}

	@Column(name = "phone", length = 11)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "attachment")
	public String getAttachment() {
		return this.attachment;
	}

	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}

	@Column(name = "save_addr")
	public String getSaveAddr() {
		return this.saveAddr;
	}

	public void setSaveAddr(String saveAddr) {
		this.saveAddr = saveAddr;
	}

	@Column(name = "register_date", length = 19)
	public Date getRegisterDate() {
		return this.registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

}