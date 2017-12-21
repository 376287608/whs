package com.ufgov.whs.process.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.jdbc.core.JdbcTemplate;

import com.ufgov.whs.approval.service.ApprovalReportService;
import com.ufgov.whs.attachment.bean.DocAddrInfo;
import com.ufgov.whs.attachment.service.IDocAddrInfoService;
import com.ufgov.whs.business.bean.BuBusiness;
import com.ufgov.whs.common.pagination.impl.IPaginationImpl;
import com.ufgov.whs.process.dao.ProcessDao;
import com.ufgov.whs.system.bankuser.dao.BankUserDao;
import com.ufgov.whs.system.user.bean.SysUser;
import com.ufgov.whs.system.user.bean.SysUserRole;
import com.ufgov.whs.system.user.service.UserRoleService;
import com.ufgov.whs.process.bean.Process;
/**
 * 流程service
 * @author fucj
 * @date 2015年1月13日
 */
@Service
@Transactional(readOnly=true)
public class ProcessService{
	
	@Autowired
	private ProcessDao processDao;
	
	@Autowired
	private BankUserDao bankUserDao;
	
	@Autowired
	private IDocAddrInfoService docAddrInfoService ;
	
	@Autowired
	private UserRoleService userRoleService ;
	
	
	@Autowired
	private IPaginationImpl ipaginationservice;
	
	@Autowired
    JdbcTemplate jdbc;

	/**
	 * 查找业务设置的流程
	 * @param businessId
	 * @return
	 */
	public List<Process> getProcessByBusinessId(Integer businessId,Integer orgId) {
		return processDao.getProcessByBusinessId(businessId,orgId);
	}
	
	/**
	 * 通过id查询流程
	 * @param processId
	 * @return
	 */
	public Process getProcessById(Integer processId){
		return processDao.getProcessById(processId);
	}
	
	/**
	 * 创建分页请求
	 * @param pageNumber 当前页码
	 * @param pagzSize 显示条数
	 * @param sortType 排序类型
	 * @param sortField 排序字段
	 * @return
	 */
	public PageRequest buildPageRequest(int pageNumber, int pagzSize,
	           String sortType,String sortField) {
	       Sort sort = null;
	       List<String> orders=new ArrayList<String>();
	       orders.add(sortField);
	       if ("desc".equalsIgnoreCase(sortType)) {
	       		sort = new Sort(Direction.DESC, orders);
	       }else{
	   		sort = new Sort(Direction.ASC, orders);
	       }
	       return new PageRequest(pageNumber - 1, pagzSize, sort);
	 }
	
	/**
	 * 获取分页数据 包括记录和条数
	 * @param pageRequest
	 * @param clazz
	 * @param user
	 * @return
	 * @throws Exception
	 */
	public PageImpl getFindAll(PageRequest pageRequest,Class clazz,SysUser user ) throws Exception {
		// TODO Auto-generated method stub
		if(user == null){
			return null ;
		}
		StringBuilder sql = new StringBuilder();
		sql.append("select p.* from ");
		sql.append(" process p,sys_dept_role sdr,sys_user_role sur ");
		sql.append(" where p.del_flag = '1' ");
		sql.append(" and p.org_id = sdr.dept_id ");
		sql.append(" and sdr.role_id = sur.role_id ");
		sql.append(" and sur.user_id = "+user.getId());
	    return ipaginationservice.getPageImpl(sql.toString(), pageRequest, clazz);
	}
	
	/**
	 * 添加或更新流程
	 * @param process
	 * @param user
	 * @param flag
	 * @return
	 */
	@Transactional(readOnly = false)
	public boolean save(Process process,SysUser user,String flag) {
		//参数不为空
		if(process != null && !StringUtils.isBlank(flag)){
			// 1 添加 2 更新
			if(flag.equals("1")){
				process.setId(null);
				process.setDelFlag("1");
				process.setOrgId(processDao.getDeptIdByUserId(user.getId()));
				//内网是审批流程  外网是受理流程（预审批）
				if(isInner()){
					//审批流程
					process.setProcessType("2");
				}else{
					//受理流程
					process.setProcessType("1");
				}
				process.setCreateBy(bankUserDao.findByUserId(user.getId()).getName());
				process.setCreateDate(new Timestamp(System.currentTimeMillis()));
				process.setUpdateBy(bankUserDao.findByUserId(user.getId()).getName());
				process.setUpdateDate(new Timestamp(System.currentTimeMillis()));
			}else if(flag.equals("2")){
				process.setUpdateBy(bankUserDao.findByUserId(user.getId()).getName());
				process.setUpdateDate(new Timestamp(System.currentTimeMillis()));
			}
			processDao.save(process);
			return true ;
		}
		return false;
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
	 * 判断该角色是否有流程管理相关权限
	 * @param roleId
	 * @return
	 */
	@SuppressWarnings("finally")
	public boolean processPermission(Integer roleId){
		boolean flag = false ;
		if(roleId == null) return flag ;
		try {
			//查出所有拥有流程管理的角色
			List<DocAddrInfo> docAddrInfos = docAddrInfoService.getByWebAddr("ROLEPROCESS");
			//查看此角色是否拥有此权限
			for(DocAddrInfo dai : docAddrInfos){
				if(dai.getRealAddr().equals(String.valueOf(roleId))){
					flag = true ;
					break ;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			return flag ;
		}
	}
	
	/**
	 * 查看用户是否有流程管理权限
	 * @param user
	 * @return
	 */
	public boolean userProcessPermission(Integer userId){
		//查找当前用户角色
		List<SysUserRole> userRoles = userRoleService.getRoleByUserId(userId);
		//权限标识
		boolean permissionFlag = false ;
		//判断权限
		for(SysUserRole userRole : userRoles){
			if(processPermission(userRole.getRoleId())){
				permissionFlag = true ;
				break ;
			}
		}
		return permissionFlag ;
	}

	/**
	 * 将所有已经绑定业务的末级业务标记
	 * @param businessList 已经和流程绑定的业务
	 * @param endBusinessList 所有的末级业务
	 * @return
	 */
	@SuppressWarnings("finally")
	public boolean checkedBusiness(List<BuBusiness> businessList,
			List<BuBusiness> endBusinessList) {
		boolean flag = false ;
		if(businessList == null || endBusinessList == null){
			return flag ;
		}
		try {
			for(BuBusiness endBusiness : endBusinessList){
				for(BuBusiness business : businessList){
					if(endBusiness.getId().equals(business.getId())){
						endBusiness.setChecked("true");
						break ;
					}
				}
			}
			flag = true ;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			return flag;
		}
	}
	
	/**
	 * 查看流程是否绑定了业务
	 * @param processId
	 * @return
	 */
	public Process getProcessByIdAndBusiness(Integer processId){
		if(processId == null) return null ;
		return processDao.getProcessByIdAndBusiness(processId);
	}

	/**
	 * 根据流程序号数组获取已绑定业务的流程
	 * @param ids
	 * @return
	 */
	public List<Process> getProcessListByIdAndBusiness(Integer[] ids) {
		if(ids == null) return null ;
		List<Process> processList = new ArrayList<Process>();
		Process process = null ;
		for(Integer processId : ids){
			process = getProcessByIdAndBusiness(processId);
			if(process != null){
				processList.add(process);
			}
		}
		return processList;
	}
	
	/**
	 * 根据序号数组删除流程
	 * @param ids
	 * @param userName
	 * @param update
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("finally")
	@Transactional(readOnly=false)
	public boolean deleteProcessByIds(Integer[] ids,SysUser user,String update) throws Exception{
		boolean flag = false ;
		if(ids == null) return flag ;
		try {
			processDao.deleteProcessByIds(ids, bankUserDao.findByUserId(user.getId()).getName(), update);
			flag = true ;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			return flag ;
		}
	}
	
	/**
	 * 把字符串变声数字数组 字符串格式需要是 数字和,组成 比如 1,2,3或者纯数字等
	 * @param str
	 * @return
	 */
	public Integer[] strToIntegerArray(String str){
		if(StringUtils.isBlank(str)){
			return null ;
		}
		//1,2,3 格式的
		if(str.matches("([0-9]+,)+[0-9]+")){
			String[] strArray = str.split(",");
			Integer[] intArray = new Integer[strArray.length];
			for(int i=0;i<strArray.length;i++){
				intArray[i] = Integer.valueOf(strArray[i]);
			}
			return intArray ;
		}else if(str.matches("[0-9]+")){//一个数字
			Integer[] intArray = new Integer[]{Integer.valueOf(str)};
			return intArray ;
		}
		
		return null ;
	}

}
