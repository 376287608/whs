package com.ufgov.whs.law.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;

import com.ufgov.whs.guide.bean.GuideAttachment;
import com.ufgov.whs.law.bean.LawAttachment;
import com.ufgov.whs.law.bean.Laws;


/**
 * 法律法规附件DAO
 * @author xlli
 * @date 2015年1月13日
 */

public interface LawsAttachmentDao extends PagingAndSortingRepository<LawAttachment, Serializable>, JpaSpecificationExecutor<LawAttachment>, Repository<LawAttachment, Serializable> {

	/**
	 * 根据法律法规序号查找附件
	 * @param lawId
	 * @return
	 * @throws Exception
	 */
	@Query(value="select t.* from law_attachment t ,has_doc h where t.doc_id = h.doc_id and t.law_id = ?1",nativeQuery=true)
	List<LawAttachment> getAttachmentBylawId(int lawId) throws Exception;
	
	/**
	 * 根据法律法规编号删除
	 * @param lawId
	 * @return
	 * @throws Exception
	 */
	@Modifying
	@Query(value="delete from law_attachment where law_id =  ?1",nativeQuery=true)
	int deleteAttachmentByLawId(int lawId) throws Exception;
	
}
