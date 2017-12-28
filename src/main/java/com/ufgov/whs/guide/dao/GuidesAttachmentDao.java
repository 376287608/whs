package com.ufgov.whs.guide.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;

import com.ufgov.whs.guide.bean.GuideAttachment;


/**
 * 办事指南附件DAO
 * @author xlli
 * @date 2017-10-13 
 */

public interface GuidesAttachmentDao extends PagingAndSortingRepository<GuideAttachment, Serializable>, JpaSpecificationExecutor<GuideAttachment>, Repository<GuideAttachment, Serializable> {

	@Query(value="select g.* from guide_attachment g,has_doc h where g.doc_id = h.doc_id and g.guide_id = ?1",nativeQuery=true)
	List<GuideAttachment> getAttachmentByGuideId(int id) throws Exception;
	
	/**
	 * 根据办事指南编号删除附件
	 * @param guideId
	 * @return
	 * @throws Exception
	 */
	@Modifying
	@Query(value="delete from guide_attachment where  guide_id =  ?1",nativeQuery=true)
	int deleteAttachmentByGuideId(int guideId) throws Exception;
	
}
