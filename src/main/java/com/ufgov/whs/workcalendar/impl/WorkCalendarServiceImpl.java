package com.ufgov.whs.workcalendar.impl;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springside.modules.persistence.SearchFilter.Operator;

import com.ufgov.whs.workcalendar.bean.HasSpecialCase;
import com.ufgov.whs.workcalendar.bean.HasWorkCalendar;
import com.ufgov.whs.workcalendar.bean.HasWorkDay;
import com.ufgov.whs.workcalendar.bean.WorkDayPK;
import com.ufgov.whs.workcalendar.service.IHasSpecialCaseService;
import com.ufgov.whs.workcalendar.service.IHasWorkCalendarService;
import com.ufgov.whs.workcalendar.service.IHasWorkDayService;
import com.ufgov.whs.workcalendar.service.IWorkCalendarService;


/**
 * 1 定义每年的日历、假期安排； 2 根据假期安排计算工作日
 * 
 * @author wangfy
 *
 */
@Service
public class WorkCalendarServiceImpl implements IWorkCalendarService {

	/**
	 * 日志对象
	 */
	private final Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	private IHasWorkCalendarService hasWorkCalendarService;
	@Autowired
	private IHasSpecialCaseService hasSpecialCaseService;
	@Autowired
	private IHasWorkDayService hasWorkDayService;

	@Autowired
	private JdbcTemplate jdbc;

	/**
	 * 查询某个日期对应的工作日信息
	 * 
	 * @param date
	 *            YYYY-MM-DD
	 * @return HasWorkDay
	 * @throws Exception
	 */
	@Override
	public HasWorkDay getWorkDay(String sdate) throws Exception {
		HasWorkDay workDay = null;
		try {
			Date date = new SimpleDateFormat("yyyy-MM-dd").parse(sdate);
			Map<String, Object> searchParams = new HashMap<String, Object>();
			searchParams.put(Operator.EQ + "_workDate", new SimpleDateFormat(
					"yyyy-MM-dd").format(date));
			List<HasWorkDay> workDays = hasWorkDayService
					.getHasWorkDay(searchParams);

			// 日历表存在当天的日历信息
			if (!workDays.isEmpty()) {
				workDay = workDays.get(0);// 取当天日期为工作日
			} else {
				// 日历表不存在当天的日历信息
				//ORACLE适用
//				String querySql = "select * from  (select ROW_NUMBER() OVER (ORDER BY WORK_DATE) AS rn, t.* FROM has_workday t where work_date>'"
//						+ sdate + "') where rownum=1";
				//SQLSERVER适用
				String querySql = "select top(1) * from (select ROW_NUMBER() OVER (ORDER BY WORK_DATE) AS rn, t.* FROM has_workday t where work_date>'"
						+ sdate + "') w";
				Map<String, Object> obj = jdbc.queryForMap(querySql);
				if (obj != null) {
					workDay = new HasWorkDay();
					workDay.setWorkDate((String) obj.get("WORK_DATE"));
					workDay.setOnDutyTime((String) obj.get("ONDUTY_TIME"));
					workDay.setOffDutyTime((String) obj.get("OFFDUTY_TIME"));
				}
			}
			// 取不到，抛出异常
			if (workDay == null) {
				throw new Exception("工作日历未定义。");
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return workDay;
	}

	/**
	 * 计算某个时间对应的工作日
	 * 
	 * @param time
	 *            YYYY-MM-DD HH:MM:SS
	 * @return 工作日YYYY-MM-DD
	 */
	public String getWorkDate(String time) throws Exception {
		HasWorkDay workDay = null;
		try {
			Date dateTime = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss")
					.parse(time);
			long lInputTime = dateTime.getTime();

			Date date = new SimpleDateFormat("yyyy-MM-dd").parse(time);
			Map<String, Object> searchParams = new HashMap<String, Object>();
			searchParams.put(Operator.EQ + "_workDate", new SimpleDateFormat(
					"yyyy-MM-dd").format(date));
			List<HasWorkDay> workDays = hasWorkDayService
					.getHasWorkDay(searchParams);

			// 日历表存在当天的日历信息
			if (!workDays.isEmpty()) {
				workDay = workDays.get(0);// 默认取当天日期为工作日
				Date offDutyDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss")
						.parse(workDay.getOffDutyTime());
				long lOffDutyTime = offDutyDate.getTime();
				if (lInputTime > lOffDutyTime) {
					// 取下一个工作日
					WorkDayPK pk = workDay.getId();
					int index = pk.getWorkIndex();
					pk.setWorkIndex(index + 1);
					workDay = hasWorkDayService.getHasWorkDayById(pk);
				}
			} else {
				// 日历表不存在当天的日历信息
				//ORACLE适用
//				String querySql = "select * from  (select ROW_NUMBER() OVER (ORDER BY WORK_DATE) AS rn, t.* FROM has_workday t where work_date>'"
//						+ time + "') where rownum=1";
				//SQLSERVER适用
				String querySql = "select top(1) * from  (select ROW_NUMBER() OVER (ORDER BY WORK_DATE) AS rn, t.* FROM has_workday t where work_date>'"
						+ time + "') w";
				Map<String, Object> obj = jdbc.queryForMap(querySql);
				if (obj != null) {
					workDay = new HasWorkDay();
					workDay.setWorkDate((String) obj.get("WORK_DATE"));
				}
			}

			// 取不到，抛出异常
			if (workDay == null) {
				throw new Exception("工作日历未定义。");
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return workDay.getWorkDate();
	}

	/**
	 * 计算某个时间以后m天的工作日
	 * 
	 * @param time
	 *            YYYY-MM-DD HH:MM:SS
	 * @param m
	 *            天数间隔
	 * @return 工作日 YYYY-MM-DD
	 * @throws Exception
	 */
	public String getAfterWorkDate(String time, int m) throws Exception {

		String time2 = getWorkDate(time);
		String time3 = null;
		int index = 0;
		HasWorkDay workday = null;
		WorkDayPK wkPk = null;

		// 根据工作日查询工作序号

		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put(Operator.EQ + "_workDate", time2);
		List<HasWorkDay> workDayList = hasWorkDayService
				.getHasWorkDay(searchParams);

		if (!workDayList.isEmpty()) {
			workday = workDayList.get(0);
			wkPk = workday.getId();
			index = wkPk.getWorkIndex();
		} else {
			throw new Exception("工作日历未定义。");
		}
		index += m;
		String year = wkPk.getId();
		int workdayTotal = hasWorkCalendarService.getHasWorkCalendarById(year)
				.getWorkdayTotal();
		if (workdayTotal >= index) {
			// 如果当年总工作日不小于m天之后的工作日

			// 根据工序号查询工作日

			WorkDayPK pk = new WorkDayPK();
			pk.setWorkIndex(index);
			pk.setId(year);
			HasWorkDay hworkday = hasWorkDayService.getHasWorkDayById(pk);
			time3 = hworkday.getWorkDate();

		} else {
			// 否则年份+1，在下一年进行查找
			index = index - workdayTotal;
			int n = Integer.parseInt(year);
			String afterYear = (n + 1) + "";
			WorkDayPK pk = new WorkDayPK();
			pk.setId(afterYear);
			pk.setWorkIndex(index);
			time3 = hasWorkDayService.getHasWorkDayById(pk).getWorkDate();

		}
		return time3;
	}

	/**
	 * 计算某个时间以前m天的工作日
	 * 
	 * @param time
	 *            YYYY-MM-DD HH:MM:SS
	 * @param m
	 *            天数间隔
	 * @return 工作日 YYYY-MM-DD
	 * @throws Exception
	 */
	public String getBeforeWorkDate(String time, int m) throws Exception {

		String time2 = getWorkDate(time);
		String time3 = null;
		int index = 0;
		HasWorkDay workday;
		WorkDayPK wkPk = null;

		Map<String, Object> searchParam = new HashMap<String, Object>();
		searchParam.put(Operator.EQ + "_workDate", time2);
		List<HasWorkDay> workdays = hasWorkDayService
				.getHasWorkDay(searchParam);

		if (!workdays.isEmpty()) {
			workday = workdays.get(0);
			wkPk = workday.getId();
			index = wkPk.getWorkIndex();
		} else {
			throw new Exception("工作日历未定义。");
		}

		index -= m;
		String year = wkPk.getId();
		// 计算年份工作日天数
		int beforeyear = Integer.parseInt(year) - 1;
		int workdayTotal = hasWorkCalendarService.getHasWorkCalendarById(((Integer)beforeyear).toString())
				.getWorkdayTotal();

		if (index < 0) {
			// 如果小于0，则以(上一年度工作日天数-超出数）查询上一年度的HAS_WORKDAY得出工作日。

			// 根据工序号查询工作日
			WorkDayPK pk = new WorkDayPK();
			pk.setId(beforeyear + "");
			pk.setWorkIndex(workdayTotal + index);
			time3 = hasWorkDayService.getHasWorkDayById(pk).getWorkDate();

		} else {
			// 否则以工作日序号-X作为新的工作日序号

			WorkDayPK pk = new WorkDayPK();
			pk.setId(year);
			pk.setWorkIndex(index);
			time3 = hasWorkDayService.getHasWorkDayById(pk).getWorkDate();

		}

		return time3;
	}

	/**
	 * 
	 * @param startTime
	 *            YYYY-MM-DD HH:MM:SS
	 * @param endTime
	 *            YYYY-MM-DD HH:MM:SS
	 * @return 天数间隔
	 * @throws Exception
	 */
	public int CountWorkDaysBetween(String startTime, String endTime)
			throws Exception {

		int duringdays = 0;
		String starttime = getWorkDate(startTime);
		String endtime = getWorkDate(endTime);
		int startIndex = 0;
		int betweenDays = 0;
		int endtimeIndex = 0;

		WorkDayPK stwdPK = new WorkDayPK();
		WorkDayPK etwdPK = new WorkDayPK();
		HasWorkDay stworkday = null;
		HasWorkDay etworkday = null;
		Date startdate = null;
		Date enddate = null;

		Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams.put(Operator.EQ + "_workDate", starttime);
		List<HasWorkDay> stworkDayList = hasWorkDayService
				.getHasWorkDay(searchParams);

		Map<String, Object> searchParams2 = new HashMap<String, Object>();
		searchParams2.put(Operator.EQ + "_workDate", endtime);
		List<HasWorkDay> edworkDayList = hasWorkDayService
				.getHasWorkDay(searchParams2);

		if (!stworkDayList.isEmpty()) {
			stworkday = stworkDayList.get(0);
			stwdPK = stworkday.getId();
			startIndex = stwdPK.getWorkIndex();
		} else {
			throw new Exception("工作日历未定义。");
		}

		if (!edworkDayList.isEmpty()) {
			etworkday = edworkDayList.get(0);
			etwdPK = etworkday.getId();
			endtimeIndex = etwdPK.getWorkIndex();
		} else {
			throw new Exception("工作日历未定义。");
		}

		try {
			startdate = new SimpleDateFormat("yyyy-MM-dd").parse(starttime);
			enddate = new SimpleDateFormat("yyyy-MM-dd").parse(endtime);
		} catch (ParseException e) {
			logger.info(e.getMessage());
		}
		// 根据工作日查询工作序号

		if (startdate.getTime() > enddate.getTime()) {
			throw new Exception("结束时间需要大于等于开始时间");
		} else {

			if (stwdPK.getId().equals(etwdPK.getId())) {
				duringdays = endtimeIndex - startIndex;

			} else {

				int startYear = Integer.parseInt(stwdPK.getId());
				int endYear = Integer.parseInt(etwdPK.getId());
				for (int i = startYear + 1; i < endYear; i++) {

					betweenDays = hasWorkCalendarService
							.getHasWorkCalendarById(i + "").getWorkdayTotal();
				}
				duringdays = hasWorkCalendarService.getHasWorkCalendarById(
						startYear + "").getWorkdayTotal()
						- startIndex + betweenDays + endtimeIndex;
				// duringdays = getOneyearDays(c.get(Calendar.YEAR)) -
				// startIndex + betweenDays + endtimeIndex;

			}
		}

		return duringdays;
	}

	public int addHasWorkdays(String year) throws Exception {
		// 计算一年的总工作日天数
		HasWorkCalendar workCalendar = hasWorkCalendarService
				.getHasWorkCalendarById(year);
		if (workCalendar == null)
			throw new Exception("该年度的工作日历未定义。");

		String startDate = workCalendar.getStartDate();
		String endDate = workCalendar.getEndDate();
		int totalDays = getDaysByYear(startDate, endDate);

		String date = null;
		String onDutyTime = workCalendar.getOnDutyTime();
		String offDutyTime = workCalendar.getOffDutyTime();
		try {
			WorkDayPK wdPK = new WorkDayPK();
			wdPK.setId(year);

			int workdayTotal = 0;// 工作日历工作日天数
			// 2 增加指定年份的has_workday表数据
			int index = 1;
			for (int i = 0; i < totalDays; i++) {
				HasWorkDay workDay = new HasWorkDay();
				date = getDateAfter(startDate, i);
				workDay.setId(wdPK);
				// 设置workday的工作日期
				workDay.setWorkDate(date);

				if (!isWeekend(date)) {
					// 非周末的假期类型处理
					Map<String, Object> specialCaseParams = new HashMap<String, Object>();
					specialCaseParams.put(Operator.EQ + "_wcId", year);
					specialCaseParams.put(Operator.EQ + "_caseDate", date);
					specialCaseParams.put(Operator.EQ + "_caseType", "1");

					List<HasSpecialCase> specialCaseList = hasSpecialCaseService
							.getHasSpecialCase(specialCaseParams);

					if (specialCaseList.isEmpty()) {
						// 设置workday的工作序号
						wdPK.setWorkIndex(index++);
						// 不是特例上班类型，时间取HasWorkCalendar的上下班时间
						workDay.setOnDutyTime(date + " " + onDutyTime);
						workDay.setOffDutyTime(date + " " + offDutyTime);
						hasWorkDayService.saveHasWorkDay(workDay);
						workdayTotal++;
					}
				} else {// 周末上班类型处理
					Map<String, Object> specialCaseParams = new HashMap<String, Object>();
					specialCaseParams.put(Operator.EQ + "_wcId", year);
					specialCaseParams.put(Operator.EQ + "_caseDate", date);
					specialCaseParams.put(Operator.EQ + "_caseType", "2");

					List<HasSpecialCase> specialCaseList = hasSpecialCaseService
							.getHasSpecialCase(specialCaseParams);
					HasSpecialCase spCase = null;
					if (!specialCaseList.isEmpty())
						spCase = specialCaseList.get(0);
					if (spCase != null) {
						// 设置workday的工作序号
						wdPK.setWorkIndex(index++);
						workDay.setOnDutyTime(date + " "
								+ spCase.getOnDutyTime());
						workDay.setOffDutyTime(date + " "
								+ spCase.getOffDutyTime());
						hasWorkDayService.saveHasWorkDay(workDay);
						workdayTotal++;
					}
				}
			}

			workCalendar.setWorkdayTotal(workdayTotal);
			// 1 添加haswokcalendar的工作日天数
			hasWorkCalendarService.saveHasWorkCalendar(workCalendar);
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
		return 0;
	}

	public int resetHasWorkdays(String year) throws Exception {
		String querySql = "select * from has_workday where id='" + year + "'";
		List<Map<String, Object>> workDayList = jdbc.queryForList(querySql);

		if (!workDayList.isEmpty()) {
			String delSql = "delete from has_workday where id='" + year + "'";
			jdbc.execute(delSql);
		}
		int result = addHasWorkdays(year);
		return result;
	}

	/**
	 * 判断是否是周末
	 * 
	 * @param date
	 * @return
	 */
	private boolean isWeekend(String date) {
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		Date bdate;
		boolean flag = false;
		try {
			bdate = format1.parse(date);
			Calendar cal = Calendar.getInstance();
			cal.setTime(bdate);

			if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY
					|| cal.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY)
				flag = true;
		} catch (ParseException e) {
			logger.info(e.getMessage());
		}
		return flag;
	}

	/**
	 * 查询指定日期m天之后的日期
	 * 
	 * @param specifiedDay
	 * @return
	 */
	private String getDateAfter(String sdate, int m) {
		Calendar c = Calendar.getInstance();
		Date date;
		try {
			date = new SimpleDateFormat("yy-MM-dd").parse(sdate);
			c.setTime(date);
			int day = c.get(Calendar.DATE);
			c.set(Calendar.DATE, day + m);
		} catch (ParseException e) {
			logger.info(e.getMessage());
		}

		String dayAfter = new SimpleDateFormat("yyyy-MM-dd")
				.format(c.getTime());
		return dayAfter;
	}

	/**
	 * 获取两个日期之间的天数
	 * 
	 * @param startDate
	 * @param endDate
	 * @return
	 * @throws ParseException
	 */
	private int getDaysByYear(String startDate, String endDate)
			throws ParseException {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		long to = df.parse(startDate).getTime();
		long from = df.parse(endDate).getTime();
		return (int) ((from - to) / (1000 * 60 * 60 * 24)) + 1;
	}
}
