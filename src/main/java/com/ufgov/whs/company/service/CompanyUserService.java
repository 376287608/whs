package com.ufgov.whs.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ufgov.whs.common.utils.DateUtils;
import com.ufgov.whs.company.bean.CompanyUser;
import com.ufgov.whs.company.dao.CompanyUserDao;

/**
 * 用户service
 * @author xlli
 * @date 2017-10-12
 */
@Service
@Transactional(readOnly = true)
public class CompanyUserService{
	
	@Autowired
	private CompanyUserDao companyUserDao;
	
	/**
	 * 保存企业用户
	 * @param userId 企业用户关联用户表编号
	 * @param companyUser 企业用户
	 * @param flag 注册标识 true为注册
	 * @return
	 */
	@Transactional(readOnly=false)
	public boolean save(Integer userId,CompanyUser companyUser,boolean flag) {
		
		//如果是注册
		if(flag){
			//注册时间
			companyUser.setRegisterDate(DateUtils.getSysTimestamp());
		}
		//用户编号
		companyUser.setUserId(userId);
		try {
			companyUserDao.save(companyUser);
		} catch (Exception e) {
			e.printStackTrace();
			return false ;
		}
		return true ;
	}
	
	/**
	 * 根据用户编号查找企业信息
	 * @param userId
	 * @return
	 */
	public CompanyUser getByUserId(Integer userId){
		return companyUserDao.findByUserId(userId);
	}

}

