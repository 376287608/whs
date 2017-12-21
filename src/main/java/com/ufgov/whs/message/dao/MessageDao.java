package com.ufgov.whs.message.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;

import com.ufgov.whs.message.bean.Message;


/**
 * 消息通知DAO
 * @author xlli
 * @date 2015年1月13日
 */

public interface MessageDao extends PagingAndSortingRepository<Message, Serializable>, JpaSpecificationExecutor<Message>, Repository<Message, Serializable> {
	@Query("select f from Message f where f.formId = ?1 and f.readFlag = ?2 and f.delFlag = '1'")
	List<Message> getMessageByFormId(String formId,String statu);
	
}
