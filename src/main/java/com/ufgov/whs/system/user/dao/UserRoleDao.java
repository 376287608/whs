package com.ufgov.whs.system.user.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;
import com.ufgov.whs.system.user.bean.SysUserRole;



/**
 * 用户角色DAO
 * @author fucj
 * @date 2017年9月18日
 */

public interface UserRoleDao extends PagingAndSortingRepository<SysUserRole, Serializable>, JpaSpecificationExecutor<SysUserRole>, Repository<SysUserRole, Serializable>{
	 @Query(value = "select * from sys_user_role b where b.user_id=?1", nativeQuery = true)
	 List<SysUserRole> getUserRoleList(Integer userId);
}
