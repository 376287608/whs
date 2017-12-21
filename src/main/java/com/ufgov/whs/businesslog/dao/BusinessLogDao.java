package com.ufgov.whs.businesslog.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;

import com.ufgov.whs.businesslog.bean.BusinessLog;


/**
 * 业务日志DAO
 * @author fucj
 * @date 2017-10-25 
 */

public interface BusinessLogDao extends PagingAndSortingRepository<BusinessLog, Serializable>, JpaSpecificationExecutor<BusinessLog>, Repository<BusinessLog, Serializable> {

	/**
	 * 查找在办业务的上一环节人和上一环节时间
	 * @param reportId
	 * @param loginName
	 * @return
	 */
	@Query(value="select * from business_log where report_id = ?1 and end_date <"
			+ "(select end_date from business_log where report_id = ?1 and operator_by = ?2 order by end_date desc LIMIT 1) order by end_date desc LIMIT 1", nativeQuery = true)
	BusinessLog getBackByReportId(String reportId,String loginName);
	@Query(value="select * from business_log where report_id = ?1 order by end_date desc LIMIT 1", nativeQuery = true)
	BusinessLog getLastOperatorLog(String reportId);
	
	@Query(value="select * from business_log where report_id = ?1 and step_id = ?2 order by end_date desc LIMIT 1", nativeQuery = true)
	BusinessLog getOperatorLogByStepId(String reportId,Integer stepId);

	/**
	 * 根据审批单id查找日志列表
	 * @param reportId
	 * @return
	 */
	@Query(value="select b.id,u.name as operator_by,b.receive_date,b.end_date,b.opertion_name,b.operation_opinon,b.form_id,b.report_id,b.business_verify_code,b.step_id from business_log b,sys_user s,bank_user u where b.operator_by = s.login_name and s.id = u.user_id and report_id = ?1 order by end_date desc ", nativeQuery = true)
	List<BusinessLog> getByReportId(String reportId);
	
	/**
	 * 查询当前人意见
	 * @param loginName
	 * @param reportId
	 * @return
	 */
	@Query(value="select * from business_log where report_id = ?2 and operator_by = ?1 and opertion_name = '保存' ORDER BY end_date desc limit 1 ", nativeQuery = true)
	BusinessLog getCurrentUserBusinessLog(String loginName,String reportId);
	
}
