package com.ufgov.whs.business.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ufgov.whs.business.bean.BuGuides;
import com.ufgov.whs.business.bean.BuLaws;
import com.ufgov.whs.business.dao.BuGuidesDao;
import com.ufgov.whs.business.dao.BuLawsDao;
import com.ufgov.whs.common.pagination.impl.IPaginationImpl;
import com.ufgov.whs.common.utils.DateUtils;
import com.ufgov.whs.company.bean.CompanyUser;
import com.ufgov.whs.company.dao.CompanyUserDao;
import com.ufgov.whs.guide.bean.Guides;
import com.ufgov.whs.guide.dao.GuidesDao;
import com.ufgov.whs.system.user.bean.SysUser;
import com.ufgov.whs.system.user.dao.UserDao;

/**
 * 业务法律法规service
 * @author xlli
 * @date 2017-10-12
 */
@Service
@Transactional(readOnly = true)
public class BuLawsService{
	
	@Autowired
	private BuLawsDao buLawsDao;

	/**
	 * 查找业务相关的办事指南
	 * @param businessId
	 * @return
	 */
	public List<BuLaws> getguidesIdsBybusiness(Integer businessId) {
		return buLawsDao.getBuLawsByBusinessId(businessId);
	}

	/**
	 * 保存法律法规和业务的关联关系
	 * @param businessId
	 * @param id
	 * @param user
	 * @return
	 */
	@Transactional(readOnly = false)
	public boolean save(Integer[] businessIds, Integer lawId, SysUser user) {
		if(businessIds != null && businessIds.length>0 && lawId != null){
			try {
				//首先删除原来的关联关系
				buLawsDao.deleteByLawId(lawId);
				//保存新的关系
				for(Integer businessId : businessIds){
					BuLaws buLaws = new BuLaws();
					buLaws.setBusinessId(businessId);
					buLaws.setLawId(lawId);
					buLaws.setCreateDate(new Timestamp(System.currentTimeMillis()));
					buLaws.setCreateBy(user.getLoginName());
					buLawsDao.save(buLaws);
				}
				return true ;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	
}

