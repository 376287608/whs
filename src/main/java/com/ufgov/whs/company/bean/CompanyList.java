package com.ufgov.whs.company.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * CompanyList entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "company_list")
public class CompanyList implements java.io.Serializable {

	// Fields

	private Integer id;
	private String legalCode;
	private String companyName;
	private String orgBarcode;
	private String tradeCode;
	private String certificateCode;
	private String area;
	private String technicalField;

	// Constructors

	/** default constructor */
	public CompanyList() {
	}

	/** minimal constructor */
	public CompanyList(String legalCode, String companyName, String area,
			String technicalField) {
		this.legalCode = legalCode;
		this.companyName = companyName;
		this.area = area;
		this.technicalField = technicalField;
	}

	/** full constructor */
	public CompanyList(String legalCode, String companyName, String orgBarcode,
			String tradeCode, String certificateCode, String area,
			String technicalField) {
		this.legalCode = legalCode;
		this.companyName = companyName;
		this.orgBarcode = orgBarcode;
		this.tradeCode = tradeCode;
		this.certificateCode = certificateCode;
		this.area = area;
		this.technicalField = technicalField;
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

	@Column(name = "legal_code", nullable = false)
	public String getLegalCode() {
		return this.legalCode;
	}

	public void setLegalCode(String legalCode) {
		this.legalCode = legalCode;
	}

	@Column(name = "company_name", nullable = false)
	public String getCompanyName() {
		return this.companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	@Column(name = "org_barcode")
	public String getOrgBarcode() {
		return this.orgBarcode;
	}

	public void setOrgBarcode(String orgBarcode) {
		this.orgBarcode = orgBarcode;
	}

	@Column(name = "trade_code", length = 20)
	public String getTradeCode() {
		return this.tradeCode;
	}

	public void setTradeCode(String tradeCode) {
		this.tradeCode = tradeCode;
	}

	@Column(name = "certificate_code")
	public String getCertificateCode() {
		return this.certificateCode;
	}

	public void setCertificateCode(String certificateCode) {
		this.certificateCode = certificateCode;
	}

	@Column(name = "area", nullable = false)
	public String getArea() {
		return this.area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	@Column(name = "technical_field", nullable = false)
	public String getTechnicalField() {
		return this.technicalField;
	}

	public void setTechnicalField(String technicalField) {
		this.technicalField = technicalField;
	}

}