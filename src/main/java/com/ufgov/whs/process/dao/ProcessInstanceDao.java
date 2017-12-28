package com.ufgov.whs.process.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;

import com.ufgov.whs.process.bean.ProInstance;
import com.ufgov.whs.system.utils.ResultConstant;


/**
 * 流程DAO
 * @author fucj
 * @date 2015年1月13日
 */

public interface ProcessInstanceDao extends PagingAndSortingRepository<ProInstance, Serializable>, JpaSpecificationExecutor<ProInstance>, Repository<ProInstance, Serializable> {
	@Query("select p from ProInstance p where p.reportId = ?1 and p.delFlag = '1'")
	ProInstance getProInstanceByReportId(String reportId);	
	
	@Query("select p from ProInstance p where p.reportId = ?1 and p.status=?2")
	ProInstance getProInstanceByReportId(String reportId,String statu);	
	
	/**
	 * 根据流程id查找实例
	 * @param reportId
	 * @return
	 */
	@Query("select p from ProInstance p where p.processId = ?1 and p.delFlag = '1'")
	ProInstance getProInstanceByProcessId(Integer reportId);
}
