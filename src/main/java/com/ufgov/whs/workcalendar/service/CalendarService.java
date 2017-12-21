package com.ufgov.whs.workcalendar.service;

import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;

import com.ufgov.whs.workcalendar.bean.SpecialCase;
import com.ufgov.whs.workcalendar.bean.WorkCalendar;

public interface CalendarService {
	 /**
     * @throws Exception 
      * getFindAll(工作日历设置)
      * TODO(这里描述这个方法适用条件 – 可选)
      * TODO(这里描述这个方法的执行流程 – 可选)
      * TODO(这里描述这个方法的使用方法 – 可选)
      * TODO(这里描述这个方法的注意事项 – 可选)
      *
      * @Title: getFindAll
      * @Description: TODO
      * @return void    返回类型
      * @throws
      */
	 public PageImpl getFindAll(PageRequest pageRequest) throws Exception;
	 
	 /**
	     * @throws Exception 
	      * getFindAllweihu(工作日历设置->维护)
	      * TODO(这里描述这个方法适用条件 – 可选)
	      * TODO(这里描述这个方法的执行流程 – 可选)
	      * TODO(这里描述这个方法的使用方法 – 可选)
	      * TODO(这里描述这个方法的注意事项 – 可选)
	      * 
	      * @Title: getFindAll
	      * @Description: TODO
	      * @return void    返回类型
	      * @throws
	      */
     public PageImpl getFindAllweihu(PageRequest pageRequest,String wcId) throws Exception;
     /**
	     * @throws Exception 
	      * getFindAllworkday(工作日列表分页)
	      * TODO(这里描述这个方法适用条件 – 可选)
	      * TODO(这里描述这个方法的执行流程 – 可选)
	      * TODO(这里描述这个方法的使用方法 – 可选)
	      * TODO(这里描述这个方法的注意事项 – 可选)
	      * 
	      * @Title: getFindAllworkday
	      * @Description: TODO
	      * @return PageImpl    返回类型
	      * @throws
	      */
     public PageImpl getFindAllworkday(PageRequest pageRequest,String id) throws Exception;	 
	 /**
	     * 工作日历设置的方法，根据id查询一条数据
	     * 
	     * @param id
	     * @return WorkCalendar
	     */
	 public WorkCalendar getWorkCalendarById(String id);
	 
	 /**
	     * 工作日历设置的方法，保存新增
	     * 
	     * @param workCalendar
	     * @return int
	     */
	 public int saveWorkCalendar(WorkCalendar workCalendar);
	 /**
	     * 工作日历设置的方法，保存页面维护的新增
	     * 
	     * @param specialCase
	     * @return int
	     */
	 public int saveSpecialCase(SpecialCase specialCase);
	 
	 /**
	     * 工作日历设置的方法，保存修改
	     * 
	     * @param workCalendar
	     * @return int
	     */
	 public int updateWorkCalendar(WorkCalendar workCalendar);
	 /**
	     * 工作日历设置的方法，保存修改
	     * 
	     * @param SpecialCase
	     * @return int
	     */
	 public int updateSpecialCase(SpecialCase specialCase);
	 /**
	     * 工作日历设置的方法，删除某年的工作日历
	     * 
	     * @param year
	     * @return int
	     */
	 public int delete(String year);
	 /**
	     * 工作日历设置的方法，删除某年特殊日期
	     * 
	     * @param id
	     * @return int
	     */
	 public int deleteweihu(String id);
	 /**
	     * 工作日历设置的方法，根据主键查询一条SpecialCase
	     * 
	     * @param id
	     * @return SpecialCase
	     */
	 public SpecialCase findSpecialCase(String id);
}
