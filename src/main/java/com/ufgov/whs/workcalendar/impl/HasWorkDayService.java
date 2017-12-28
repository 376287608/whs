package com.ufgov.whs.workcalendar.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springside.modules.persistence.DynamicSpecifications;
import org.springside.modules.persistence.SearchFilter;

import com.ufgov.whs.common.utils.DateUtils;
import com.ufgov.whs.workcalendar.bean.HasWorkDay;
import com.ufgov.whs.workcalendar.bean.WorkDayPK;
import com.ufgov.whs.workcalendar.dao.HasWorkDayDao;
import com.ufgov.whs.workcalendar.service.IHasWorkDayService;

@Service
public class HasWorkDayService implements IHasWorkDayService {

	@Autowired
	private HasWorkDayDao hasWorkDayDao;

	@Autowired
	JdbcTemplate jdbc;

	@Override
	public HasWorkDay getHasWorkDayById(WorkDayPK id) throws Exception {
		return hasWorkDayDao.findOne(id);
	}

	@Override
	public HasWorkDay saveHasWorkDay(HasWorkDay hasWorkDay) throws Exception {
		return hasWorkDayDao.save(hasWorkDay);
	}

	@Override
	public Page<HasWorkDay> getHasWorkDay(Map<String, Object> searchParams,
			PageRequest pageRequest) throws Exception {
		Specification<HasWorkDay> spec = buildSpecification(searchParams);
		return hasWorkDayDao.findAll(spec, pageRequest);
	}

	@Override
	public List<HasWorkDay> getHasWorkDay(Map<String, Object> searchParams)
			throws Exception {
		Specification<HasWorkDay> spec = buildSpecification(searchParams);
		return hasWorkDayDao.findAll(spec);
	}

	public Specification<HasWorkDay> buildSpecification(
			Map<String, Object> searchParams) {
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		Specification<HasWorkDay> spec = DynamicSpecifications.bySearchFilter(
				filters.values(), HasWorkDay.class);
		return spec;
	}

	@Override
	public String getHasWorkDay(String workdate, int number) {
		// TODO Auto-generated method stub
		String dayString = null;
		StringBuilder sql = new StringBuilder();
		sql.append("select  * from (select a.*,(@rowNum:=@rowNum+1) as rowNo From has_workday a ,(Select (@rowNum :=0) ) b  ORDER BY a.id ,a.work_date) c where c.work_date = '");
		sql.append(workdate);
		sql.append("'");
		List<Map<String, Object>> dayList = jdbc.queryForList(sql.toString());
		int rowno = 0 ;
		if(dayList!=null && dayList.size()>0){
			Double d=Double.parseDouble(dayList.get(0).get("rowNo").toString());
			rowno=d.intValue();
		}
	    
		StringBuilder sql2 = new StringBuilder();
		sql2.append("select  * from (select a.*,(@rowNum:=@rowNum+1) as rowNo From has_workday a ,(Select (@rowNum :=0) ) b  ORDER BY a.id ,a.work_date) c where c.rowNo = ");
		sql2.append(rowno+number+"");
		List<Map<String, Object>> day = jdbc.queryForList(sql2.toString());
		if(day!=null&&day.size()>0){
			dayString = (String) day.get(0).get("work_date");
		}
		return dayString;
	}

}
