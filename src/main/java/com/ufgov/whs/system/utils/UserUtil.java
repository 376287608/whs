package com.ufgov.whs.system.utils;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.springside.modules.mapper.BeanMapper;

import com.ufgov.whs.company.bean.CompanyUser;
import com.ufgov.whs.system.bankuser.bean.BankUser;
import com.ufgov.whs.system.user.bean.SysUser;
import com.ufgov.whs.system.user.bean.User;
import com.ufgov.whs.system.user.service.UserRealm.ShiroUser;



public class UserUtil {
	/**
	 * 获取当前用户对象shiro
	 * @return shirouser
	 */
	public static ShiroUser getCurrentShiroUser(){
		ShiroUser user=(ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return user;
	}
	
	/**
	 * 获取当前用户session
	 * @return session
	 */
	public static Session getSession(){
		Session session =SecurityUtils.getSubject().getSession();
		return session;
	}
	
	/**
	 * 获取当前用户httpsession
	 * @return httpsession
	 */
	public static Session getHttpSession(){
		Session session =SecurityUtils.getSubject().getSession();
		return session;
	}
	
	/**
	 * 获取当前用户对象
	 * @return user
	 */
	public static SysUser getCurrentUser(){
		Session session =SecurityUtils.getSubject().getSession();
		if(null!=session){
			return (SysUser) session.getAttribute("user");
		}else{
			return null;
		}
		
	}
	/**
	 * 获取当前登录用户对象
	 * @return user
	 */
	public static  User getCurrentLoginUser(){
		Session session =SecurityUtils.getSubject().getSession();
		if(null!=session){
			SysUser su = (SysUser) session.getAttribute("user");
			User u = BeanMapper.map(su, User.class);
			return u;
		}else{
			return null;
		}
		
	}
	
	/**
	 * 获取当前银行用户对象
	 * @return user
	 */
	public static BankUser getCurrentBankUser(){
		Session session =SecurityUtils.getSubject().getSession();
		if(null!=session){
			return (BankUser) session.getAttribute("bankuser");
		}else{
			return null;
		}
		
	}
	
	/**
	 * 获取当前企业用户对象
	 * @return user
	 */
	public static CompanyUser getCurrentCompanyUser(){
		Session session =SecurityUtils.getSubject().getSession();
		if(null!=session){
			return (CompanyUser) session.getAttribute("companyuser");
		}else{
			return null;
		}
		
	}
}
 