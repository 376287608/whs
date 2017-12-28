package com.ufgov.whs.attachment.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.persistence.DynamicSpecifications;
import org.springside.modules.persistence.SearchFilter;

import com.ufgov.whs.attachment.bean.HasDoc;
import com.ufgov.whs.attachment.dao.HasDocDao;
import com.ufgov.whs.attachment.service.IHasDocService;

/**
 * 附件元数据实现类
 */
@Service
public class HasDocServiceImpl implements IHasDocService {

	@Autowired
	private HasDocDao docDao;

	@Override
	public HasDoc saveHasDoc(HasDoc doc) {
		return docDao.save(doc);
	}
	
	@Override
	public List<HasDoc> saveBatchHasDoc(List<HasDoc> docList) {
		return (List<HasDoc>) docDao.save(docList);
	}

	@Override
	public List<HasDoc> getDataByMap(Map<String, Object> map) {
		Specification<HasDoc> spec = buildSpecification(map);
		return docDao.findAll(spec);
	}

	@Override
	public HasDoc queryById(String docId) {
		return docDao.findOne(docId);
	}

	@Override
	@Transactional(readOnly = false)
	public void delete(String docId) {
		docDao.delete(docId);
	}

	@Override
	public void delete(HasDoc doc) {
		docDao.delete(doc);
	}
	
	/**
	 * 创建动态查询条件组合.
	 * @param searchParams
	 * @return
	 */
	public Specification<HasDoc> buildSpecification(
			Map<String, Object> searchParams) {
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		Specification<HasDoc> spec = DynamicSpecifications.bySearchFilter(
				filters.values(), HasDoc.class);
		return spec;
	}

}
