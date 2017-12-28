package com.ufgov.whs.business.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.jdbc.core.JdbcTemplate;

import com.ufgov.whs.business.bean.BuBusiness;
import com.ufgov.whs.business.dao.BusinessDao;
import com.ufgov.whs.common.mapper.BeanMapper;
import com.ufgov.whs.system.bankuser.bean.VBankUser;
import com.ufgov.whs.system.user.bean.SysUser;

/**
 * 权限service
 * @author fucj
 * @date 2015年1月13日
 */
@Service
@Transactional(readOnly=true)
public class BusinessService{
	
	@Autowired
	private BusinessDao businessDao;
	
	@Autowired
    JdbcTemplate jdbc;
	
	/**
	 * 保存业务
	 * @param resource
	 */
	@Transactional(readOnly=false)
	public void save(BuBusiness business) {
		businessDao.save(business);
	}
	
	/**
	 * 查找指定业务接收人员
	 * @param businessId 业务id
	 * @param rolename 角色名
	 */
	public List<VBankUser> getAcceptUserBy(Integer businessId,String rolename){
		StringBuffer sb=new StringBuffer();
		sb.append("SELECT u.id,u.user_id as userId,u.org_id as orgId,u.dept_id as deptId,u.login_name as loginName,u.name from v_bankuser u ");
		sb.append("INNER JOIN sys_user_role ur ON ur.user_id = u.id ");
		sb.append("INNER JOIN  sys_role r ON r.id = ur.role_id ");
		sb.append("INNER JOIN sys_dept_role d ON ur.role_id =d.role_id ");
		sb.append("INNER JOIN bu_dept_business b ON b.verify_dept_id = d.dept_id ");
		sb.append("where b.business_id=?  and r.name = ?");
		List<Map<String, Object>> permList = jdbc.queryForList(sb.toString(),new Object[]{businessId,rolename});
		List<VBankUser> sulist = null;
		if(permList!=null && permList.size()>0){
			sulist =  BeanMapper.mapList(permList, VBankUser.class);
		}		
		return sulist;
	}
   
	/**
	 * 查找指定业务接收人员
	 * @param businessId 业务id
	 * @param roleId 角色id
	 */
	public List<VBankUser> getAcceptUserBy(Integer businessId,Integer roleId){
		StringBuffer sb=new StringBuffer();
		sb.append("SELECT u.id,u.user_id as userId,u.org_id as orgId,u.dept_id as deptId,u.login_name as loginName,u.name from v_bankuser u ");
		sb.append("INNER JOIN sys_user_role ur ON ur.user_id = u.id ");
		sb.append("INNER JOIN  sys_role r ON r.id = ur.role_id ");
		sb.append("INNER JOIN sys_dept_role d ON ur.role_id =d.role_id ");
		sb.append("INNER JOIN bu_dept_business b ON b.verify_dept_id = d.dept_id ");
		sb.append("where b.business_id=?  and r.id = ?");
		List<Map<String, Object>> permList = jdbc.queryForList(sb.toString(),new Object[]{businessId,roleId});
		List<VBankUser> sulist = null;
		if(permList!=null && permList.size()>0){
			sulist =  BeanMapper.mapList(permList, VBankUser.class);
		}		
		return sulist;
	}
}
