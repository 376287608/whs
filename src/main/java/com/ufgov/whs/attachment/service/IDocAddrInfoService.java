package com.ufgov.whs.attachment.service;

import java.util.List;

import com.ufgov.whs.attachment.bean.DocAddrInfo;
/**
 * 附件存储元数据接口
 */
public interface IDocAddrInfoService {
	/**
	 * 根据id获取对象
	 * @param logicAddr(主键id)
	 * @return DocAddrInfo
	 */
	public DocAddrInfo queryById(String logicAddr);
	
	/**
	 * 根据webAddr获取配置
	 * @param webAddr
	 * @return
	 * @throws Exception 
	 */
	public List<DocAddrInfo> getByWebAddr(String webAddr) throws Exception ;
}
