package com.ufgov.whs.company.dao;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;

import com.ufgov.whs.company.bean.CompanyUser;
import com.ufgov.whs.system.user.bean.SysUser;

/**
 * 用户DAO
 * @author fucj
 * @date 2017年9月18日
 */
public interface CompanyUserDao extends PagingAndSortingRepository<CompanyUser, Serializable>, JpaSpecificationExecutor<CompanyUser>, Repository<CompanyUser, Serializable>{
	 @Query("select u from CompanyUser u where u.userId = ?1")
	 CompanyUser findByUserId(Integer userId);
}
