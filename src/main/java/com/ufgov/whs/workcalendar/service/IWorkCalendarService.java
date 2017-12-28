package com.ufgov.whs.workcalendar.service;

import com.ufgov.whs.workcalendar.bean.HasWorkDay;


/**
 * 1 定义每年的日历、假期安排； 2 根据假期安排计算工作日
 * 
 * @author wangfy
 *
 */
public interface IWorkCalendarService {
	/**
	 * 查询某个日期对应的工作日信息
	 * 
	 * @param date
	 *            YYYY-MM-DD
	 * @return HasWorkDay
	 * @throws Exception
	 */
	public HasWorkDay getWorkDay(String date) throws Exception;

	/**
	 * 计算某个时间对应的工作日
	 * 
	 * @param time
	 *            YYYY-MM-DD HH:MM:SS
	 * @return 工作日YYYY-MM-DD
	 * @throws Exception
	 */
	public String getWorkDate(String time) throws Exception;

	/**
	 * 计算某个时间以后m天的工作日
	 * 
	 * @param time
	 *            YYYY-MM-DD HH:MM:SS
	 * @param m
	 *            天数间隔
	 * @return 工作日 YYYY-MM-DD
	 */
	public String getAfterWorkDate(String time, int m) throws Exception;

	/**
	 * 计算某个时间以前m天的工作日
	 * 
	 * @param time
	 *            YYYY-MM-DD HH:MM:SS
	 * @param m
	 *            天数间隔
	 * @return 工作日 YYYY-MM-DD
	 */
	public String getBeforeWorkDate(String time, int m) throws Exception;

	/**
	 * 计算两个时间之间的工作日数
	 * 
	 * @param startTime
	 *            YYYY-MM-DD HH:MM:SS
	 * @param endTime
	 *            YYYY-MM-DD HH:MM:SS
	 * @return 天数间隔
	 */
	public int CountWorkDaysBetween(String startTime, String endTime)
			throws Exception;

	/**
	 * 根据某年产生has_workdays的数据
	 * 
	 * @param year
	 * @return 0 失败 1 成功
	 * @throws Exception
	 */
	public int addHasWorkdays(String year) throws Exception;

	/**
	 * 重置某年产生has_workdays的数据
	 * 
	 * @param year
	 * @return 0 失败 1 成功
	 */
	public int resetHasWorkdays(String year) throws Exception;
}
