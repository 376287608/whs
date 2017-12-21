package com.ufgov.whs.workcalendar.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springside.modules.persistence.DynamicSpecifications;
import org.springside.modules.persistence.SearchFilter;

import com.ufgov.whs.workcalendar.bean.HasSpecialCase;
import com.ufgov.whs.workcalendar.dao.HasSpecialCaseDao;
import com.ufgov.whs.workcalendar.service.IHasSpecialCaseService;

@Service
public class HasSpecialCaseService implements IHasSpecialCaseService {

	@Autowired
	private HasSpecialCaseDao hasSpecialCaseDao;

	@Override
	public HasSpecialCase getHasSpecialCaseById(String id) throws Exception {
		return hasSpecialCaseDao.findOne(id);
	}

	@Override
	public HasSpecialCase saveHasSpecialCase(HasSpecialCase hasSpecialCase)
			throws Exception {
		return hasSpecialCaseDao.save(hasSpecialCase);
	}

	@Override
	public Page<HasSpecialCase> getHasSpecialCase(
			Map<String, Object> searchParams, PageRequest pageRequest)
			throws Exception {
		Specification<HasSpecialCase> spec = buildSpecification(searchParams);
		return hasSpecialCaseDao.findAll(spec, pageRequest);
	}

	@Override
	public List<HasSpecialCase> getHasSpecialCase(
			Map<String, Object> searchParams) throws Exception {
		Specification<HasSpecialCase> spec = buildSpecification(searchParams);
		return hasSpecialCaseDao.findAll(spec);
	}

	public Specification<HasSpecialCase> buildSpecification(
			Map<String, Object> searchParams) {
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		Specification<HasSpecialCase> spec = DynamicSpecifications.bySearchFilter(
				filters.values(), HasSpecialCase.class);
		return spec;
	}

}
