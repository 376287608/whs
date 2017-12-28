package com.ufgov.whs.company.dao;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;

import com.ufgov.whs.company.bean.CompanyList;
import com.ufgov.whs.company.bean.CompanyUser;

/**
 * 企业名录DAO
 * @author xlli
 * @date 2017年9月18日
 */
public interface CompanyListDao extends PagingAndSortingRepository<CompanyList, Serializable>, JpaSpecificationExecutor<CompanyList>, Repository<CompanyList, Serializable>{
	 @Query("select c from CompanyList c where c.orgBarcode = ?1")
	 CompanyList getCompanyByOrgBarcode(String orgBarcode);
}
