package com.ufgov.whs.workcalendar.dao;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;

import com.ufgov.whs.approval.bean.FormAttachment;
import com.ufgov.whs.workcalendar.bean.HasWorkDay;


public interface HasWorkDayDao extends
		PagingAndSortingRepository<HasWorkDay, Serializable>,
		JpaSpecificationExecutor<HasWorkDay>,
		Repository<HasWorkDay, Serializable> {
}
