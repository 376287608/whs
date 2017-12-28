package com.ufgov.whs.system.user.service;

import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ufgov.whs.common.pagination.impl.IPaginationImpl;
import com.ufgov.whs.common.utils.DateUtils;
import com.ufgov.whs.common.utils.security.Digests;
import com.ufgov.whs.common.utils.security.Encodes;
import com.ufgov.whs.company.bean.CompanyUser;
import com.ufgov.whs.company.dao.CompanyUserDao;
import com.ufgov.whs.system.bankuser.bean.BankUser;
import com.ufgov.whs.system.bankuser.dao.BankUserDao;
import com.ufgov.whs.system.role.bean.SysRole;
import com.ufgov.whs.system.role.dao.RoleDao;
import com.ufgov.whs.system.user.bean.SysUser;
import com.ufgov.whs.system.user.dao.UserDao;
import com.ufgov.whs.system.utils.SysConstant;


/**
 * 用户service
 * @author fucj
 * @date 2015年1月13日
 */
@Service
@Transactional(readOnly = true)
public class UserService{
	
	/**加密方法*/
	public static final String HASH_ALGORITHM = "SHA-1";
	public static final int HASH_INTERATIONS = 1024;
	private static final int SALT_SIZE = 8;	//盐长度
	

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private CompanyUserDao companyUserDao;
	
	@Autowired
	private BankUserDao bankUserDao;
	
	@Autowired
	private RoleDao roleDao;
	
	@Autowired
	private IPaginationImpl ipaginationservice;

	/**
	 * 保存用户
	 * @param user
	 */
	@Transactional(readOnly=false)
	public Boolean save(SysUser user) {
		
		//生成随机密码
		entryptPassword(user);
		//创建者
//		SysUser currentUser = (SysUser)SecurityUtils.getSubject().getSession().getAttribute("user");
//		user.setCreateBy(currentUser.getLoginName());
		//用户类型 企业用户
		user.setUserType("0");
		//创建时间
		user.setCreateDate(DateUtils.getSysTimestamp());
		//删除标识
		user.setDelFlag("1");
		try {
			userDao.save(user);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true ;
	}

	/**
	 * 修改密码
	 * @param user
	 */
	@Transactional(readOnly=false)
	public void updatePwd(SysUser user) {
		entryptPassword(user);
		userDao.save(user);
	}
	
	/**
	 * 删除用户
	 * @param id
	 */
	@Transactional(readOnly=false)
	public void delete(Integer id){
		if(!isSupervisor(id))
			userDao.delete(id);
	}
	
	/**
	 * 按登录名查询用户
	 * @param loginName
	 * @return 用户对象
	 */
	public SysUser getUser(String loginName) {
		return userDao.findByLoginName(loginName);		
	}
	
	/**
	 * 按id查询用户
	 * @param id
	 * @return 用户对象
	 */
	public SysUser get(int id) {
		return userDao.findOne(id);		
	}
	/**
	 * 判断是否超级管理员
	 * @param id
	 * @return boolean
	 */
	private boolean isSupervisor(Integer id) {
		return id == 1;
	}
	
	/**
	 * 按用户id查询用户角色
	 * @param loginName
	 * @return 用户对象
	 */
	public List<SysRole> getUserRoles(Integer id) {
		return roleDao.getRoleByUserId(id);		
	}
	
	/**
	 * 按登录名查询银行用户
	 * @param loginName
	 * @return 用户对象
	 */
	public BankUser getBankUser(String loginName) {
		SysUser su = getUser(loginName);
		BankUser bu = null;
		if(su.getUserType().equals(SysConstant.BANK_USER_N)||su.getUserType().equals(SysConstant.BANK_USER_W)){
			bu = bankUserDao.findByUserId(su.getId());
		}	
		return bu;
	}
	
	
	/**
	 * 按登录名查询企业用户
	 * @param loginName
	 * @return 用户对象
	 */
	public CompanyUser getCompanyUser(String loginName) {
		SysUser su = getUser(loginName);
		CompanyUser cu = null;
		if(su.getUserType().equals(SysConstant.COMPANY_USER)){
			cu = companyUserDao.findByUserId(su.getId());
		}	
		return cu;
	}
	
	/**
	 * 设定安全的密码，生成随机的salt并经过1024次 sha-1 hash
	 */
	private void entryptPassword(SysUser user) {
		byte[] salt = Digests.generateSalt(SALT_SIZE);
		user.setSalt(Encodes.encodeHex(salt));

		byte[] hashPassword = Digests.sha1(user.getPlainPassword().getBytes(),salt, HASH_INTERATIONS);
		user.setPassword(Encodes.encodeHex(hashPassword));
	}
	
	/**
	 * 验证原密码是否正确
	 * @param user
	 * @param oldPwd
	 * @return
	 */
	public boolean checkPassword(SysUser user,String oldPassword){
		byte[] salt =Encodes.decodeHex(user.getSalt()) ;
		byte[] hashPassword = Digests.sha1(oldPassword.getBytes(),salt, HASH_INTERATIONS);
		if(user.getPassword().equals(Encodes.encodeHex(hashPassword))){
			return true;
		}else{
			return false;
		}
	}
	
	public PageImpl getFindAll(PageRequest pageRequest) throws Exception {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder();
		sql.append("select ID as id,NAME as name,ROLE_CODE as roleCode,DESCRIPTION as description,SORT as sort,DEL_FLAG as delFlag from role");
	    return ipaginationservice.getPageImpl(sql.toString(), pageRequest, SysRole.class);
	}
	
	public static void main(String[] args){
		/*
		ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
		JdbcTemplate jdbc = (JdbcTemplate) ctx.getBean("jdbcTemplate");
		String sql = "select * from permission where ID = 1"+
			     " into outfile 'E:/developsoft/mysql-5.7.18-winx64/output/permission1.csv'"+
			     " fields terminated by ',' "+
                " enclosed by '\"' lines terminated by '\r\n'";
	    jdbc.execute(sql);*/
		//除admin 初始密码为123456外 其它银行用户初始密码为000000
		AbstractApplicationContext  ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
		JdbcTemplate jdbc = (JdbcTemplate) ctx.getBean("jdbcTemplate");
		String querySql = "select * from sys_user where user_type ='1' and id >20";
		List<Map<String, Object>> bankuserList = jdbc.queryForList(querySql);
		for(int i = 0; i < bankuserList.size(); i++){
			int id = (int) bankuserList.get(i).get("id");
			byte[] salt = Digests.generateSalt(SALT_SIZE);
			String updatesql1 = "update sys_user set salt = '"+Encodes.encodeHex(salt)+"'  where id=" +id +";";
			jdbc.execute(updatesql1);
			byte[] hashPassword = Digests.sha1("000000".getBytes(),salt, HASH_INTERATIONS);
			String updatesql2 = "update sys_user set password = '"+Encodes.encodeHex(hashPassword)+"'  where id=" +id +";";
			jdbc.execute(updatesql2);
		}
		ctx.close();
	}
}
