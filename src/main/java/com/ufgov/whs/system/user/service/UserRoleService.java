package com.ufgov.whs.system.user.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ufgov.whs.system.user.bean.SysUserRole;
import com.ufgov.whs.system.user.dao.UserRoleDao;


/**
 * 用户角色service
 * @author fucj
 * @date 2015年1月14日
 */
@Service
@Transactional(readOnly = true)
public class UserRoleService{

	@Autowired
	private UserRoleDao userRoleDao;

	/**
	 * 添加修改用户角色
	 * 
	 * @param id
	 * @param oldList
	 * @param newList
	 */
	@Transactional(readOnly = false)
	public void updateUserRole(Integer userId, List<Integer> oldList,List<Integer> newList) {
		// 是否删除
		for (int i = 0, j = oldList.size(); i < j; i++) {
			if (!newList.contains(oldList.get(i))) {
				deleteUR(userId, oldList.get(i));
			}
		}

		// 是否添加
		for (int m = 0, n = newList.size(); m < n; m++) {
			if (!oldList.contains(newList.get(m))) {
				userRoleDao.save(getUserRole(userId, newList.get(m)));
			}
		}
	}

	/**
	 * 构建UserRole
	 * 
	 * @param userId
	 * @param roleId
	 * @return SysUserRole
	 */
	private SysUserRole getUserRole(Integer userId, Integer roleId) {
		SysUserRole ur = new SysUserRole();
		//ur.setUserId(userId);
		//ur.setRoleId(roleId);
		return ur;
	}

	/**
	 * 获取用户拥有角色id集合
	 * 
	 * @param userId
	 * @return 结果集合
	 */
	public List<Integer> getRoleIdList(Integer userId) {
		List<SysUserRole> userRoleList = userRoleDao.getUserRoleList(userId);
		List<Integer> ids = new ArrayList<Integer>();
		for (Iterator<SysUserRole> iter = userRoleList.iterator(); iter.hasNext();) {
			SysUserRole ur = (SysUserRole) iter.next();
			ids.add(ur.getId());
		}
		return ids;
	}

	
	/**
	 * 删除用户角色
	 * @param userId
	 * @param roleId
	 */
	@Modifying
	@Query("delete from SysUserRole where ur.user.id=?0 and ur.role.id=?1")
	public void deleteUR(@Param("user.id")Integer userId,@Param("role.id")Integer roleId){
	}
	
	/**
	 * 保存用户角色关系
	 * @param sysUserRole
	 * @return
	 */
	@Transactional(readOnly = false)
	public boolean save(SysUserRole sysUserRole){
		try {
			userRoleDao.save(sysUserRole);
		} catch (Exception e) {
			e.printStackTrace();
			return false ;
		}
		return true ;
	}
	
	/**
	 * 根据用户id查找角色序号
	 * @param userId
	 * @return
	 */
	public List<SysUserRole> getRoleByUserId(Integer userId){
		if(userId == null) return null ;
		return userRoleDao.getUserRoleList(userId);
	}
	

}
