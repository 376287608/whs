package com.ufgov.whs.business.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;

import com.ufgov.whs.business.bean.BuAttachmentType;
import com.ufgov.whs.business.bean.BuGuides;


/**
 * 业务类型附件DAO
 * @author xlli
 * @date 2017-10-13 
 */

public interface BuAttachmentTypeDao extends PagingAndSortingRepository<BuAttachmentType, Serializable>, JpaSpecificationExecutor<BuAttachmentType>, Repository<BuAttachmentType, Serializable> {

	@Query("select t from BuAttachmentType t where t.delFlag = '1' and t.businessId = ?1 ")
	List<BuAttachmentType> getBuAttachmentTypeByBusinessId(int id);	
	
	@Query("select filetypeIndex from BuAttachmentType t where t.id = ?1 ")
	Integer getFileTypeIndexById(Integer id);

	
}
