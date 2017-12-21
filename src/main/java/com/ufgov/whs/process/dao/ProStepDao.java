package com.ufgov.whs.process.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;

import com.ufgov.whs.process.bean.ProStep;

/**
 * 流程DAO
 * @author fucj
 * @date 2015年1月13日
 */

public interface ProStepDao extends PagingAndSortingRepository<ProStep, Serializable>, JpaSpecificationExecutor<ProStep>, Repository<ProStep, Serializable> {

	/**
	 * 根据审批单查找内网流程最后一个审批人
	 * @param reportId
	 * @return
	 */
	@Query(value = "select ps.* from approval_report t,pro_instance p,pro_step ps where t.process_id2 = p.id and p.process_id = ps.process_id and t.id = ?1 order by ps.step_order desc limit 1", nativeQuery = true)
	ProStep getInnerMaxStepByReportId(String reportId);
	
	/**
	 * 根据审批单查找外网流程最后一个审批人
	 * @param reportId
	 * @return
	 */
	@Query(value = "select ps.* from approval_report t,pro_instance p,pro_step ps where t.process_id1 = p.id and p.process_id = ps.process_id and t.id = ?1 order by ps.step_order desc limit 1", nativeQuery = true)
	ProStep getMaxStepByReportId(String reportId);
	
	/**
	 * 根据流程id删除相关步骤
	 */
	@Modifying
	@Query(value="delete from pro_step where process_id =  ?1",nativeQuery=true)
	int deleteStepByProcessId(int processId) throws Exception;
	
	/**
	 * 根据流程id查找相关步骤
	 * @param processId
	 * @return
	 * @throws Exception
	 */
	@Query(value="select * from pro_step where process_id = ?1 and del_flag = '1'",nativeQuery=true)
	List<ProStep> getStepByProcessId(int processId) throws Exception;
	
	/**
	 * 根据流程id查找相关步骤
	 * @param processId
	 * @return
	 * @throws Exception
	 */
	@Query(value="select * from pro_step where process_id = ?1  and step_order=?2 and del_flag = '1'",nativeQuery=true)
	ProStep getStepByProcessId(int processId,int stepOrder);
	
}
