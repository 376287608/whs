package com.ufgov.whs.business.service;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ufgov.whs.business.bean.BuProcess;
import com.ufgov.whs.business.dao.BuProcessDao;
import com.ufgov.whs.system.bankuser.dao.BankUserDao;
import com.ufgov.whs.system.user.bean.SysUser;

/**
 * 流程和业务service
 * @author xlli
 * @date 2017-10-12
 */
@Service
@Transactional(readOnly = true)
public class BuProcessService{
	
	@Autowired
	private BuProcessDao buProcessDao ;
	
	@Autowired
	private BankUserDao bankUserDao;
	
	/**
	 * 设置流程和业务的绑定关系
	 * @param processId
	 * @param businessIds
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("finally")
	@Transactional(readOnly = false)
	public boolean setProcessAndBusiness(Integer processId,Integer[] businessIds,SysUser user) throws Exception{
		boolean flag = false ;
		if(processId == null){
			return flag ;
		}
		try {
			//首先删除之前的绑定关系
			buProcessDao.deleteByProcessId(processId);
			//其次如果businessIds不为空则保存新的关联关系 为空则标识删除全部的关联关系不再保存新的关系
			if(businessIds != null){
				for(Integer businessId : businessIds){
					BuProcess buProcess = new BuProcess();
					buProcess.setProcessId(processId);
					buProcess.setBusinessId(businessId);
					buProcess.setCreateBy(bankUserDao.findByUserId(user.getId()).getName());
					buProcess.setCreateDate(new Timestamp(System.currentTimeMillis()));
					buProcess.setUpdateBy(bankUserDao.findByUserId(user.getId()).getName());
					buProcess.setUpdateDate(new Timestamp(System.currentTimeMillis()));
					buProcessDao.save(buProcess);
				}
			}
			
			flag = true ;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			return flag ;
		}
	}
	
}

