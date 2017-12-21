package com.ufgov.whs.businesslog.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ufgov.whs.businesslog.bean.BusinessLog;
import com.ufgov.whs.businesslog.dao.BusinessLogDao;
import com.ufgov.whs.common.utils.DateUtils;
import com.ufgov.whs.process.service.ProStepService;
import com.ufgov.whs.system.utils.UserUtil;


/**
 * 业务日志service
 * @author fucj
 * @date 2015年1月14日
 */
@Service
@Transactional(readOnly=true)
public class BusinessLogService{
	
	@Autowired
	private BusinessLogDao businessLogDao;
	
	@Autowired
	private ProStepService proStepService;
	
	
	@Transactional(readOnly = false)
	public void save(BusinessLog log) {
		businessLogDao.save(log);
	}
	
	/**
	 * 按id查询日志
	 * @param id
	 * @return 业务日志
	 */
	public BusinessLog get(int id) {
		return businessLogDao.findOne(id);		
	}
	
	/**
	 * 查找在办业务的上一环节人和上一环节时间
	 * @param reportId
	 * @param loginName
	 * @return
	 */
	public BusinessLog getBackByReportId(String reportId,String loginName){
		return businessLogDao.getBackByReportId(reportId, loginName);
	}
	
	/**
	 * 根据审批单序号查找log
	 * @param reportId
	 * @return
	 * @throws Exception
	 */
	public List<BusinessLog> getByReportId(String reportId) throws Exception{
		return businessLogDao.getByReportId(reportId);
	}
	
	/**
	 * 查询当前意见
	 * @param loginName
	 * @param reportId
	 * @return
	 * @throws Exception
	 */
	public BusinessLog getCurrentUserBusinessLog(String loginName,String reportId)throws Exception{
		return businessLogDao.getCurrentUserBusinessLog(loginName, reportId);
	}
	
	public BusinessLog getLastOperatorLog(String reportId){
		return businessLogDao.getLastOperatorLog(reportId);
	}
	
	public BusinessLog getOperatorLogByStepId(String reportId,Integer stepId){
		return businessLogDao.getOperatorLogByStepId(reportId,stepId);	
	}

	/**
	 * 启动日志
	 * @param resource
	 */
	@Transactional(readOnly=false)
	public void generateBusinessLog(String operation,String formId,String reportId,String businessVerifyCode) {
		 BusinessLog log = new BusinessLog();
		 log.setFormId(formId);
		 log.setOperatorBy(UserUtil.getCurrentUser().getLoginName());
		 log.setOpertionName(operation);
		 log.setReceiveDate(DateUtils.getSysTimestamp());
		 log.setReportId(reportId);
		 log.setBusinessVerifyCode(businessVerifyCode);
		 save(log);
	}
	
	/**
	 * 启动日志
	 * @param resource
	 */
	@Transactional(readOnly=false)
	public void insertBusinessLog(String operation,String formId,Integer stepId,String reportId,Timestamp receiveDate,String operationOpinion,String businessVerifyCode) {		
		 BusinessLog log = new BusinessLog();
		 log.setFormId(formId);
		 log.setOperatorBy(UserUtil.getCurrentUser().getLoginName());
		 log.setOpertionName(operation);
		 log.setEndDate(DateUtils.getSysTimestamp());
		 log.setReportId(reportId);
		 log.setStepId(stepId);
		 log.setReceiveDate(receiveDate);
		 log.setOperationOpinon(operationOpinion);
		 log.setBusinessVerifyCode(businessVerifyCode);
		 save(log);
	}
}
