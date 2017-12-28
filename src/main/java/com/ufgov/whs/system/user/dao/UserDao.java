package com.ufgov.whs.system.user.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;

import com.ufgov.whs.system.user.bean.SysUser;




/**
 * 用户DAO
 * @author fucj
 * @date 2017年9月18日
 */
public interface UserDao extends PagingAndSortingRepository<SysUser, Serializable>, JpaSpecificationExecutor<SysUser>, Repository<SysUser, Serializable>{
	 @Query(value="select * from sys_user where login_name = ?1",nativeQuery=true)
	 SysUser findByLoginName(String loginName);	 
	//已知角色id，查找拥有该角色的用户
	@Query(value = "SELECT u.id,u.login_name,u.user_type FROM sys_role r INNER JOIN sys_user_role ur ON ur.ROLE_ID = r.ID INNER JOIN sys_user u ON u.id = ur.USER_ID where r.ID=?1", nativeQuery = true)
	List<SysUser> getRoleByUserId(Integer roleId);
}
