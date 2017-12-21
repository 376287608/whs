package com.ufgov.whs.process.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;
import org.springframework.data.repository.query.Param;

import com.ufgov.whs.process.bean.Process;

/**
 * 流程DAO
 * @author fucj
 * @date 2015年1月13日
 */

public interface ProcessDao extends PagingAndSortingRepository<Process, Serializable>, JpaSpecificationExecutor<Process>, Repository<Process, Serializable> {
	@Query(value="select p.* from process p INNER JOIN bu_process bp ON bp.process_id = p.ID WHERE bp.business_id = ?1 and p.org_id = ?2 and p.del_flag= '1' ",nativeQuery = true)
	List<Process> getProcessByBusinessId(Integer businessId,Integer orgId);
	
	/**
	 * 通过id查找流程
	 * @param processId
	 * @return
	 */
	@Query(value="select * from process where del_flag = '1' and id = ?1 ",nativeQuery = true)
	Process getProcessById(Integer processId);
	
	/**
	 * 通过用户id查找部门编号
	 * @param userId
	 * @return
	 */
	@Query(value="select d.dept_id from sys_dept_role d,sys_user_role r,sys_user u where d.role_id = r.role_id and r.user_id = u.id and u.id = ?1 ",nativeQuery = true)
	int getDeptIdByUserId(Integer userId);
	
	/**
	 * 查询流程是否绑定了业务
	 * @param processId
	 * @return
	 */
	@Query(value="select * from process p where id in (select distinct process_id from bu_process) and id = ?1 and del_flag = '1' ",nativeQuery = true)
	Process getProcessByIdAndBusiness(Integer processId);
	
	/**
	 * 删除流程
	 */
	@Modifying
	@Query(value="update process set del_flag='0',update_by=:userName,update_date=:update where id in (:ids)",nativeQuery=true)
	int deleteProcessByIds(@Param(value = "ids") Integer[] ids,@Param(value = "userName") String userName,
			@Param(value = "update") String update) throws Exception;
}
