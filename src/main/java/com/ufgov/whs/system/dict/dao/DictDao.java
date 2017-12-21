package com.ufgov.whs.system.dict.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;

import com.ufgov.whs.system.dict.bean.SysDict;

/**
 * 字典DAO
 * @author fucj
 * @date 2015年1月13日
 */

public interface DictDao extends PagingAndSortingRepository<SysDict, Serializable>, JpaSpecificationExecutor<SysDict>, Repository<SysDict, Serializable> {
	
	@Query("select s from SysDict s where s.type = ?1")
	 List<SysDict> getSysDictByType(String type);
	
}
