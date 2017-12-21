package com.ufgov.whs.business.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;

import com.ufgov.whs.business.bean.BuBusiness;
import com.ufgov.whs.business.bean.BuLaws;

/**
 * 业务类型DAO
 * @author fucj
 * @date 2015年1月13日
 */

public interface BusinessDao extends PagingAndSortingRepository<BuBusiness, Serializable>, JpaSpecificationExecutor<BuBusiness>, Repository<BuBusiness, Serializable> {

	@Query("Select g from BuBusiness g where delFlag = '1' and business_no is null ")
	List<BuBusiness> getAllBuBusiness();
	
	@Query("Select businessName from BuBusiness g where g.id = ?1 and delFlag = '1'")
	String getBusinessNameById(Integer buBusinessId);
	
	@Query(value = "Select * from bu_business  where business_no = ?1 and del_flag = '1' limit 1 ", nativeQuery = true)
	BuBusiness getBuBusinessByBusinessNo(String businessNo);
	
	/**
	 * 根据流程id获取相关业务
	 * @param processId
	 * @return
	 */
	@Query(value = "select * from bu_business b,bu_process bp,process p where b.id = bp.business_id and bp.process_id = p.id "
			+ " and b.del_flag = '1' and p.del_flag = '1' and p.id = ?1 ", nativeQuery = true)
	List<BuBusiness> getByProcessId(Integer processId);
	
	/**
	 * 获取所有的末级业务
	 * @return
	 */
	@Query(value = "select * from bu_business where end_node = '0' order by id ", nativeQuery = true)
	List<BuBusiness> getAllEndNodeBusiness();
	
	/**
	 * 根据分页信息和部门查找末级业务
	 */
	@Query(value = "select * from bu_business where end_node = '0' and id in "
			+ "(select bu.business_id from bu_dept_business bu,sys_dept_role d,sys_user_role u "
			+ "where bu.verify_dept_id = d.dept_id and d.role_id = u.role_id and u.user_id = ?3) "
			+ "order by update_date desc limit ?1,?2", nativeQuery = true)
	List<BuBusiness> getEndNodeBusiness(Integer startNumber,Integer length,Integer userId);
	
}
