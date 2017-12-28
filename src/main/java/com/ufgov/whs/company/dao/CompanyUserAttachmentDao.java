package com.ufgov.whs.company.dao;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;

import com.ufgov.whs.company.bean.CompanyList;
import com.ufgov.whs.company.bean.CompanyUserAttachment;

/**
 * 企业附件DAO
 * @author xlli
 * @date 2017年9月18日
 */
public interface CompanyUserAttachmentDao extends PagingAndSortingRepository<CompanyUserAttachment, Serializable>, JpaSpecificationExecutor<CompanyUserAttachment>, Repository<CompanyUserAttachment, Serializable>{
}
