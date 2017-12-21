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

import com.ufgov.whs.workcalendar.bean.HasWorkCalendar;
import com.ufgov.whs.workcalendar.dao.HasWorkCalendarDao;
import com.ufgov.whs.workcalendar.service.IHasWorkCalendarService;

@Service
public class HasWorkCalendarService implements IHasWorkCalendarService {

	@Autowired
	private HasWorkCalendarDao hasWorkCalendarDao;

	@Override
	public HasWorkCalendar getHasWorkCalendarById(String id) throws Exception {
		return hasWorkCalendarDao.findOne(id);
	}

	@Override
	public HasWorkCalendar saveHasWorkCalendar(HasWorkCalendar hasWorkCalendar)
			throws Exception {
		return hasWorkCalendarDao.save(hasWorkCalendar);
	}

	@Override
	public Page<HasWorkCalendar> getHasWorkCalendar(
			Map<String, Object> searchParams, PageRequest pageRequest)
			throws Exception {
		Specification<HasWorkCalendar> spec = buildSpecification(searchParams);
		return hasWorkCalendarDao.findAll(spec, pageRequest);
	}

	@Override
	public List<HasWorkCalendar> getHasWorkCalendar(
			Map<String, Object> searchParams) throws Exception {
		Specification<HasWorkCalendar> spec = buildSpecification(searchParams);
		return hasWorkCalendarDao.findAll(spec);
	}

	public Specification<HasWorkCalendar> buildSpecification(
			Map<String, Object> searchParams) {
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		Specification<HasWorkCalendar> spec = DynamicSpecifications
				.bySearchFilter(filters.values(), HasWorkCalendar.class);
		return spec;
	}
}
