package com.ufgov.whs.business.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ufgov.whs.business.bean.BuGuides;
import com.ufgov.whs.business.dao.BuGuidesDao;
import com.ufgov.whs.system.user.bean.SysUser;

/**
 * 业务办事指南service
 * @author xlli
 * @date 2017-10-12
 */
@Service
@Transactional(readOnly = true)
public class BuGuidesService{
	
	@Autowired
	private BuGuidesDao buGuidesDao;

	/**
	 * 查找业务相关的办事指南
	 * @param businessId
	 * @return
	 */
	public List<BuGuides> getguidesIdsBybusiness(Integer businessId) {
		
		return buGuidesDao.getBuGuidesByBusinessId(businessId);
	}
	
	
	/**
	 * 保存办事指南和业务的关联关系
	 * @param businessIds
	 * @param guideId
	 * @param user
	 * @return
	 */
	@Transactional(readOnly = false)
	public boolean save(Integer[] businessIds, Integer guideId, SysUser user) {
		if(businessIds != null && businessIds.length>0 && guideId != null){
			try {
				//首先删除原来的关联关系
				buGuidesDao.deleteByGuideId(guideId);
				//保存新的关系
				for(Integer businessId : businessIds){
					BuGuides buGuides = new BuGuides();
					buGuides.setBusinessId(businessId);
					buGuides.setGuidesId(guideId);
					buGuides.setCreateDate(new Timestamp(System.currentTimeMillis()));
					buGuides.setCreateBy(user.getLoginName());
					buGuidesDao.save(buGuides);
				}
				return true ;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	
}

