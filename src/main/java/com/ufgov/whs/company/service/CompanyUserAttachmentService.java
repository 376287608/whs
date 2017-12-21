package com.ufgov.whs.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ufgov.whs.company.bean.CompanyList;
import com.ufgov.whs.company.bean.CompanyUserAttachment;
import com.ufgov.whs.company.dao.CompanyUserAttachmentDao;

/**
 * 企业附件service
 * @author xlli
 * @date 2017-10-12
 */
@Service
@Transactional(readOnly = true)
public class CompanyUserAttachmentService{
	
	@Autowired
	private CompanyUserAttachmentDao companyUserAttachmentDao;
	
	/**
	 * 保存附件信息
	 * @param userId
	 * @param companyUserAttachment
	 * @return
	 */
	@Transactional(readOnly=false)
	public boolean save(Integer userId,CompanyUserAttachment companyUserAttachment){
		companyUserAttachment.setUserId(userId);
		try {
			companyUserAttachmentDao.save(companyUserAttachment);
		} catch (Exception e) {
			e.printStackTrace();
			return false ;
		}
		return true ;
	}

}

