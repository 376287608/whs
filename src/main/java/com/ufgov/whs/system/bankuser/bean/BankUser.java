package com.ufgov.whs.system.bankuser.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * BankUser entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "bank_user")
public class BankUser implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userId;
	private Integer orgId;
	private Integer deptId;
	private String name;
	private String email;
	private String phone;
	private String mobile;

	// Constructors

	/** default constructor */
	public BankUser() {
	}

	/** minimal constructor */
	public BankUser(Integer id, Integer userId, Integer orgId, Integer deptId,
			String name) {
		this.id = id;
		this.userId = userId;
		this.orgId = orgId;
		this.deptId = deptId;
		this.name = name;
	}

	/** full constructor */
	public BankUser(Integer id, Integer userId, Integer orgId, Integer deptId,
			String name, String email, String phone, String mobile) {
		this.id = id;
		this.userId = userId;
		this.orgId = orgId;
		this.deptId = deptId;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.mobile = mobile;
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

	@Column(name = "org_id", nullable = false)
	public Integer getOrgId() {
		return this.orgId;
	}

	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
	}

	@Column(name = "dept_id", nullable = false)
	public Integer getDeptId() {
		return this.deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	@Column(name = "name", nullable = false)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "email")
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "phone", length = 12)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "mobile", length = 11)
	public String getMobile() {
		return this.mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

}