package com.ufgov.whs.system.log.service;

import java.io.Serializable;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ufgov.whs.system.log.bean.SysLog;
import com.ufgov.whs.system.log.dao.LogDao;


/**
 * 日志service
 * @author fucj
 * @date 2015年1月14日
 */
@Service
@Transactional(readOnly=true)
public class LogService{
	
	@Autowired
	private LogDao logDao;
	
	/**
	 * 批量删除日志
	 * @param idList
	 */
	@Transactional(readOnly=false)
	public void deleteLog(List<Integer> idList){
		for(Integer id : idList){
			logDao.delete(id);
		}

	}
	
	@Transactional(readOnly = false)
	public void save(SysLog log) {
		logDao.save(log);
	}
	
	
}
