package com.ufgov.whs.approval.service;

import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ufgov.whs.approval.bean.FormAttachment;
import com.ufgov.whs.approval.dao.FormAttachmentDao;

/**
 * 申请单附件service
 * @author xlli
 * @date 2015年1月13日
 */
@Service
@Transactional(readOnly=true)
public class FormAttachmentService{
	
	@Autowired
	private FormAttachmentDao formAttachmentDao ;
	
	
	public FormAttachment getOneOtherFlag(String formId,String otherFlag){
		return formAttachmentDao.getOneOtherFlag(formId, otherFlag);
	}
	/**
	 * 查找未办结申请单附件
	 * @param formId
	 * @return
	 */
	public List<FormAttachment> getFormAttachmentByFormId(String formId){
		List<FormAttachment> list = formAttachmentDao.getFormAttachmentByFormId(formId);
		FormAttachment formAttachment = null ;
		//list不为空
		if(list != null && list.size()>0){
			Iterator<FormAttachment> iterator = list.iterator();
			while(iterator.hasNext()){
				formAttachment = iterator.next();
				//状态等于2
				if(formAttachment.getStatu().equals("2")){
					FormAttachment attachment = null ;
					//业务类型原有的附件
					if(formAttachment.getDocType() != null){
						attachment = formAttachmentDao.getByDocTypeAndSoOn(formAttachment.getFormId(), formAttachment.getDocType(), "1");
					//其他附件
					}else if(formAttachment.getDocType() == null && formAttachment.getOtherFlag() != null){
						attachment = formAttachmentDao.getByOtherFlagAndSoOn(formAttachment.getFormId(), formAttachment.getOtherFlag(), "1");
					}
					if(attachment != null){
						iterator.remove();
					}
				}
			}
			Collections.sort(list);
		}
		return list ;
	}
	
	/**
	 * 已办结申请单附件
	 * @param formId
	 * @return
	 * @throws Exception
	 */
	public List<FormAttachment> getFormAttachmentByFormIdIsFinish(String formId) throws Exception{
		if(StringUtils.isBlank(formId)){
			return null ;
		}
		return formAttachmentDao.getFormAttachmentByFormIdIsFinish(formId);
	}
	
	@Transactional(readOnly = false)
	public void save(FormAttachment fa){
		formAttachmentDao.save(fa);
	}
	/**
	 * 根据申请单及附件状态查找附件
	 * @param formId
	 * @return
	 */
	public List<FormAttachment> getFormAttachmentByFormIdAndStatu(String formId,String statu){
		return formAttachmentDao.getFormAttachmentByFormIdAndStatu(formId,statu);
	}
	
	/**
	 * 根据申请单及附件状态查找附件
	 * @param formId
	 * @return
	 */
	public List<FormAttachment> getFormAttachmentByFormIdAndDelFlag(String formId,String delFlag){
		return formAttachmentDao.getFormAttachmentByFormIdAndDelFlag(formId,delFlag);
	}
	
	public Integer getIdByDocId(String docId){
		return formAttachmentDao.getIdByDocId(docId);
	}
	
	@Transactional(readOnly = false)
	public void delete(Integer id){
		formAttachmentDao.delete(id);
	}
	
	@Transactional(readOnly = false)
	public void delete(FormAttachment fa){
		formAttachmentDao.delete(fa);
	}
	
	public Integer getMaxDisplayOrderByFormId(String formId){
		return formAttachmentDao.getMaxDisplayOrderByFormId(formId);
	}
	
	public FormAttachment getFormAttachmentByDocId(String docId){
		return formAttachmentDao.getFormAttachmentByDocId(docId);
	}
	
	public List<FormAttachment> getAllOtherFlag(String formId){
		return formAttachmentDao.getAllOtherFlag(formId);
	}
}
  