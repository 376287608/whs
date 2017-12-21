package com.ufgov.whs.workcalendar.dao;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;

import com.ufgov.whs.workcalendar.bean.HasWorkCalendar;


public interface HasWorkCalendarDao extends
		PagingAndSortingRepository<HasWorkCalendar, Serializable>,
		JpaSpecificationExecutor<HasWorkCalendar>,
		Repository<HasWorkCalendar, Serializable> {

}
