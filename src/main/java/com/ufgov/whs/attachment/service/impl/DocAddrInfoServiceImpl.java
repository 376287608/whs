package com.ufgov.whs.attachment.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ufgov.whs.attachment.bean.DocAddrInfo;
import com.ufgov.whs.attachment.dao.DocAddrInfoDao;
import com.ufgov.whs.attachment.service.IDocAddrInfoService;

/**
 * 附件存储元数据实现类
 */
@Service
public class DocAddrInfoServiceImpl implements IDocAddrInfoService {
	
	@Autowired
	private DocAddrInfoDao dao;

	@Override
	public DocAddrInfo queryById(String logicAddr) {
		return dao.findOne(logicAddr);
	}

	@Override
	public List<DocAddrInfo> getByWebAddr(String webAddr) throws Exception {
		if(StringUtils.isBlank(webAddr)) return null ;
		return dao.getByWebAddr(webAddr);
	}

}
