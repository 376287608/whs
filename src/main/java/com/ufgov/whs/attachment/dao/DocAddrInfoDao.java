package com.ufgov.whs.attachment.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ufgov.whs.attachment.bean.DocAddrInfo;

/**
 * 附件存储元数据DAO
 */
public interface DocAddrInfoDao extends PagingAndSortingRepository<DocAddrInfo, Serializable>, JpaSpecificationExecutor<DocAddrInfo>{

	/**
	 * 查找流程管理相关权限
	 * @param processId
	 * @return
	 * @throws Exception
	 */
	@Query(value="select * from has_addr_info where web_addr = ?1",nativeQuery=true)
	List<DocAddrInfo> getByWebAddr(String webAddr) throws Exception;
	
}
