package com.ufgov.whs.approval.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.ufgov.whs.approval.bean.ApprovalForm;
import com.ufgov.whs.approval.bean.ApprovalReport;
import com.ufgov.whs.approval.bean.FormAttachment;
import com.ufgov.whs.approval.bean.ReportAttachment;
import com.ufgov.whs.approval.dao.ApprovalReportDao;
import com.ufgov.whs.approval.dao.ReportAttachmentDao;
import com.ufgov.whs.common.utils.DateUtils;

/**
 * 权限service
 * @author fucj
 * @date 2015年1月13日
 */
@Service
@Transactional(readOnly=true)
public class ReportAttachmentService{
	
	@Autowired
	private ReportAttachmentDao reportAttachmentDao;
	
	@Autowired
    JdbcTemplate jdbc;
	
	/**
	 * 保存审批单
	 * @param id
	 * @return 用户对象
	 */
	@Transactional(readOnly = false)
	public void save(List<ReportAttachment> ralist) {
		reportAttachmentDao.save(ralist);		
	}
	
	/**
	 * 保存审批单
	 * @param id
	 * @return 用户对象
	 */
	@Transactional(readOnly = false)
	public void save(ReportAttachment ra) {
		reportAttachmentDao.save(ra);		
	}
	
	@Transactional(readOnly = false)
	public void delete(Integer id){
		reportAttachmentDao.delete(id);
	}
	
	@Transactional(readOnly = false)
	public void delete(ReportAttachment ra){
		reportAttachmentDao.delete(ra);
	}
	
	public Integer getIdByDocId(String docId){
		return reportAttachmentDao.getIdByDocId(docId);
	}
	
	public ReportAttachment getReportAttachmentByDocId(String docId){
		return reportAttachmentDao.getReportAttachmentByDocId(docId);
	}
	
	public Integer getMaxDisplayOrderByFormId(String formId){
		return reportAttachmentDao.getMaxDisplayOrderByFormId(formId);
	}
	
	public List<ReportAttachment> getReportAttachmentByIdAndDocType(String formId,int docType,String delFlag){
		return reportAttachmentDao.getReportAttachmentByIdAndDocType(formId, docType, delFlag);
	}
	
	public List<ReportAttachment> getReportAttachmentByIdAndOtherFlag(String formId,String otherFlag,String delFlag){
		return reportAttachmentDao.getReportAttachmentByIdAndOtherFlag(formId,otherFlag, delFlag);
	}
	
	/**
	 * 保存批注审批单附件
	 * @param id
	 * @return 用户对象
	 */
	@Transactional(readOnly = false)
	public void saveReportAttachment(String docId,String pzDocId) {
		ReportAttachment ra = getReportAttachmentByDocId(docId);
		if(ra!=null){
			ReportAttachment pz = new ReportAttachment(ra.getFormId(), ra.getDocType(),ra.getDocName(),
					pzDocId, ra.getDisplayOrder(), ra.getIslegal(), ra.getCheckType(),
					new Integer(1), ra.getStatu());
			pz.setCreateTime(DateUtils.getSysDate());
			pz.setOtherFlag(ra.getOtherFlag());
			pz.setFiletypeName(ra.getFiletypeName());
			save(pz);			
		}
	}
	
	public ReportAttachment getOneReportAttachmentByIdAndDocTypeAndScene(String formId,int docType,String delFlag,String scene){
		return reportAttachmentDao.getOneReportAttachmentByIdAndDocTypeAndScene(formId,docType,delFlag,scene);
	}
	public ReportAttachment getOneReportAttachmentByIdAndOtherTypeAndScene(String formId,String otherFlag,String delFlag,String scene){
		return reportAttachmentDao.getOneReportAttachmentByIdAndOtherTypeAndScene(formId,otherFlag,delFlag,scene);
	}
	
	
	public List<ReportAttachment> getAllOtherFlag(String formId){
		return reportAttachmentDao.getAllOtherFlag(formId);
	}
}
  