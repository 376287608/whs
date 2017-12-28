package com.ufgov.whs.workcalendar.dao;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;

import com.ufgov.whs.workcalendar.bean.SpecialCase;

public interface SpecialCaseDao extends PagingAndSortingRepository<SpecialCase, Serializable>, JpaSpecificationExecutor<SpecialCase>, Repository<SpecialCase, Serializable> {

}
