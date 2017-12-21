package com.ufgov.whs.workcalendar.dao;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;

import com.ufgov.whs.workcalendar.bean.WorkCalendar;

/**
 * 
 
  * @ClassName: Op2DeptDao
  * @Description: 工作日历设置持久层
  * @author Pengzg
  * @date 2016年8月17日 下午3:01:31
 */

public interface WorkCalendarDao extends PagingAndSortingRepository<WorkCalendar, Serializable>, JpaSpecificationExecutor<WorkCalendar>, Repository<WorkCalendar, Serializable> {

}