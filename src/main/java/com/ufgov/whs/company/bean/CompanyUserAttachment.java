package com.ufgov.whs.company.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * CompanyuserAttachment entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="companyuser_attachment")

public class CompanyUserAttachment  implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

    // Fields    

     /**
	 * 
	 */
	private Integer id;
     private Integer userId;
     private String docName;
     private String docId;


    // Constructors

    /** default constructor */
    public CompanyUserAttachment() {
    }

	/** minimal constructor */
    public CompanyUserAttachment(Integer userId, String docName) {
        this.userId = userId;
        this.docName = docName;
    }
    
    /** full constructor */
    public CompanyUserAttachment(Integer userId, String docName, String docId) {
        this.userId = userId;
        this.docName = docName;
        this.docId = docId;
    }

   
    // Property accessors
    @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="id", unique=true, nullable=false)

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    
    @Column(name="user_id", nullable=false)

    public Integer getUserId() {
        return this.userId;
    }
    
    public void setUserId(Integer userId) {
        this.userId = userId;
    }
    
    @Column(name="doc_name", nullable=false)

    public String getDocName() {
        return this.docName;
    }
    
    public void setDocName(String docName) {
        this.docName = docName;
    }
    
    @Column(name="doc_id", length=32)

    public String getDocId() {
        return this.docId;
    }
    
    public void setDocId(String docId) {
        this.docId = docId;
    }
   








}