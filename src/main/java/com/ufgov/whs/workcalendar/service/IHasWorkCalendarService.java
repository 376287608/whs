package com.ufgov.whs.workcalendar.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import com.ufgov.whs.workcalendar.bean.HasWorkCalendar;


/**
 * 
 * @author Wangfy
 *
 */
public interface IHasWorkCalendarService {

	/**
	 * 查询工作日历 根据id查询
	 * 
	 * @param id
	 * @return HasWorkCalendar
	 * @throws Exception
	 */
	public HasWorkCalendar getHasWorkCalendarById(String id) throws Exception;

	/**
	 * 保存工作日历
	 * 
	 * @param HasWorkCalendar
	 * @return HasWorkCalendar
	 * @throws Exception
	 */
	public HasWorkCalendar saveHasWorkCalendar(HasWorkCalendar hasWorkCalendar)
			throws Exception;

	/**
	 * 查询工作日历
	 * 
	 * @param searchParams
	 * @param pageRequest
	 * @return Page<HasWorkCalendar>
	 * @throws Exception
	 */
	public Page<HasWorkCalendar> getHasWorkCalendar(
			Map<String, Object> searchParams, PageRequest pageRequest)
			throws Exception;

	public List<HasWorkCalendar> getHasWorkCalendar(
			Map<String, Object> searchParams) throws Exception;

}
