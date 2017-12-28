package com.ufgov.whs.system.log.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;


import org.springframework.data.repository.Repository;

import com.ufgov.whs.system.log.bean.SysLog;



/**
 * 日志DAO
 * @author fucj
 * @date 2015年1月13日
 */
public interface LogDao extends PagingAndSortingRepository<SysLog, Serializable>, JpaSpecificationExecutor<SysLog>, Repository<SysLog, Serializable>{
}
