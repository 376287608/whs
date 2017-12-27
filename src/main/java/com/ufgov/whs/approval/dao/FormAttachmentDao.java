package com.ufgov.whs.approval.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;

import com.ufgov.whs.approval.bean.ApprovalReport;
import com.ufgov.whs.approval.bean.FormAttachment;
import com.ufgov.whs.system.user.bean.SysUser;

/**
 * 申请单附件DAO
 * @author fucj
 * @date 2017年9月18日
 */
public interface FormAttachmentDao extends PagingAndSortingRepository<FormAttachment, Serializable>, JpaSpecificationExecutor<FormAttachment>, Repository<FormAttachment, Serializable>{
	@Query("select f from FormAttachment f where f.formId = ?1 and f.delFlag = '1' order by displayOrder ")
	List<FormAttachment> getFormAttachmentByFormId(String formId);
	/**
	 * 已办结申请单附件
	 */
	@Query(value = "select * from form_attachment where form_id = ?1 and del_flag = '1' and scene = '1' order by display_order ", nativeQuery = true)
	List<FormAttachment> getFormAttachmentByFormIdIsFinish(String formId);
	
	@Query("select f from FormAttachment f where f.formId = ?1 and f.delFlag = ?2 order by displayOrder ")
	List<FormAttachment> getFormAttachmentByFormIdAndDelFlag(String formId,String delFlag);
	
	@Query("select f from FormAttachment f where f.formId = ?1 and f.statu = ?2 and f.delFlag = '1' ")
	List<FormAttachment> getFormAttachmentByFormIdAndStatu(String formId,String statu);
	
	@Query("select id from FormAttachment f where f.docId = ?1")
	Integer getIdByDocId(String docId);
		
	@Query(value = "SELECT max(display_order) FROM form_attachment b WHERE b.form_id = ?1", nativeQuery = true)
	Integer getMaxDisplayOrderByFormId(String formId);
	
	@Query(value = "select * from form_attachment where del_flag='1' and form_id = ?1 and doc_type = ?2 and statu = ?3 ", nativeQuery = true)
	FormAttachment getByDocTypeAndSoOn(String formId,Integer docType,String statu);
	
	@Query(value = "select * from form_attachment where del_flag='1' and  form_id = ?1 and other_flag = ?2 and statu = ?3 ", nativeQuery = true)
	FormAttachment getByOtherFlagAndSoOn(String formId,String otherFlag,String statu);
	
	@Query("select f from FormAttachment f where f.docId = ?1")
	FormAttachment getFormAttachmentByDocId(String docId);
	
	@Query("select f from FormAttachment f where f.formId = ?1 and f.statu = ?2  and f.scene =?3 and f.delFlag = '1' order by displayOrder")
	List<FormAttachment> getFormAttachmentByFormIdAndStatuAndScene(String formId,String statu,int scene);
	
	@Query(value = "select * from form_attachment where form_id = ?1 and other_flag = ?2 limit 1 ", nativeQuery = true)
	FormAttachment getOneOtherFlag(String formId,String otherFlag);
	
	@Query(value = "select * from form_attachment where form_id = ?1 and other_flag is not null and del_flag='1' ", nativeQuery = true)
	List<FormAttachment> getAllOtherFlag(String formId);
}
