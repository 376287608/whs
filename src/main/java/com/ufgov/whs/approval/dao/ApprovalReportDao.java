package com.ufgov.whs.approval.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;
import org.springframework.data.repository.query.Param;

import com.ufgov.whs.approval.bean.ApprovalReport;

/**
 * 审批单DAO
 * @author fucj
 * @date 2017年9月18日
 */
public interface ApprovalReportDao extends PagingAndSortingRepository<ApprovalReport, Serializable>, JpaSpecificationExecutor<ApprovalReport>, Repository<ApprovalReport, Serializable>{
	
	@Query("from ApprovalReport where id in (:ids)")
	List<ApprovalReport> findSomeByIds(@Param(value = "ids") List<String> ids);

	@Query("from ApprovalReport where id in (:ids) and processId2 is null")
	List<ApprovalReport> findSomeByIdAndProcessId2Null(@Param(value = "ids") List<String> ids);
	
	@Query("select max(businessVerifyCode) from ApprovalReport where businessVerifyCode like :source")
	String getMaxBusinessVerifyCode(@Param(value = "source") String source);

}
