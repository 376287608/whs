package com.ufgov.whs.workcalendar.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import com.ufgov.whs.workcalendar.bean.HasWorkDay;
import com.ufgov.whs.workcalendar.bean.WorkDayPK;


/**
 * 工作日的服务层
 * 
 * @author Wangfy
 *
 */
public interface IHasWorkDayService {
	/**
	 * 查询工作日 根据id查询
	 * 
	 * @param id
	 * @return HasWorkDay
	 * @throws Exception
	 */
	public HasWorkDay getHasWorkDayById(WorkDayPK id) throws Exception;

	/**
	 * 保存工作日
	 * 
	 * @param HasWorkDay
	 * @return HasWorkDay
	 * @throws Exception
	 */
	public HasWorkDay saveHasWorkDay(HasWorkDay hasWorkDay) throws Exception;

	/**
	 * 查询工作日
	 * 
	 * @param searchParams
	 * @param pageRequest
	 * @return Page<HasWorkDay>
	 * @throws Exception
	 */
	public Page<HasWorkDay> getHasWorkDay(Map<String, Object> searchParams,
			PageRequest pageRequest) throws Exception;

	public List<HasWorkDay> getHasWorkDay(Map<String, Object> searchParams)
			throws Exception;
	
	public String getHasWorkDay(String workdate,int number);
}
