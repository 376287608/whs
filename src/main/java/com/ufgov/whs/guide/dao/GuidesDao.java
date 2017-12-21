package com.ufgov.whs.guide.dao;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;
import org.springframework.data.repository.query.Param;

import com.ufgov.whs.guide.bean.Guides;


/**
 * 办事指南DAO
 * @author xlli
 * @date 2017-10-13 
 */

public interface GuidesDao extends PagingAndSortingRepository<Guides, Serializable>, JpaSpecificationExecutor<Guides>, Repository<Guides, Serializable> {

	@Query("Select g from Guides g where g.id = ?1 and g.delFlag = 1 and is_public = '1'")
	Guides getGuidesById(int id);
	
	/**
	 * 批量删除
	 * @param ids
	 * @param userName
	 * @param update
	 * @return
	 * @throws Exception
	 */
	@Modifying
	@Query(value="update guides set del_flag='0',update_by=:userName,update_date=:update where id in (:ids)",nativeQuery=true)
	int deleteGuidesByIds(@Param(value = "ids") Integer[] ids,@Param(value = "userName") String userName,
			@Param(value = "update") String update) throws Exception;
	
	/**
	 * 批量发布/取消发布
	 * @param ids
	 * @param isPublish
	 * @param userName
	 * @param update
	 * @return
	 * @throws Exception
	 */
	@Modifying
	@Query(value="update guides set is_public=:isPublish,update_by=:userName,update_date=:update where id in (:ids)",nativeQuery=true)
	int publishGuidesByIds(@Param(value = "ids") Integer[] ids,@Param(value = "isPublish") String isPublish,
			@Param(value = "userName") String userName,@Param(value = "update") String update) throws Exception;
}
