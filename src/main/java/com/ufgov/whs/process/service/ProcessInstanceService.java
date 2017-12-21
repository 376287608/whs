package com.ufgov.whs.process.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.jdbc.core.JdbcTemplate;

import com.ufgov.whs.approval.bean.ApprovalForm;
import com.ufgov.whs.business.bean.BuBusiness;
import com.ufgov.whs.business.dao.BusinessDao;
import com.ufgov.whs.common.mapper.BeanMapper;
import com.ufgov.whs.common.utils.DateUtils;
import com.ufgov.whs.process.bean.ProInstance;
import com.ufgov.whs.process.bean.ProStep;
import com.ufgov.whs.process.dao.ProcessInstanceDao;
import com.ufgov.whs.system.user.bean.SysUser;
import com.ufgov.whs.system.utils.ResultConstant;
import com.ufgov.whs.system.utils.UserUtil;
import com.ufgov.whs.process.bean.Process;
/**
 * 权限service
 * @author fucj
 * @date 2015年1月13日
 */
@Service
@Transactional(readOnly=true)
public class ProcessInstanceService{
	
	@Autowired
	private ProcessInstanceDao processInstanceDao;
	
	@Autowired
    JdbcTemplate jdbc;
	
	@Autowired
	private ProStepService proStepService;
	
	/**
	 * 获取当前流程实例
	 * @param resource
	 */
	public ProInstance getProInstanceByReportId(String reportId){
		return processInstanceDao.getProInstanceByReportId(reportId);
	}
	
	/**
	 * 根据流程id查找实例
	 * @param processId
	 * @return
	 */
	public ProInstance getProInstanceByProcessId(Integer processId){
		if(processId == null) return null ;
		return processInstanceDao.getProInstanceByProcessId(processId);
	}
	
	/**
	 * 判断该流程实例是否是启动状态
	 * @param proInstance
	 * @return
	 */
	public boolean isStart(ProInstance proInstance) {
		if(proInstance == null) return false ;
		if(proInstance.getStatus().equals(ResultConstant.PROCESS_STATUS_FZ) || proInstance.getStatus().equals(ResultConstant.PROCESS_STATUS_JS)){
			return false ;
		}
		return true;
	}
	
	/**
	 * 根据流程id判断该流程是否启动
	 * @param processId
	 * @return
	 */
	public boolean isStartByProcessId(Integer processId) {
		if(processId == null) return false ;
		return isStart(getProInstanceByProcessId(processId));
	}
	
	
	
	/**
	 * 获取当前流程实例
	 * @param resource
	 */
	public ProInstance getProInstanceByReportId(String reportId,String statu){
		return processInstanceDao.getProInstanceByReportId(reportId,statu);
	}
	/**
	 * 启动流程
	 * @param resource
	 */
	@Transactional(readOnly=false)
	public Integer startInstance(String reportId,Process p) {
		 ProStep ps = proStepService.getFirstStep(p.getId());
		 ProInstance pi = new ProInstance();
		 pi.setReportId(reportId);
		 pi.setProcessId(p.getId());
		 pi.setStartTime(DateUtils.getSysTimestamp());
		 pi.setCurrentstepTime(DateUtils.getSysTimestamp());
		 pi.setCurrentstep(ps.getStepOrder());
		 pi.setCurrentuser(UserUtil.getCurrentUser().getLoginName());
		 //pi.setCurrentuser("majq");
		 pi.setDelFlag("1");
		 pi.setStatus(ResultConstant.PROCESS_STATUS_QD);
		 ProInstance createpi = processInstanceDao.save(pi);
		 return createpi.getId();
	}
	/**
	 * 保存流程
	 * @param resource
	 */
	@Transactional(readOnly=false)
	public void save(ProInstance pi) {
		// TODO Auto-generated method stub
		processInstanceDao.save(pi);	
	}
 
	/**
	 *按id查询流程实例
	 * @param id
	 * @return 流程实例
	 */
	public ProInstance get(int id) {
		return processInstanceDao.findOne(id);		
	}

}
