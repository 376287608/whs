package com.ufgov.whs.workcalendar.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import com.ufgov.whs.workcalendar.bean.HasSpecialCase;

/**
 * 
 * @author Wangfy
 *
 */
public interface IHasSpecialCaseService {
	/**
	 * 查询工作日历特例 根据id查询
	 * 
	 * @param id
	 * @return HasSpecialCase
	 * @throws Exception
	 */
	public HasSpecialCase getHasSpecialCaseById(String id) throws Exception;

	/**
	 * 保存工作日历
	 * 
	 * @param HasSpecialCase
	 * @return HasSpecialCase
	 * @throws Exception
	 */
	public HasSpecialCase saveHasSpecialCase(HasSpecialCase hasSpecialCase)
			throws Exception;

	/**
	 * 查询工作日历特例
	 * 
	 * @param searchParams
	 * @param pageRequest
	 * @return Page<HasSpecialCase>
	 * @throws Exception
	 */
	public Page<HasSpecialCase> getHasSpecialCase(
			Map<String, Object> searchParams, PageRequest pageRequest)
			throws Exception;

	public List<HasSpecialCase> getHasSpecialCase(
			Map<String, Object> searchParams) throws Exception;
}
