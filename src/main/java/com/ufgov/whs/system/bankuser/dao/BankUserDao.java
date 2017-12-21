package com.ufgov.whs.system.bankuser.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;

import com.ufgov.whs.company.bean.CompanyUser;
import com.ufgov.whs.system.bankuser.bean.BankUser;
import com.ufgov.whs.system.user.bean.SysUser;

/**
 * 用户DAO
 * @author fucj
 * @date 2017年9月18日
 */
public interface BankUserDao extends PagingAndSortingRepository<BankUser, Serializable>, JpaSpecificationExecutor<BankUser>, Repository<BankUser, Serializable>{
	 @Query("select u from BankUser u where u.userId = ?1")
	 BankUser findByUserId(Integer userId);
	 
	 /**
	 * 根据审批单序号查询历史处理人
	 * @param reportId
	 * @return
	 */
	@Query(value="select * from bank_user where user_id in (select DISTINCT b.user_id from sys_user s,bank_user b,(select DISTINCT operator_by from business_log where report_id = ?1) bl,"
			+ "sys_user_role sur where s.id = b.user_id and s.login_name = bl.operator_by and s.id = sur.user_id "
			+ "order by sur.role_id, user_id) ", nativeQuery = true)
	List<BankUser> getHistoryUserByReportId(String reportId) throws Exception;
}
