package com.ufgov.whs.business.dao;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;

import com.ufgov.whs.business.bean.BuProcess;


/**
 * 流程和业务DAO
 * @author xlli
 * @date 2017-10-13 
 */

public interface BuProcessDao extends PagingAndSortingRepository<BuProcess, Serializable>, JpaSpecificationExecutor<BuProcess>, Repository<BuProcess, Serializable> {
	
	/**
	 * 根据流程id删除相关业务
	 * @param processId
	 * @return
	 * @throws Exception
	 */
	@Modifying
	@Query(value="delete from bu_process where process_id = ?1",nativeQuery=true)
	int deleteByProcessId(Integer processId) throws Exception;
	
}
