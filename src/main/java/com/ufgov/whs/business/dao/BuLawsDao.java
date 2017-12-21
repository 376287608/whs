package com.ufgov.whs.business.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;

import com.ufgov.whs.business.bean.BuGuides;
import com.ufgov.whs.business.bean.BuLaws;
import com.ufgov.whs.guide.bean.Guides;


/**
 * 业务法律法规DAO
 * @author xlli
 * @date 2017-10-13 
 */

public interface BuLawsDao extends PagingAndSortingRepository<BuLaws, Serializable>, JpaSpecificationExecutor<BuLaws>, Repository<BuLaws, Serializable> {

	@Query("Select g from BuLaws g where g.businessId = ?1")
	List<BuLaws> getBuLawsByBusinessId(int id);
	
	/**
	 * 根据法律法规id删除关联关系
	 * @param lawId
	 * @return
	 * @throws Exception
	 */
	@Modifying
	@Query(value="delete from bu_laws where law_id = ?1",nativeQuery=true)
	int deleteByLawId(int lawId) throws Exception;
	
}
