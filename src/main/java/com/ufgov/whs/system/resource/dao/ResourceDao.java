package com.ufgov.whs.system.resource.dao;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;

import com.ufgov.whs.system.resource.bean.SysResource;




/**
 * 权限DAO
 * @author fucj
 * @date 2017年9月18日
 */
public interface ResourceDao extends PagingAndSortingRepository<SysResource, Serializable>, JpaSpecificationExecutor<SysResource>, Repository<SysResource, Serializable>{
	
}
