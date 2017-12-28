package com.ufgov.whs.system.role.dao;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;

import com.ufgov.whs.system.role.bean.SysRolePermission;



/**
 * 角色权限DAO
 * @author fucj
 * @date 2017年9月18日
 */

public interface RolePermissionDao extends PagingAndSortingRepository<SysRolePermission, Serializable>, JpaSpecificationExecutor<SysRolePermission>, Repository<SysRolePermission, Serializable>{
	 @Query("select rp.permissionId from SysRolePermission rp where rp.roleId=?1")
	 SysRolePermission findPermissionIds(Integer id);	
}
