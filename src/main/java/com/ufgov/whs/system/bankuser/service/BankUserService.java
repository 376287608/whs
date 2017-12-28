package com.ufgov.whs.system.bankuser.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ufgov.whs.system.bankuser.bean.BankUser;
import com.ufgov.whs.system.bankuser.dao.BankUserDao;

/**
 * 银行用户service
 * @author xlli
 * @date 2017-10-12
 */
@Service
@Transactional(readOnly = true)
public class BankUserService{
	
	@Autowired
	private BankUserDao bankUserDao;
	

	/**
	 * 根据审批单查找历史处理人
	 * @param reportId
	 * @return
	 * @throws Exception
	 */
	public List<BankUser> getHistoryUserByReportId(String reportId) throws Exception{
		if(StringUtils.isBlank(reportId)){
			return null ;
		}
		return bankUserDao.getHistoryUserByReportId(reportId);
		
	}
}

