package com.ufgov.whs.business.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ufgov.whs.business.bean.BuAttachmentType;
import com.ufgov.whs.business.dao.BuAttachmentTypeDao;

/**
 * 业务类型附件service
 * @author xlli
 * @date 2017-10-12
 */
@Service
@Transactional(readOnly = true)
public class BuAttachmentTypeService{
	
	@Autowired
	private BuAttachmentTypeDao buAttachmentTypeDao ;
	
	
	public List<BuAttachmentType> getBuAttachmentTypeByBusinessId(Integer businessId) throws Exception{
		if(businessId != null){
			return buAttachmentTypeDao.getBuAttachmentTypeByBusinessId(businessId);
		} 
		return null ;
	}
	
	public Integer getFileTypeIndexById(Integer id){
		return buAttachmentTypeDao.getFileTypeIndexById(id);
	}
	
	public BuAttachmentType getBuAttachmentTypeById(Integer id){
		return buAttachmentTypeDao.findOne(id);
	}
}

