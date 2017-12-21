package com.ufgov.whs.approval.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;
import org.springframework.data.repository.query.Param;

import com.ufgov.whs.approval.bean.FormAttachment;
import com.ufgov.whs.approval.bean.ReportAttachment;

/**
 * 受理报告单附件DAO
 * @author fucj
 * @date 2017年9月18日
 */
public interface ReportAttachmentDao extends PagingAndSortingRepository<ReportAttachment, Serializable>, JpaSpecificationExecutor<ReportAttachment>, Repository<ReportAttachment, Serializable>{
	@Query("select r from ReportAttachment r where r.formId = ?1 and r.delFlag = '1' order by displayOrder")
	List<ReportAttachment> getReportAttachmentById(String formId);	
	
	@Query("select id from ReportAttachment f where f.docId = ?1")
	Integer  getIdByDocId(String docId);
	
	@Query("select f from ReportAttachment f where f.docId = ?1")
	ReportAttachment getReportAttachmentByDocId(String docId);

	@Query("from ReportAttachment where formId in (:ids) and delFlag = '1'")
	List<ReportAttachment> findSomeByIds(@Param(value = "ids") List<String> ids);
	
	@Query(value = "SELECT max(display_order) FROM report_attachment b WHERE b.form_id = ?1", nativeQuery = true)
	Integer getMaxDisplayOrderByFormId(String formId);
	
	@Query("select r from ReportAttachment r where r.formId = ?1 and r.scene = ?2 order by displayOrder")
	List<ReportAttachment> getReportAttachmentByIdAndScene(String formId,int scene);

	@Query(value = "SELECT * from report_attachment where del_flag = '1' and doc_type = ?2 and scene = ?3 and form_id = ?1 ", nativeQuery = true)
	ReportAttachment getByDocTypeAndSoOn(String formId, Integer docType,
			String scene);

	@Query(value = "SELECT * from report_attachment where del_flag = '1' and other_flag = ?2 and scene = ?3 and form_id = ?1 ", nativeQuery = true)
	ReportAttachment getByOtherFlagAndSoOn(String formId, String otherFlag,
			String string);	
	
	@Query("select r from ReportAttachment r where r.formId = ?1 and r.docType=?2 and r.delFlag = ?3 order by displayOrder")
	List<ReportAttachment> getReportAttachmentByIdAndDocType(String formId,int docType,String delFlag);
	
	@Query("select r from ReportAttachment r where r.formId = ?1 and r.otherFlag=?2 and r.delFlag = ?3 order by displayOrder")
	List<ReportAttachment> getReportAttachmentByIdAndOtherFlag(String formId,String otherFlag,String delFlag);
	
	@Query(value = "select * from report_attachment r where r.form_id = ?1 and r.doc_type=?2 and r.del_flag = ?3 and r.scene=?4 ORDER BY r.create_time desc limit 1", nativeQuery = true)
	ReportAttachment getOneReportAttachmentByIdAndDocTypeAndScene(String formId,int docType,String delFlag,String scene);
	
	
	@Query(value = "select * from report_attachment r where r.form_id = ?1 and r.other_flag=?2 and r.del_flag = ?3 and r.scene=?4 ORDER BY r.create_time desc limit 1", nativeQuery = true)
	ReportAttachment getOneReportAttachmentByIdAndOtherTypeAndScene(String formId,String otherFlag,String delFlag,String scene);
	
	@Query(value = "select * from report_attachment where del_flag = '0' and form_id = ?1 and doc_type = ?2 ORDER BY create_time desc limit 1", nativeQuery = true)
	ReportAttachment getPreversionByDocType(String formId,Integer docType);
	
	@Query(value = "select * from report_attachment where del_flag = '0' and form_id = ?1 and other_flag = ?2 ORDER BY create_time desc limit 1", nativeQuery = true)
	ReportAttachment getPreversionByOtherFlag(String formId,String otherFlag);
	
	@Query(value = "select * from report_attachment where form_id = ?1 and other_flag is not null and del_flag='1' ", nativeQuery = true)
	List<ReportAttachment> getAllOtherFlag(String formId);
}
