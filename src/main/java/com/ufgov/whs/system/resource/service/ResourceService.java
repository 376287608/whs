package com.ufgov.whs.system.resource.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ufgov.whs.approval.bean.ApprovalReport;
import com.ufgov.whs.approval.service.ApprovalFormService;
import com.ufgov.whs.approval.service.ApprovalReportService;
import com.ufgov.whs.business.service.BusinessService;
import com.ufgov.whs.businesslog.bean.BusinessLog;
import com.ufgov.whs.businesslog.service.BusinessLogService;
import com.ufgov.whs.process.bean.ProInstance;
import com.ufgov.whs.process.service.ProStepService;
import com.ufgov.whs.process.service.ProcessInstanceService;
import com.ufgov.whs.system.bankuser.bean.VBankUser;
import com.ufgov.whs.system.resource.bean.SysResource;



import com.ufgov.whs.system.resource.dao.ResourceDao;
import com.ufgov.whs.system.user.bean.SysUser;
import com.ufgov.whs.system.utils.ResultConstant;
import com.ufgov.whs.system.utils.StatuConstant;
import com.ufgov.whs.system.utils.UserUtil;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 * 权限service
 * @author fucj
 * @date 2015年1月13日
 */
@Service
@Transactional(readOnly=true)
public class ResourceService{
	
	@Autowired
	private ResourceDao resouceDao;
	
	@Autowired
    JdbcTemplate jdbc;
	
	@Autowired
	BusinessService businessService;
	
	
	@Autowired
	private ApprovalFormService approvalFormService;
	
	@Autowired
	private ApprovalReportService approvalReportService;
	
	@Autowired
	private ProcessInstanceService processInstanceService;
	
	@Autowired
	private ProStepService proStepService;
	
	@Autowired
	private BusinessLogService businessLogService;
	
	/**
	 * 添加菜单基础操作
	 * @param pid 菜单id
	 * @param pName 菜单权限标识名
	 */
	@Transactional(readOnly = false)
	public void addBaseOpe(Integer pid,String pClassName){
		List<SysResource> pList=new ArrayList<SysResource>();
		//pList.add(new SysResource(pid, "添加", "O", "", "sys:"+pClassName+":add"));
		//pList.add(new SysResource(pid, "删除", "O", "", "sys:"+pClassName+":delete"));
		//pList.add(new SysResource(pid, "修改", "O", "", "sys:"+pClassName+":update"));
		//pList.add(new SysResource(pid, "查看", "O", "", "sys:"+pClassName+":view"));
		
		//添加没有的基本操作
		List<SysResource> existPList=getMenuOperation(pid);
		for(SysResource resource:pList){
			boolean exist=false;
			for(SysResource existPermission:existPList){
				if(resource.getResourceType().equals(existPermission.getResourceType())){
					exist=true;
					break;
				}else{
					exist=false;
				}
			}
			if(!exist)
				resouceDao.save(resource);
		}
	}
	/*
	 * 获取权限集合
	 * */
	
	public SysResource get(int id) {
		return resouceDao.findOne(id);		
	}
	/**
	 * 保存权限
	 * @param resource
	 */
	@Transactional(readOnly=false)
	public void save(SysResource resource) {
		resouceDao.save(resource);
	}
	
	/**
	 * 列出权限
	 * @param resource
	 */
	public List<SysResource> getAll() {
		return (List<SysResource>) resouceDao.findAll();
	}
	
	/**
	 * 获取角色拥有的权限集合
	 * @param userId
	 * @return 结果集合
	 */
	public List<SysResource> getPermissions(Integer userId){
		//String username = approvalFormService.getAssignRecieve(3, "柜台人员");
		//List<VBankUser> vb = businessService.getAcceptUserBy(3, 1);
		return findPermissions(userId);
	}
	
	/**
	 * 获取角色拥有的菜单
	 * @param userId
	 * @return 菜单集合
	 */
	public List<SysResource> getMenus(Integer userId){
		return findMenus(userId);
	}
	
	/**
	 * 获取所有菜单
	 * @return 菜单集合
	 */
	public List<SysResource> getMenus(){
		return findMenus();
	}
	
	/**
	 * 获取菜单下的操作
	 * @param pid
	 * @return 操作集合
	 */
	public List<SysResource> getMenuOperation(Integer pid){
		return findMenuOperation(pid);
	}
	/**
	 * 测试数据导出
	 * @param pid
	 * @return 操作集合
	 */
	public void exportData(){
		String sql = "select * from resource where ID = 1"+
				     "into outfile 'E:/developsoft/mysql-5.7.18-winx64/output/resource.csv'"+
				     "fields terminated by ','"+
                     "enclosed by '\"' lines terminated by '\r\n'";
		jdbc.execute(sql);
	}
	
	/**
	 * 删除权限
	 * @param id
	 */
	@Transactional(readOnly=false)
	public void delete(Integer id){
		resouceDao.delete(id);
	}
	
	/**
	 * 查询用户拥有的菜单
	 * @param userId 用户id
	 * @return 结果集合
	 */
	@SuppressWarnings("unchecked")
	public List<SysResource> findPermissions(Integer userId){
		StringBuffer sb=new StringBuffer();
		sb.append("select p.* from sys_resource p ");
		sb.append("INNER JOIN sys_role_permission rp on p.ID=rp.PERMISSION_ID ");
		sb.append("INNER JOIN sys_role r ON  r.id=rp.ROLE_ID ");
		sb.append("INNER JOIN sys_user_role  ur ON ur.ROLE_ID =rp.ROLE_ID ");
		sb.append("INNER JOIN sys_user u ON u.id = ur.USER_ID ");
		sb.append("where u.id=? and p.resource_type = '0' order by p.sort");
		List<Map<String, Object>> permList = jdbc.queryForList(sb.toString(),new Object[]{userId});
		return SysResource.toObject(permList);
	}
	
	
	/**
	 * 查询用户拥有的按钮
	 * @param userId 用户id
	 * @return 结果集合
	 */
	@SuppressWarnings("unchecked")
	public List<SysResource> findButtons(Integer userId,String resourceType){
		StringBuffer sb=new StringBuffer();
		sb.append("select p.* from sys_resource p ");
		sb.append("INNER JOIN sys_role_permission rp on p.ID=rp.PERMISSION_ID ");
		sb.append("INNER JOIN sys_role r ON  r.id=rp.ROLE_ID ");
		sb.append("INNER JOIN sys_user_role  ur ON ur.ROLE_ID =rp.ROLE_ID ");
		sb.append("INNER JOIN sys_user u ON u.id = ur.USER_ID ");
		sb.append("where u.id=? and p.resource_type = ? order by p.sort");
		List<Map<String, Object>> permList = jdbc.queryForList(sb.toString(),new Object[]{userId,resourceType});
		return SysResource.toObject(permList);
	}
	
	/**
	 * 查询所有的菜单
	 * @param userId
	 * @return 菜单集合
	 */
	@SuppressWarnings("unchecked")
	public List<SysResource> findMenus(){
		StringBuffer sb=new StringBuffer();
		sb.append("select p.ID id,p.parentId pid,p.NAME name,p.HREF url,p.SORT sort,p.DESCRIPTION description from SysResource p ");
		sb.append("where p.TYPE='0' order by p.sort");
		List<Map<String, Object>> permList = jdbc.queryForList(sb.toString());
		return SysResource.toObject(permList);
	}
	
	
	/**
	 * 查询用户拥有的菜单权限
	 * @param userId
	 * @return 结果集合
	 */
	@SuppressWarnings("unchecked")
	public List<SysResource> findMenus(Integer userId){
		StringBuffer sb=new StringBuffer();
		sb.append("select p.ID id,p.PID pid,p.NAME name,p.URL url,p.ICON icon,p.SORT sort,p.DESCRIPTION description from resource p ");
		sb.append("INNER JOIN role_permission rp on p.ID=rp.PERMISSION_ID ");
		sb.append("INNER JOIN role r ON r.id=rp.ROLE_ID ");
		sb.append("INNER JOIN user_role ur ON ur.ROLE_ID =rp.ROLE_ID ");
		sb.append("INNER JOIN user u ON u.id = ur.USER_ID ");
		sb.append("where p.TYPE='0' and u.id=? order by p.sort");
		List<Map<String, Object>> permList = jdbc.queryForList(sb.toString(),new Object[]{userId});
		return SysResource.toObject(permList);
	}
	
	/**
	 * 查询菜单下的操作权限
	 * @param userId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<SysResource> findMenuOperation(Integer pid){
		StringBuffer sb=new StringBuffer();
		sb.append("select p.ID id,p.NAME name,p.URL url,p.PERM_CODE permCode,p.DESCRIPTION description from resource p ");
		sb.append("where p.TYPE='O' and p.PID=?0 order by p.SORT");
		List<Map<String, Object>> permList = jdbc.queryForList(sb.toString());
		return SysResource.toObject(permList);
	}
	
	/**
	 * 查询按钮
	 * @param id
	 * @return 用户对象
	 */
	public List<SysResource> getOperateButtons(Integer userId,String reportId){
		List<SysResource> buttonList = findButtons(userId,"1");
		String loginName = UserUtil.getCurrentUser().getLoginName();
		List<SysResource> realList = new ArrayList<SysResource>();
		ApprovalReport ar = approvalReportService.getApprovalReport(reportId);
		ProInstance pi = processInstanceService.getProInstanceByReportId(reportId); 
		boolean flag = approvalReportService.isInner();
		//内网
		if(flag){
			if(pi.getStatus().equals(ResultConstant.PROCESS_STATUS_QD)){
				boolean firstStep =  proStepService.isFirstStep(pi.getProcessId(), pi.getCurrentstep());				
				boolean lastStep =  proStepService.isLastStep(pi.getProcessId(), pi.getCurrentstep());	
				boolean withdrawflag = withdrawFlag(reportId,pi);
				if(pi.getCurrentuser().equals(loginName)){
					if(firstStep){
						for(SysResource button:buttonList){
							if(button.getName().trim().equals("保存")||button.getName().trim().equals("提交")||	
									button.getName().trim().equals("转派")||	button.getName().trim().equals("终止")||
									button.getName().trim().equals("撤销流程")){
								realList.add(button);	
							}
						}
				}else if(lastStep){
					for(SysResource button:buttonList){
						if(button.getName().trim().equals("保存")||	button.getName().trim().equals("转派")||
								button.getName().trim().equals("办结通过")||	button.getName().trim().equals("办结不通过")||
								button.getName().trim().equals("内部退回")){
							realList.add(button);	
						}					
					}
				}else{
					for(SysResource button:buttonList){
						if(button.getName().trim().equals("保存")||button.getName().trim().equals("提交")||	
								button.getName().trim().equals("转派")||	button.getName().trim().equals("内部退回")){
							realList.add(button);	
						}			
					}
				}
			}else{
				if(withdrawflag){
					for(SysResource button:buttonList){
					if(button.getName().trim().equals("内部撤回")){
						realList.add(button);		
						}	
					}
				}		
			}
		}else if(pi.getStatus().equals(ResultConstant.PROCESS_STATUS_JS)&&pi.getCurrentuser().equals(loginName)){
			for(SysResource button:buttonList){
				if(!ar.getIsfinish().equals(StatuConstant.FINISHSTATU_YBJ) && ar.getFinishResult().equals(ResultConstant.FINISH_RESULT_TY)){
					if(button.getName().trim().equals("办结")){
						realList.add(button);		
					}
				}
		    }
		}
		}else{
			if(pi.getStatus().equals(ResultConstant.PROCESS_STATUS_QD)){
				boolean firstStep =  proStepService.isFirstStep(pi.getProcessId(), pi.getCurrentstep());				
				boolean lastStep =  proStepService.isLastStep(pi.getProcessId(), pi.getCurrentstep());	
				boolean withdrawflag = withdrawFlag(reportId,pi);
				if(pi.getCurrentuser().equals(loginName)){ 
					if(firstStep){
						for(SysResource button:buttonList){
							if(button.getName().trim().equals("终止")){
								realList.add(button);	
							}
							if(ar.getAcceptResult()!=null && ar.getAcceptResult().trim().equals(ResultConstant.ACCEPT_RESULT_BZ)){
								if(button.getName().trim().equals("补正")){
									realList.add(button);		
								}
							}
							if(!ar.getStatuBank().equals(StatuConstant.REPORTSTATU_DBZ)){
								if(button.getName().trim().equals("保存")||button.getName().trim().equals("提交")||	
										button.getName().trim().equals("转派")||
										button.getName().trim().equals("撤销流程")){
									realList.add(button);	
								}								
							}
						}
				}else if(lastStep){
					for(SysResource button:buttonList){
						if(ar.getAcceptResult()!=null && ar.getAcceptResult().equals(ResultConstant.ACCEPT_RESULT_BZ)){
							if(button.getName().trim().equals("补正")&&!button.getRemarks().trim().equals("correctLaderBtn")){
								realList.add(button);		
							}
						}else{
							if(button.getName().trim().equals("补正")&&button.getRemarks().trim().equals("correctLaderBtn")){
								realList.add(button);	
							}
						}
						if(button.getName().trim().equals("保存")||button.getName().trim().equals("受理")||	
						   button.getName().trim().equals("转派")||button.getName().trim().equals("内部退回")){
							realList.add(button);	
						}					
					}
				}else{
					for(SysResource button:buttonList){
						if(ar.getAcceptResult()!=null && ar.getAcceptResult().equals(ResultConstant.ACCEPT_RESULT_BZ)){
							if(button.getName().trim().equals("补正")&&!button.getRemarks().trim().equals("correctLaderBtn")){
								realList.add(button);		
							}
						}
						if(button.getName().trim().equals("保存")||button.getName().trim().equals("提交")||	
								button.getName().trim().equals("转派")||	button.getName().trim().equals("内部退回")){
							realList.add(button);	
						}if(withdrawflag){
							if(button.getName().trim().equals("内部撤回")){
								realList.add(button);		
							}	
						}					
					}
				}
		    }else{
				if(withdrawflag){
					for(SysResource button:buttonList){
					if(button.getName().trim().equals("内部撤回")){
						realList.add(button);		
						}	
					}
				}		
		    }
		 }else if(pi.getStatus().equals(ResultConstant.PROCESS_STATUS_JS)&&pi.getCurrentuser().equals(loginName)){
			for(SysResource button:buttonList){
				if(button.getName().trim().equals("终止")){
					realList.add(button);	
				}
				if(ar.getAcceptResult()!=null && ar.getAcceptResult().equals(ResultConstant.ACCEPT_RESULT_SL)&&ar.getIsfinish().trim().equals(StatuConstant.FINISHSTATU_WBJ)){
					if(button.getName().trim().equals("导出")){
						realList.add(button);		
					}
				}
				if(ar.getStatuBank().trim().equals(StatuConstant.REPORTSTATU_SPZ)){
					if(button.getName().trim().equals("办结")){
						realList.add(button);		
					}
				}
		    }
		}else if(pi.getStatus().equals(ResultConstant.PROCESS_STATUS_ZT)&&pi.getCurrentuser().equals(loginName)){
			for(SysResource button:buttonList){
				if(button.getName().trim().equals("终止")||button.getName().trim().equals("转派")){
					realList.add(button);		
				}
		    }
		}
	}
		return realList;
  }
	
//判断是否可以内部撤回
	public boolean withdrawFlag(String reportId,ProInstance pi){
		boolean flag = false;
		if(pi.getStatus().equals(ResultConstant.PROCESS_STATUS_QD)){
			BusinessLog blog = businessLogService.getLastOperatorLog(reportId);
			if(blog!=null){
				if(blog.getStepId()!=null && blog.getOperatorBy()!=null){
					if(pi.getCurrentstep()>blog.getStepId() && blog.getOperatorBy().equals(UserUtil.getCurrentUser().getLoginName())){
						flag = true;
					}
				}
			}
		}
		return flag;
	}
	
	/**
	 * 查询监测分析科按钮
	 * @param id
	 * @return 用户对象
	 */
	public List<SysResource> getSpecialJianGuanOperateButtons(Integer userId,String reportId){
		List<SysResource> buttonList = findButtons(userId,"2");
		String loginName = UserUtil.getCurrentUser().getLoginName();
		List<SysResource> realList = new ArrayList<SysResource>();
		ApprovalReport ar = approvalReportService.getApprovalReport(reportId);
		ProInstance pi = processInstanceService.getProInstanceByReportId(reportId); 
		boolean flag = approvalReportService.isInner();
		//内网
		if(flag){
			if(pi!=null && pi.getStatus().equals(ResultConstant.PROCESS_STATUS_QD)){
				boolean firstStep =  proStepService.isFirstStep(pi.getProcessId(), pi.getCurrentstep());				
				boolean lastStep =  proStepService.isLastStep(pi.getProcessId(), pi.getCurrentstep());	
				boolean withdrawflag = withdrawFlag(reportId,pi);
				if(pi.getCurrentuser().equals(loginName)){
					if(firstStep){
						for(SysResource button:buttonList){
							if(button.getName().trim().equals("保存")||button.getName().trim().equals("提交")||	
									button.getName().trim().equals("转派")||	button.getName().trim().equals("终止")||
									button.getName().trim().equals("撤销流程")){
								realList.add(button);	
							}
						}
				}else if(lastStep){
					for(SysResource button:buttonList){
						if(button.getName().trim().equals("保存")||	button.getName().trim().equals("转派")||
								button.getName().trim().equals("办结通过")||	button.getName().trim().equals("内部退回")){
							realList.add(button);	
						}					
					}
				}else{
					for(SysResource button:buttonList){
						if(button.getName().trim().equals("保存")||button.getName().trim().equals("提交")||	
								button.getName().trim().equals("转派")||	button.getName().trim().equals("内部退回")){
							realList.add(button);	
						}			
					}
				}
			}else{
				if(withdrawflag){
					for(SysResource button:buttonList){
					if(button.getName().trim().equals("内部撤回")){
						realList.add(button);		
						}	
					}
				}		
			}
		}
		}
		return realList;
  }
}
