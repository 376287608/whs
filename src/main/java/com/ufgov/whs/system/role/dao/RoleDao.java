package com.ufgov.whs.system.role.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;

import com.ufgov.whs.system.role.bean.SysRole;




/**
 * 角色DAO
 * @author fucj
 * @date 2017年9月18日
 */
public interface RoleDao extends PagingAndSortingRepository<SysRole, Serializable>, JpaSpecificationExecutor<SysRole>, Repository<SysRole, Serializable>{
	//已知用户id，查找用户拥有的角色
	@Query(value = "SELECT r.* FROM sys_role r INNER JOIN sys_user_role ur ON ur.ROLE_ID = r.ID INNER JOIN sys_user u ON u.id = ur.USER_ID where u.ID=?1", nativeQuery = true)
	List<SysRole> getRoleByUserId(Integer userId);	
	
	/**
	 * 根据用户id查找该部门下所有角色
	 * @return
	 */
	@Query(value = "select * from sys_role where sort is not null and id in ( "
			+ "select role_id from sys_dept_role where dept_id = "
			+ "(select d.dept_id from sys_user u ,sys_user_role r,sys_dept_role d "
			+ "where u.id = r.user_id and r.role_id = d.role_id and u.id = ?1 ))", nativeQuery = true)
	List<SysRole> getRolesByUserId(Integer userId) throws Exception;	
	
	/**
	 * 返回审核权限大于此角色的所有角色
	 * @param userId
	 * @param roleId
	 * @return
	 * @throws Exception
	 */
	@Query(value = "select * from sys_role where id in ( select role_id from sys_dept_role where dept_id = "
			+ "( select d.dept_id from sys_user u ,sys_user_role r,sys_dept_role d "
			+ "where u.id = r.user_id and r.role_id = d.role_id and u.id = ?1 )) "
			+ "and sort > (select sort from sys_role where id = ?2) order by sort ", nativeQuery = true)
	List<SysRole> getGtRolesByRoleId(Integer userId,Integer roleId) throws Exception;
	
	/**
	 * 返回审核权限大于此角色的所有角色
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	@Query(value = "select * from sys_role where id in ( select role_id from sys_dept_role where dept_id = "
			+ "( select d.dept_id from sys_user u ,sys_user_role r,sys_dept_role d "
			+ "where u.id = r.user_id and r.role_id = d.role_id and u.id = ?1 )) order by sort ", nativeQuery = true)
	List<SysRole> getGtRolesByRoleId(Integer userId) throws Exception;
}
