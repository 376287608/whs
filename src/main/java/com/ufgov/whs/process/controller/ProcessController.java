package com.ufgov.whs.process.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ufgov.whs.business.bean.BuBusiness;
import com.ufgov.whs.business.service.BuBusinessService;
import com.ufgov.whs.business.service.BuProcessService;
import com.ufgov.whs.common.utils.DateUtils;
import com.ufgov.whs.process.service.ProStepService;
import com.ufgov.whs.process.service.ProcessInstanceService;
import com.ufgov.whs.process.service.ProcessService;
import com.ufgov.whs.system.user.bean.SysUser;
import com.ufgov.whs.system.user.service.UserRoleService;
import com.ufgov.whs.system.utils.SysConstant;
import com.ufgov.whs.process.bean.ProStep;
import com.ufgov.whs.process.bean.Process;

/**
 * 业务流程controller
 * @author xlli
 * @date 2015年1月14日
 */
@Controller
@RequestMapping(value = "/process")
public class ProcessController{
	
	protected final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private ProcessService processService ;
	
	@Autowired
	private ProStepService proStepService ;
	
	@Autowired
	private BuProcessService buProcessService ;
	
	@Autowired
	private UserRoleService userRoleService ;
	
	@Autowired
	private BuBusinessService buBusinessService ;
	
	@Autowired
	private ProcessInstanceService processInstanceService ;
	/**
	 * 添加或更新业务流程
	 * @param process
	 * @param processId
	 * @param processName
	 * @param verifyLevel
	 * @param remarks
	 * @param proStepList 业务环节JSON
	 * @param flag 1 添加 2 更新
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value="/addOrUpdateProcess",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> addOrUpdateProcess(Process process,Integer processId,String processName,
			Integer verifyLevel,String remarks,String proStepList,String flag ) throws Exception{
		//test
//		proStepList = "[{\"stepName\":\"sss\",\"stepOrder\":\"1\",\"approvalRoleId\":\"1\",\"approvalRoleName\":\"xlli\"}]";
		
		Map<String,Object> info = new HashMap<String, Object>();
		info.put("msg", "添加或更新失败");
		info.put("success", "false");
		//校验
		if(StringUtils.isBlank(processName) || verifyLevel == null || StringUtils.isBlank(remarks) || 
				StringUtils.isBlank(proStepList) || StringUtils.isBlank(flag)){
			return info;
		}
		try {
			//当前用户
			SysUser user = (SysUser)SecurityUtils.getSubject().getSession().getAttribute("user");
			//查找当前用户是否拥有流程管理权限
			if(user == null || !processService.userProcessPermission(user.getId())){
				info.put("msg", "此用户没有权限");
				return info;
			}
			//flag必须是1或者2
			if(!flag.matches("[12]{1}") || user == null){
				info.put("msg", "设置失败");
				return info ;
			}
		    //成功标识
		    boolean bl = false ;
		    //更新操作
		    if(flag.equals("2")){
		    	//id 业务状态不能为空 
		    	if(processId == null) {
		    		return info;
		    	}
		    	process = processService.getProcessById(processId);
		    	//无此数据
		    	if(process == null){
		    		info.put("msg", "没有此数据");
		    		return info;
		    	}else if(processInstanceService.isStartByProcessId(processId)){//如果此流程正在被使用 则不可以更新
		    		info.put("msg", "此流程实例已启动，请流程结束后再更新");
		    		return info;
		    	}else{
		    		process.setProcessName(processName);
		    		process.setVerifyLevel(verifyLevel);
		    		process.setRemarks(remarks);
		    	}
		    }
		    //添加或更新流程
		    bl = processService.save(process,user,flag);
		    //流程保存成功 则保存流程相关审核环节
		    if(bl){
		    	ObjectMapper objectMapper = new ObjectMapper(); 
				JavaType javaType = objectMapper.getTypeFactory().constructParametricType(List.class, ProStep.class);
				//把json字符串数组转换成List
			    List<ProStep> proSteps = objectMapper.readValue(proStepList, javaType); 
			    bl = proStepService.save(proSteps,process.getId(),user);
		    }
		    //流程步骤保存成功 则更新返回信息
		    if(bl){
		    	info.put("processId", process.getId());
		    	info.put("msg", "添加或更新成功");
				info.put("success", "true");
		    }
		}catch(Exception e){
			logger.error("添加或更新"+process.getId()+"失败！"+e.getMessage(), e);
			throw new Exception("添加或更新"+process.getId()+"失败！"+e.getMessage(),e);
		}finally{
			return info ;
		}
	}
	
	/**
	 * 批量删除流程
	 * @param ids 流程序号数组
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value="/deleteProcessByIds",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> deleteProcessByIds(String ids) throws Exception{
		Map<String,Object> info = new HashMap<String, Object>();
		info.put("msg", "删除失败");
		info.put("success", "false");
		try {
			if(StringUtils.isBlank(ids)){
				info.put("msg", "流程序号不能为空");
				return info ;
			}
			//当前用户
			SysUser user = (SysUser)SecurityUtils.getSubject().getSession().getAttribute("user");
			//查找当前用户是否拥有流程管理权限
			if(user == null || !processService.userProcessPermission(user.getId())){
				info.put("msg", "此用户没有权限");
				return info;
			}
			Integer[] intIds = processService.strToIntegerArray(ids);
			//查看流程是否绑定了业务，如果已经绑定则不允许删除
			List<Process> processList = processService.getProcessListByIdAndBusiness(intIds) ;
			if(processList != null && processList.size()>0){
				info.put("errorProcess", processList);
				info.put("msg", "删除失败，删除流程前需要解绑相关业务");
				return info;
			}
			//删除流程
			if(processService.deleteProcessByIds(intIds, user, DateUtils.getDateTime())){
				info.put("msg", "删除完成");
				info.put("success", "true");
			}
		}catch(Exception e){
			logger.error("删除失败！"+e.getMessage(), e);
			throw new Exception("删除失败！"+e.getMessage(),e);
		}finally{
			return info ;
		}
	}
	
	/**
	 * 流程管理列表
	 * @param request
	 * @param pageNumber
	 * @param pageSize
	 * @param businessId
	 * @param guidesName
	 * @param queryDate
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "unchecked", "finally" })
	@RequestMapping(value="/getProcessList",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> getProcessList(Integer pageNumber,Integer pageSize) throws Exception{
		Map<String,Object> info = new HashMap<String, Object>();
		info.put("msg", "查询失败");
		info.put("success", "false");
		//校验参数
		if(null == pageNumber || null == pageSize){
			return info ;
		}
		//当前用户
		SysUser user = (SysUser)SecurityUtils.getSubject().getSession().getAttribute("user");
		if(user == null){
			return info ;
		}
		//权限设置 只有银行人员才可以查看列表
		if(!user.getUserType().equals(SysConstant.BANK_USER_W)){
			info.put("msg", "只有银行用户才可查看此列表");
			return info ;
		}
		try {
			PageRequest pageRequest = processService.buildPageRequest(pageNumber, pageSize,"desc","update_date");
			//分页对象
			Page<Process> page = processService.getFindAll(pageRequest,Process.class,user);
			info.put("rows", page.getContent());
			info.put("count", page.getTotalElements());
			info.put("msg", "查询成功");
			info.put("success", "true");
		}catch(Exception e){
			logger.error("查询失败！"+e.getMessage(), e);
			throw new Exception("查询失败！"+e.getMessage(),e);
		}finally{
			return info ;
		}
	}
	
	/**
	 * 查看流程详情
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value="/getProcessInfo",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> getProcessInfo(Integer id) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("msg", "查询失败");
		map.put("success", "false");
		//校验
		if(null == id){
			return map ;
		}
		try{
			Process process = processService.getProcessById(id);
			List<ProStep> proSteps = null ;
			if(process == null){
				map.put("msg", "无此流程");
				return map;
			}else{
				//根据流程id查找相关步骤
				proSteps = proStepService.getStepByProcessId(id);
			}
			map.put("item", process);
			map.put("proSteps", proSteps);
			map.put("msg", "查询成功");
			map.put("success", "true");
		}catch(Exception e){
			logger.error("查询失败！"+e.getMessage(), e);
			throw new Exception("查询失败！"+e.getMessage(),e);
		}finally{
			return map ;
		}
	}
	
	/**
	 * 获取流程和业务的关联关系
	 * @param id 流程id
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value="/getProcessAndBusiness",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> getProcessAndBusiness(Integer id,Integer pageNumber,Integer pageSize) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("msg", "查询失败");
		map.put("success", "false");
		//校验
		if(null == id || pageNumber == null || pageSize == null){
			return map ;
		}
		try{
			//当前用户
			SysUser user = (SysUser)SecurityUtils.getSubject().getSession().getAttribute("user");
			//只有银行用户才可以查看
			if(user == null || !user.getUserType().equals("1")){
				map.put("msg", "此用户没有权限");
				return map;
			}
			Process process = processService.getProcessById(id);
			List<BuBusiness> businessList = null ;
			if(process == null){
				map.put("msg", "无此流程");
				return map;
			}else{
				//根据流程查找相关业务
				businessList = buBusinessService.getByProcessId(id);
			}
			//根据分页参数获取末级业务
			List<BuBusiness> endBusinessList = buBusinessService.getEndNodeBusiness(pageNumber,pageSize,user.getId());
			//获取所有的末级业务
			List<BuBusiness> allEndBusinessList = buBusinessService.getAllEndNodeBusiness();
			//如果此业务已经和流程绑定 则需要标记下
			if(processService.checkedBusiness(businessList,endBusinessList)){
				map.put("item", process);
				map.put("allEndBusiness", endBusinessList);
				map.put("count", allEndBusinessList.size());
				//已绑定业务数量
				map.put("businessCount", businessList.size());
				map.put("msg", "查询成功");
				map.put("success", "true");
			}
		}catch(Exception e){
			logger.error("查询失败！"+e.getMessage(), e);
			throw new Exception("查询失败！"+e.getMessage(),e);
		}finally{
			return map ;
		}
	}
	
	/**
	 * 设置流程和业务的关联关系
	 * @param id
	 * @param businessIds 1,2,3 这样格式的字符串
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value="/setProcessAndBusiness",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> setProcessAndBusiness(Integer id,String businessIds) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("msg", "设置失败");
		map.put("success", "false");
		//校验
		if(null == id){
			return map ;
		}
		try{
			//当前用户
			SysUser user = (SysUser)SecurityUtils.getSubject().getSession().getAttribute("user");
			//查找当前用户是否拥有流程管理权限
			if(user == null || !processService.userProcessPermission(user.getId())){
				map.put("msg", "此用户没有权限");
				return map;
			}
			Process process = processService.getProcessById(id);
			if(process == null){
				map.put("msg", "无此流程");
				return map;
			}else{
				Integer[] businessIdsInt = null ;
				if(!StringUtils.isBlank(businessIds)){
					businessIdsInt = processService.strToIntegerArray(businessIds);
				}
				//根据流程来设置相关业务
				buProcessService.setProcessAndBusiness(id, businessIdsInt, user);
			}
			map.put("msg", "设置成功");
			map.put("success", "true");
		}catch(Exception e){
			logger.error("设置失败！"+e.getMessage(), e);
			throw new Exception("设置失败！"+e.getMessage(),e);
		}finally{
			return map ;
		}
	}
	
}
