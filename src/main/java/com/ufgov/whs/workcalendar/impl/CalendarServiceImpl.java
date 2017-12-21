package com.ufgov.whs.workcalendar.impl;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ufgov.whs.common.pagination.IPaginationService;
import com.ufgov.whs.workcalendar.bean.SpecialCase;
import com.ufgov.whs.workcalendar.bean.WorkCalendar;
import com.ufgov.whs.workcalendar.bean.WorkDay;
import com.ufgov.whs.workcalendar.dao.SpecialCaseDao;
import com.ufgov.whs.workcalendar.dao.WorkCalendarDao;
import com.ufgov.whs.workcalendar.service.CalendarService;

@Service
public class CalendarServiceImpl implements CalendarService{
	
	@Autowired
    private WorkCalendarDao workCalendarDao;
	
	@Autowired
	private SpecialCaseDao specialCaseDao;
	
	@Autowired
    private JdbcTemplate jdbc;

	@Autowired
	private IPaginationService ipaginationservice;
	
	@Transactional(readOnly = false,rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public PageImpl getFindAll(PageRequest pageRequest) throws Exception {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder();
		sql.append("select ID as id,START_DATE as startDate,END_DATE as endDate,ONDUTY_TIME as ondutyTime,OFFDUTY_TIME as offdutyTime,WORKDAY_TOTAL as workdayTotal from HAS_WORKCALENDAR");
	    return ipaginationservice.getPageImpl(sql.toString(), pageRequest, WorkCalendar.class);
	}

	@Transactional(readOnly = false,rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public WorkCalendar getWorkCalendarById(String id) {
		// TODO Auto-generated method stub
		return workCalendarDao.findOne(id);
	}

	@Transactional(readOnly = false,rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public int saveWorkCalendar(WorkCalendar workCalendar) {
		// TODO Auto-generated method stub
		int result = 1;
		if(workCalendarDao.exists(workCalendar.getId())){
			result = 2;
		}else{
			try{
				workCalendarDao.save(workCalendar);
			}catch(Exception e){
				result = 0;
			}
			
		}
		return result;
	}

	@Transactional(readOnly = false,rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public int updateWorkCalendar(WorkCalendar workCalendar) {
		// TODO Auto-generated method stub
		int result = 1;	
		try{
			workCalendarDao.save(workCalendar);
		}catch(Exception e){
					result = 0;
		}
		return result;
	}

	@Transactional(readOnly = false,rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public int delete(String year) {
		// TODO Auto-generated method stub
		int result = 1;
		try{
			String sql = "delete from HAS_SPECIAL_CASE where WC_ID='"+year+"'";
			jdbc.execute(sql);
			String sql2 = "delete from HAS_WORKDAY where ID='"+year+"'";
			jdbc.execute(sql2);
			String sql3 = "delete from HAS_WORKCALENDAR where ID='"+year+"'";
			jdbc.execute(sql3);
			
		}catch(Exception e){
				result = 0;
		}
		return result;
	}

	@Transactional(readOnly = false,rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public PageImpl getFindAllweihu(PageRequest pageRequest,String wcId) throws Exception {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder();
		sql.append("select ID as id,WC_ID as wcId,CASE_TYPE as caseType,CASE_DATE as caseDate,ONDUTY_TIME as ondutyTime,OFFDUTY_TIME as offdutyTime from HAS_SPECIAL_CASE where WC_ID='"+wcId+"'");
	    return ipaginationservice.getPageImpl(sql.toString(), pageRequest, SpecialCase.class);
	}

	@Transactional(readOnly = false,rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public int saveSpecialCase(SpecialCase specialCase) {
		// TODO Auto-generated method stub
		int result = 1;
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		list = null;
		  try{
				String caseDate = specialCase.getCaseDate();
				String sql = "select CASE_DATE from HAS_SPECIAL_CASE where WC_ID='"+specialCase.getWcId()+"'";
				list = jdbc.queryForList(sql);
				for(int i = 0; i < list.size(); i++){
					//特殊日期唯一
						if(list.get(i).get("CASE_DATE").equals(caseDate)){
							result = 2;
							break;
						}
				}
				if(result == 1){
					specialCaseDao.save(specialCase);
				}	
			}catch(Exception e){
				result = 0;
			}
			
		
		return result;
	}

	@Transactional(readOnly = false,rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public SpecialCase findSpecialCase(String id) {
		// TODO Auto-generated method stub
		return specialCaseDao.findOne(id);
	}

	@Transactional(readOnly = false,rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public int updateSpecialCase(SpecialCase specialCase) {
		// TODO Auto-generated method stub
		int result = 1;
		SpecialCase specialCase2 = specialCaseDao.findOne(specialCase.getId());
		if(!specialCase2.getCaseDate().equals(specialCase.getCaseDate())){
			List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
			list = null;
			  try{
					String caseDate = specialCase.getCaseDate();
					String sql = "select CASE_DATE from HAS_SPECIAL_CASE where WC_ID='"+specialCase.getWcId()+"'";
					list = jdbc.queryForList(sql);
					for(int i = 0; i < list.size(); i++){
						//特殊日期唯一
							if(list.get(i).get("CASE_DATE").equals(caseDate)){
								result = 2;
								break;
							}
					}
					if(result == 1){
						specialCaseDao.save(specialCase);
					}	
				}catch(Exception e){
					result = 0;
				}
		}else{
			try{
				specialCaseDao.save(specialCase);
			}catch(Exception e){
				result = 0;
			}
		}
		return result;
	}

	@Transactional(readOnly = false,rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public int deleteweihu(String id) {
		// TODO Auto-generated method stub
		int result = 1;
		try{
			String sql = "delete from HAS_SPECIAL_CASE where ID='"+id+"'";
			jdbc.execute(sql);
			//specialCaseDao.delete(id);
		}catch(Exception e){
				result = 0;
		}
		return result;
	}

	@Transactional(readOnly = false,rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public PageImpl getFindAllworkday(PageRequest pageRequest, String id)
			throws Exception {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder();
		sql.append("select ID as id,WORK_INDEX as workIndex,WORK_DATE as workDate,ONDUTY_TIME as ondutyTime,OFFDUTY_TIME as offdutyTime from HAS_WORKDAY where ID='"+id+"'");
	    return ipaginationservice.getPageImpl(sql.toString(), pageRequest, WorkDay.class);
	}
	
    
}
