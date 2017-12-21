package com.ufgov.whs.guide.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ufgov.whs.guide.bean.GuideAttachment;
import com.ufgov.whs.guide.dao.GuidesAttachmentDao;

/**
 * 用户指南附件service
 * @author xlli
 * @date 2017-10-12
 */
@Service
@Transactional(readOnly = true)
public class GuidesAttachmentService{
	
	@Autowired
	private GuidesAttachmentDao guidesAttachmentDao;
	
	/**
	 * 根据办事指南Id查找相关附件
	 * @param guidesId
	 * @return
	 * @throws Exception
	 */
	public List<GuideAttachment> getAttachmentByGuideId(Integer guidesId) throws Exception{
		return guidesAttachmentDao.getAttachmentByGuideId(guidesId);
	}
	
	/**
	 * 保存办事指南相关附件
	 * @param attachmentList
	 * @param guideId
	 * @return
	 */
	@Transactional(readOnly = false)
	public boolean save(List<GuideAttachment> attachmentList,Integer guideId) {
		try {
			//保存之前先删除此办事指南相关的附件
			guidesAttachmentDao.deleteAttachmentByGuideId(guideId) ;
			//附件排序
			Integer displayOrder = 1 ;
			//保存
			for(GuideAttachment attachment : attachmentList){
				attachment.setGuideId(guideId);
				attachment.setDisplayOrder(displayOrder);
				guidesAttachmentDao.save(attachment);
				displayOrder++ ;
			}
			return true ;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	

}

