package com.ufgov.whs.business.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;

import com.ufgov.whs.business.bean.BuGuides;
import com.ufgov.whs.guide.bean.Guides;


/**
 * 业务办事指南DAO
 * @author xlli
 * @date 2017-10-13 
 */

public interface BuGuidesDao extends PagingAndSortingRepository<BuGuides, Serializable>, JpaSpecificationExecutor<BuGuides>, Repository<BuGuides, Serializable> {

	@Query("Select g from BuGuides g where g.businessId = ?1")
	List<BuGuides> getBuGuidesByBusinessId(int id);
	
	/**
	 * 根据办事指南id删除关联关系
	 * @param guideId
	 * @return
	 * @throws Exception
	 */
	@Modifying
	@Query(value="delete from bu_guides where guides_id = ?1",nativeQuery=true)
	int deleteByGuideId(int guideId) throws Exception;
	
}
