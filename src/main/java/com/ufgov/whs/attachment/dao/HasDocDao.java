/**
 * @Title: HasFileItfDao.java
 * @Package com.ufgov.aideapprove.dao
 * @Description: TODO Copyright: Copyright (c) 2011
 * 
 * @author Comsys-johh
 * @date 2015年5月6日 下午6:59:11
 * @version V1.0
 */

package com.ufgov.whs.attachment.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;
import org.springframework.data.repository.query.Param;

import com.ufgov.whs.attachment.bean.HasDoc;

/**
 * 附件元数据DAO
 */
public interface HasDocDao extends PagingAndSortingRepository<HasDoc, Serializable>, JpaSpecificationExecutor<HasDoc>, Repository<HasDoc, Serializable> {

	@Query("from HasDoc where id in (:ids)")
	List<HasDoc> findSomeByIds(@Param(value = "ids") List<String> ids);

}
