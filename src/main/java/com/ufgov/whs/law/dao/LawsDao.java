package com.ufgov.whs.law.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;
import org.springframework.data.repository.query.Param;

import com.ufgov.whs.law.bean.Laws;


/**
 * 法律法规DAO
 * @author fucj
 * @date 2015年1月13日
 */

public interface LawsDao extends PagingAndSortingRepository<Laws, Serializable>, JpaSpecificationExecutor<Laws>, Repository<Laws, Serializable> {

	@Query("Select g from Laws g where g.id = ?1 and g.delFlag = 1 and is_public = '1' ")
	Laws getLawsById(int id);
	
	@Query("Select g from Laws g where g.id = ?1 and g.delFlag = 1 ")
	Laws getLawsPublishById(int id);
	
	/**
	 * 批量删除（逻辑删除）
	 * @param ids
	 * @return
	 * @throws Exception
	 */
	@Modifying
	@Query(value="update laws set del_flag='0',update_by=:userName,update_date=:update where id in (:ids)",nativeQuery=true)
	int deleteLawsByIds(@Param(value = "ids") Integer[] ids,@Param(value = "userName") String userName,
			@Param(value = "update") String update) throws Exception;
	
	/**
	 * 批量发布/取消发布
	 * @param ids
	 * @return
	 * @throws Exception
	 */
	@Modifying
	@Query(value="update laws set is_public=:isPublish,update_by=:userName,update_date=:update where id in (:ids)",nativeQuery=true)
	int publishLawsByIds(@Param(value = "ids") Integer[] ids,@Param(value = "isPublish") String isPublish,
			@Param(value = "userName") String userName,@Param(value = "update") String update) throws Exception;
}
