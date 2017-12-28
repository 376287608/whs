package com.ufgov.whs.system.role.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ufgov.whs.common.mapper.BeanMapper;
import com.ufgov.whs.common.pagination.impl.IPaginationImpl;
import com.ufgov.whs.system.role.bean.SysRole;
import com.ufgov.whs.system.role.bean.VApprovalLevel;
import com.ufgov.whs.system.role.dao.RoleDao;



/**
 * 角色service
 * @author fucj
 * @date 2015年1月13日
 */
@Service
@Transactional(readOnly = true)
public class RoleService{
	@Autowired
    private JdbcTemplate jdbc;

	@Autowired
	private IPaginationImpl ipaginationservice;
	
	@Autowired
	private RoleDao roleDao;
	
	@Transactional(readOnly=false)
	public void save(SysRole role) {
		roleDao.save(role);
	}
	public SysRole get(int id) {
		return roleDao.findOne(id);		
	}
	/**
	 * 删除用户
	 * @param id
	 */
	@Transactional(readOnly=false)
	public void delete(Integer id){
		roleDao.delete(id);
	}
	
	public PageImpl getFindAll(PageRequest pageRequest) throws Exception {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder();
		sql.append("select ID as id,NAME as name,ROLE_CODE as roleCode,DESCRIPTION as description,SORT as sort,DEL_FLAG as delFlag from role");
	    return ipaginationservice.getPageImpl(sql.toString(), pageRequest, SysRole.class);
	}
	
	/**
	 * 根据用户id查找该部门下所有角色
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public List<SysRole> getRoleByUserId(Integer userId) throws Exception{
		return roleDao.getRolesByUserId(userId);
	}
	
	/**
	 * 根据审批层级查出所有可选审批流程
	 * @param level
	 * @return
	 * @throws Exception
	 */
	public List<VApprovalLevel> getApprovalLevel (Integer level) throws Exception{
		StringBuffer sb=new StringBuffer();
		sb.append( " select level,level_name as levelName from v_approval_level where 1=1 ");
		sb.append(" and `level` <= " + level);
		List<Map<String, Object>> levelList = jdbc.queryForList(sb.toString());
		List<VApprovalLevel> approvalLevelList = null ;
		if(levelList!=null && levelList.size()>0){
			approvalLevelList =  BeanMapper.mapList(levelList, VApprovalLevel.class);
		}
		return approvalLevelList ;
	}
	
	/**
	 * 返回审核权限大于此角色的所有角色
	 * @param user
	 * @param roleId
	 * @return
	 * @throws Exception 
	 */
	public List<SysRole> getGtRoleByRoleId(Integer userId, Integer roleId) throws Exception {
		if(roleId != null){
			return roleDao.getGtRolesByRoleId(userId, roleId);
		}else{
			return roleDao.getGtRolesByRoleId(userId);
		}
	}
	
	
}
