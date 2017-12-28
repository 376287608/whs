package com.ufgov.whs.process.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.jdbc.core.JdbcTemplate;

import com.ufgov.whs.attachment.bean.DocAddrInfo;
import com.ufgov.whs.attachment.service.IDocAddrInfoService;
import com.ufgov.whs.business.service.BusinessService;
import com.ufgov.whs.common.mapper.BeanMapper;
import com.ufgov.whs.process.bean.ProStep;
import com.ufgov.whs.process.dao.ProStepDao;
import com.ufgov.whs.system.bankuser.bean.VBankUser;
import com.ufgov.whs.system.bankuser.dao.BankUserDao;
import com.ufgov.whs.system.user.bean.SysUser;
import com.ufgov.whs.system.utils.UserUtil;
/**
 * 流程环节service
 * @author fucj
 * @date 2017年10月20日
 */
@Service
@Transactional(readOnly=true)
public class ProStepService{
	
	@Autowired
	private ProStepDao proStepDao;
	
	@Autowired
    JdbcTemplate jdbc;
	
	@Autowired
	private BusinessService businessService;
	
	@Autowired
	private BankUserDao bankUserDao;
	
	@Autowired
	private IDocAddrInfoService docAddrInfoService ;
	
	/**
	 * 流程第一步
	 * @param processId
	 */

	public ProStep getFirstStep(Integer processId){
		StringBuffer sb=new StringBuffer();
		sb.append("SELECT u.id,u.process_id as processId,u.step_name as stepName,u.step_order as stepOrder,u.approval_role_id as approvalRoleId,u.approval_role_name as approvalRoleName from pro_step u where u.process_id=? order by u.step_order limit 1 ");
		List<Map<String, Object>> prostepList = jdbc.queryForList(sb.toString(),new Object[]{processId});
		ProStep first = null;
		if(prostepList!=null && prostepList.size()>0){
			first = BeanMapper.map(prostepList.get(0), ProStep.class);
		}		
		return first;
	}
	/**
	 * 当前步骤下一步
	 * @param processId,currentStep
	 */
	public ProStep getNextStep(Integer processId,Integer currentStep){
		StringBuffer sb=new StringBuffer();
		sb.append("SELECT u.id,u.process_id as processId,u.step_name as stepName,u.step_order as stepOrder,u.approval_role_id as approvalRoleId,u.approval_role_name as approvalRoleName from pro_step u where u.process_id=? and  u.step_Order>? order by u.step_order asc limit 1 ");
		List<Map<String, Object>> prostepList = jdbc.queryForList(sb.toString(),new Object[]{processId,currentStep});
		ProStep next = null;
		if(prostepList!=null && prostepList.size()>0){
			next = BeanMapper.map(prostepList.get(0), ProStep.class);
		}		
		return next;
	}
	/**
	 * 是否是流程最后一步
	 * @param processId,currentStep
	 */
	public boolean isLastStep(Integer processId,Integer currentStep){
		StringBuffer sb=new StringBuffer();
		sb.append("SELECT u.id,u.process_id as processId,u.step_name as stepName,u.step_order as stepOrder,u.approval_role_id as approvalRoleId,u.approval_role_name as approvalRoleName from pro_step u where u.process_id=? and  u.step_Order>? order by u.step_order asc limit 1 ");
		List<Map<String, Object>> prostepList = jdbc.queryForList(sb.toString(),new Object[]{processId,currentStep});
		if(prostepList==null || prostepList.size() == 0){
			return true;
		}		
		return false;
	}
	
	/**
	 * 是否是流程第一步
	 * @param processId,currentStep
	 */
	public boolean isFirstStep(Integer processId,Integer currentStep){
		StringBuffer sb=new StringBuffer();
		sb.append("SELECT u.id,u.process_id as processId,u.step_name as stepName,u.step_order as stepOrder,u.approval_role_id as approvalRoleId,u.approval_role_name as approvalRoleName from pro_step u where u.process_id=? and  u.step_Order<? order by u.step_order asc limit 1 ");
		List<Map<String, Object>> prostepList = jdbc.queryForList(sb.toString(),new Object[]{processId,currentStep});
		if(prostepList==null || prostepList.size() == 0){
			return true;
		}		
		return false;
	}
	
	/**
	 * 当前步骤
	 * @param processId,currentStep
	 */
	public ProStep getCurrentStep(Integer currentStep){
		return proStepDao.findOne(currentStep);
	}
	
	/**
	 * 当前步骤
	 * @param processId,currentStep
	 */
	public ProStep getCurrentStep(Integer processId,Integer currentStep){
		return proStepDao.getStepByProcessId(processId,currentStep);
	}
	
	/**
	 * 当前步骤顺序号
	 * @param processId,currentStep
	 */
	public int getCurrentStepOrder(Integer currentStep){
		ProStep ps = getCurrentStep(currentStep);
		return ps.getStepOrder();
	}
	
	
	/**
	 * 当前步骤上一步
	 * @param processId,currentStep
	 */
	public ProStep getPreviousStep(Integer processId,Integer currentStep){
		int currentOrder = getCurrentStepOrder(currentStep);
		StringBuffer sb=new StringBuffer();
		sb.append("SELECT u.id,u.process_id as processId,u.step_name as stepName,u.step_order as stepOrder,u.approval_role_id as approvalRoleId,u.approval_role_name as approvalRoleName from pro_step u where u.process_id=? and  u.step_Order<? order by u.step_order desc limit 1 ");
		List<Map<String, Object>> prostepList = jdbc.queryForList(sb.toString(),new Object[]{processId,currentOrder});
		ProStep pre = null;
		if(prostepList!=null && prostepList.size()>0){
			pre = BeanMapper.map(prostepList.get(0), ProStep.class);
		}		
		return pre;
	}
	
	/**
	 * 当前步骤上几步
	 * @param processId,currentStep
	 */
	public List<ProStep> getPreviousSteps(Integer processId,Integer currentStep){
		int currentOrder = getCurrentStepOrder(currentStep);
		StringBuffer sb=new StringBuffer();
		sb.append("SELECT u.id,u.process_id as processId,u.step_name as stepName,u.step_order as stepOrder,u.approval_role_id as approvalRoleId,u.approval_role_name as approvalRoleName from pro_step u where u.process_id=? and  u.step_Order<? order by u.step_order desc");
		List<Map<String, Object>> prostepList = jdbc.queryForList(sb.toString(),new Object[]{processId,currentOrder});
		List<ProStep> prelist = null;
		if(prostepList!=null && prostepList.size()>0){
			prelist = BeanMapper.mapList(prostepList, ProStep.class);
		}		
		return prelist;
	}
	
	/**
	 * 当前步骤上几步全部操作人员
	 * @param processId,currentStep
	 */
	public List<VBankUser> getPreviousOperator(Integer processId,Integer currentStep,Integer businessId){
		List<ProStep> prelist = getPreviousSteps(processId,currentStep);
		List<VBankUser> preOperator = new ArrayList<VBankUser>();
		if(prelist!=null && prelist.size()>0){
			for(ProStep ps:prelist){
				List<VBankUser> s = businessService.getAcceptUserBy(businessId, ps.getApprovalRoleId());
				for(VBankUser vb : s){
					vb.setStepId(ps.getStepOrder());
				}
				preOperator.addAll(s);
			}
		}	
		return preOperator;
	}
	
	/**
	 * 当前步骤下一步骤操作人员
	 * @param processId,currentStep
	 */
	public List<VBankUser> getNextStepOperator(Integer processId,Integer currentStep,Integer businessId){
		ProStep ps = getNextStep(processId,currentStep);
		Integer roleId = ps.getApprovalRoleId();
		List<VBankUser> nextOperator = null;
		nextOperator = businessService.getAcceptUserBy(businessId, roleId);
		if(nextOperator!=null && nextOperator.size()>0){
			for(VBankUser vb:nextOperator){
				vb.setStepId(ps.getStepOrder());
			}
		}
		return nextOperator;
	}

	/**
	 * 当前步骤其它操作人员
	 * @param processId,currentStep
	 */
	public List<VBankUser> getOtherOperator(Integer processId,Integer currentStep,Integer businessId){
		ProStep ps = getCurrentStep(processId,currentStep);
		Integer roleId = ps.getApprovalRoleId();
		List<VBankUser> otherOperator = null;
		otherOperator = businessService.getAcceptUserBy(businessId, roleId);
		if(otherOperator!=null && otherOperator.size()>0){
			for(int i = otherOperator.size() -1  ; i >=0; i-- ){
				VBankUser vb  = otherOperator.get(i);
				vb.setStepId(ps.getStepOrder());
				if(vb.getUserId().equals(UserUtil.getCurrentUser().getId())){
					otherOperator.remove(vb);
				}
			}
		}
		return otherOperator;
	}
	
	
	/**
	 * 根据审批单查找该流程最后审批角色
	 * @param reportId
	 * @return
	 */
	public ProStep getMaxStepByReportId(String reportId){
		if(StringUtils.isBlank(reportId)){
			return null ;
		}
		if(isInner()){
			return proStepDao.getInnerMaxStepByReportId(reportId);
		}else{
			return proStepDao.getMaxStepByReportId(reportId);
		}
	}
	
	/**
	 * 判断是否是内网
	 * @param request
	 * @return
	 */
	public boolean isInner(){
		//内网标识
		boolean flag = false ;
		//获取网络标识 1 互联网 2 内网
		DocAddrInfo docAddrInfo = docAddrInfoService.queryById("SD");
		//内网
		if(docAddrInfo != null && docAddrInfo.getRealAddr().equals("2")){
			flag = true ;
		}
		return flag ;
	}
	
	/**
	 * 根据流程id保存相关步骤
	 * @param proSteps
	 * @param processId
	 * @param user
	 * @return
	 */
	@Transactional(readOnly = false)
	public boolean save(List<ProStep> proSteps, Integer processId,SysUser user){
		try {
			//保存之前先删除之前的关联关系 
			proStepDao.deleteStepByProcessId(processId);
			//保存步骤
			for(ProStep proStep : proSteps){
				proStep.setProcessId(processId);
				proStep.setDelFlag("1");
				proStep.setCreateBy(bankUserDao.findByUserId(user.getId()).getName());
				proStep.setCreateDate(new Timestamp(System.currentTimeMillis()));
				proStep.setUpdateBy(bankUserDao.findByUserId(user.getId()).getName());
				proStep.setUpdateDate(new Timestamp(System.currentTimeMillis()));
				proStepDao.save(proStep);
			}
			return true ;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 根据流程id查找相关步骤
	 * @param processId
	 * @return
	 * @throws Exception
	 */
	public List<ProStep> getStepByProcessId(Integer processId) throws Exception{
		if(processId == null) return null ;
		return proStepDao.getStepByProcessId(processId);
	}
}
