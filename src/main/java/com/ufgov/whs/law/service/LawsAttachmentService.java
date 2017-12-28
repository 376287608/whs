package com.ufgov.whs.law.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ufgov.whs.law.bean.LawAttachment;
import com.ufgov.whs.law.dao.LawsAttachmentDao;

/**
 * 法律法规service
 * @author xlli
 * @date 2017-10-12
 */
@Service
@Transactional(readOnly = true)
public class LawsAttachmentService{
	
	@Autowired
	private LawsAttachmentDao lawsAttachmentDao ; 
	
	/**
	 * 根据id查找附件
	 * @param lawId
	 * @return
	 * @throws Exception
	 */
	public List<LawAttachment> getAttachmentByLawId(Integer lawId) throws Exception{
		return lawsAttachmentDao.getAttachmentBylawId(lawId);
	}

	/**
	 * 保存附件
	 * @param attachmentList
	 * @param lawsId
	 * @return
	 * @throws Exception
	 */
	@Transactional(readOnly = false)
	public boolean save(List<LawAttachment> attachmentList,Integer lawsId) {
		try {
			//保存之前先删除此办事指南相关的附件
			lawsAttachmentDao.deleteAttachmentByLawId(lawsId) ;
			//附件排序
			Integer displayOrder = 1 ;
			//保存
			for(LawAttachment attachment : attachmentList){
				attachment.setLawId(lawsId);
				attachment.setDisplayOrder(displayOrder);
				lawsAttachmentDao.save(attachment);
				displayOrder++ ;
			}
			return true ;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}

