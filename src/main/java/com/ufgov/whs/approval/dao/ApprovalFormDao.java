package com.ufgov.whs.approval.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;

import com.ufgov.whs.approval.bean.ApprovalForm;

/**
 * 权限DAO
 * @author fucj
 * @date 2017年9月18日
 */
public interface ApprovalFormDao extends PagingAndSortingRepository<ApprovalForm, Serializable>, JpaSpecificationExecutor<ApprovalForm>, Repository<ApprovalForm, Serializable>{
	Integer countByAssignReceive(String assignReceive);
	
	@Query("Select g from ApprovalForm g where g.receiveBy = ?1")
	List<ApprovalForm> getToReceive(String loginName);
}
