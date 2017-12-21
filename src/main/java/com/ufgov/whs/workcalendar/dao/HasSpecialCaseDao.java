package com.ufgov.whs.workcalendar.dao;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;

import com.ufgov.whs.workcalendar.bean.HasSpecialCase;


public interface HasSpecialCaseDao extends
PagingAndSortingRepository<HasSpecialCase, Serializable>,
JpaSpecificationExecutor<HasSpecialCase>,
Repository<HasSpecialCase, Serializable>{

}
