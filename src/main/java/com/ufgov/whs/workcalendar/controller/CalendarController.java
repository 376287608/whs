package com.ufgov.whs.workcalendar.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Validator;

import org.activiti.engine.impl.util.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ufgov.whs.common.utils.UUIDUtil;
import com.ufgov.whs.workcalendar.bean.SpecialCase;
import com.ufgov.whs.workcalendar.bean.WorkCalendar;
import com.ufgov.whs.workcalendar.bean.WorkDay;
import com.ufgov.whs.workcalendar.service.CalendarService;
import com.ufgov.whs.workcalendar.service.IWorkCalendarService;

/**
 * 工作日历设置的控制层
 * @ClassName: CalendarController
 * @Description: 工作日历设置Controller
 *
 */
@Controller
@RequestMapping(value = "/aideapprove/calendar/calendar")
public class CalendarController {
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	public static final String PAGESIZE = "10";

    public static final String DEFAULTPAGE = "10";
    
    @Autowired
    public CalendarService calendarService;

    @Autowired
    public IWorkCalendarService iWorkCalendarService;
    
    @Autowired
    private Validator validator;
    
    /**
     * 工作日历设置方法
     * 
     * @Title: Page
     * @Description: 工作日历设置
     * @param pageNumber
     * @param pageSize
     * @param sortType
     * @param model
     * @param request
     * @return Page<WorkCalendar> 返回值類型
     * @throws Exception 
     */
	@RequestMapping(value = "/page", method = RequestMethod.POST)
    public @ResponseBody Page<WorkCalendar> mpage(
    		@RequestParam(value = "page", defaultValue = DEFAULTPAGE) int pageNumber,
            @RequestParam(value = "page.size", defaultValue = PAGESIZE) int pageSize,
            @RequestParam(value = "sortType", defaultValue = "auto") String sortType,
            @RequestParam(value = "sortField", defaultValue = "auto") String sortField,
            Model model, ServletRequest request, HttpSession session) throws Exception {
        Page<WorkCalendar> categoryPage = null;
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize,
            sortType,sortField);
        try {
            	categoryPage = calendarService.getFindAll(pageRequest);
                return categoryPage;
        } catch (Exception e) {
            logger.error("工作日历设置维护分页出错!", e);
            throw new Exception("工作日历设置维护分页失败");
        }
    }
	 /**
     * 创建分页请求.
     */
    private PageRequest buildPageRequest(int pageNumber, int pagzSize,
            String sortType,String sortField) {
        Sort sort = null;
        List<String> orders=new ArrayList<String>();
        if ("asc".equals(sortType)) {
        		orders.add(sortField);
        		orders.add("id");
        		sort = new Sort(Direction.ASC, orders);
        } else if ("desc".equals(sortType)) {
	        	orders.add(sortField);
	        	orders.add("id");
	            sort = new Sort(Direction.DESC, orders);
        }else{
    		orders.add("id");
    		sort = new Sort(Direction.ASC, orders);
        }
        return new PageRequest(pageNumber - 1, pagzSize, sort);
    }
    
    /** 进入新增 */
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public @ResponseBody WorkCalendar add() {
        WorkCalendar workCalendar = new WorkCalendar();
        workCalendar.setOndutyTime("00:00:00");
        workCalendar.setOffdutyTime("23:59:59");
        workCalendar.setWorkdayTotal("255");
        return workCalendar;
    }
    /** 进入维护页面的新增 页面*/
    @RequestMapping(value = "/createweihu", method = RequestMethod.POST)
    public @ResponseBody SpecialCase addweihu(HttpServletRequest resq) {
        SpecialCase specialCase = new SpecialCase();
        JSONObject jsb = new JSONObject(resq.getParameter("json"));
        specialCase.setWcId(jsb.getString("id"));
        return specialCase;
    }
   
    /** 保存新增 
     * @throws Exception */
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public @ResponseBody int create(HttpServletRequest resq) throws Exception {
    	WorkCalendar workCalendar = new WorkCalendar();
        int result = 1;
        String json = (String) resq.getParameter("json");
        JSONObject jsb = new JSONObject(json);
        workCalendar.setId(jsb.getString("year"));
        workCalendar.setStartDate(jsb.getString("startTime"));
        workCalendar.setEndDate(jsb.getString("endTime"));
        workCalendar.setOndutyTime(jsb.getString("ondutyTime"));
        workCalendar.setOffdutyTime(jsb.getString("offdutyTime"));
        workCalendar.setWorkdayTotal((String) jsb.get("workdayTotal"));
        
        try {
            //获取保存的结果
        	result = calendarService.saveWorkCalendar(workCalendar);
           
        } catch (Exception e) {

            logger.error("工作日历设置保存出错!", e);
            throw new Exception("工作日历设置保存失败");
        }
        return result;
    }
    /** 保存维护页面的新增 
     * @throws Exception */
    @RequestMapping(value = "/createweihuinfo", method = RequestMethod.POST)
    public @ResponseBody int createweihu(HttpServletRequest resq) throws Exception {
    	SpecialCase specialCase = new SpecialCase();
        int result = 1;
        String json = (String) resq.getParameter("json");
        JSONObject jsb = new JSONObject(json);
        
        specialCase.setId(UUIDUtil.genUUID());
        specialCase.setWcId(jsb.getString("year"));
        specialCase.setCaseType(jsb.getString("caseType"));
        specialCase.setCaseDate(jsb.getString("caseDate"));
        specialCase.setOndutyTime(jsb.getString("ondutyTime"));
        specialCase.setOffdutyTime(jsb.getString("offdutyTime"));
        
        try {
            //获取保存的结果
        	result = calendarService.saveSpecialCase(specialCase);
           
        } catch (Exception e) {

            logger.error("工作日历设置保存出错!", e);
            throw new Exception("工作日历设置保存失败");
        }
        return result;
    }
    /**
     * 进入修改界面
     * 
     * @param id
     * @param model
     * @return 需要更新的实体的json结构
     * @throws Exception 
     */
    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public @ResponseBody WorkCalendar updateForm(@PathVariable("id") String id,
            Model model) throws Exception {
       
    	WorkCalendar workCalendar = null;

        try {
        	workCalendar = calendarService.getWorkCalendarById(id);
        } catch (Exception e) {
            logger.error("工作日历设置维护更新界面出错!", e);
            throw new Exception("工作日历设置维护更新界面失败");
        }
        return workCalendar;
    }
    /**
     * 进入页面维护的修改界面
     * 
     * @param id
     * @return 需要更新的实体的json结构
     * @throws Exception 
     */
    @RequestMapping(value = "/updateweihu", method = RequestMethod.POST)
    public @ResponseBody SpecialCase updateFormweihu(HttpServletRequest resq) throws Exception {
        JSONObject jsb = new JSONObject(resq.getParameter("json"));
        String id = jsb.getString("id");
        return calendarService.findSpecialCase(id);
    }
    /** 保存更新 
     * @throws Exception */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public @ResponseBody int update(HttpServletRequest resq) throws Exception {
    	WorkCalendar workCalendar = new WorkCalendar();
        int result = 1;
        String json = (String) resq.getParameter("json");
        JSONObject jsb = new JSONObject(json);
        workCalendar.setId(jsb.getString("year"));
        workCalendar.setStartDate(jsb.getString("startTime"));
        workCalendar.setEndDate(jsb.getString("endTime"));
        workCalendar.setOndutyTime(jsb.getString("ondutyTime"));
        workCalendar.setOffdutyTime(jsb.getString("offdutyTime"));
        workCalendar.setWorkdayTotal((String) jsb.get("workdayTotal"));
        try {
                 //获取保存的结果
             	result = calendarService.updateWorkCalendar(workCalendar);
                
            } catch (Exception e) {

                 logger.error("工作日历设置保存出错!", e);
                 throw new Exception("工作日历设置保存失败");
            }
        
       
        return result;
       
    }
    /** 保存页面维护的更新 
     * @throws Exception */
    @RequestMapping(value = "/updateweihuinfo", method = RequestMethod.POST)
    public @ResponseBody int updateweihu(HttpServletRequest resq) throws Exception {
    	SpecialCase specialCase = new SpecialCase();
        int result = 1;
        String json = (String) resq.getParameter("json");
        JSONObject jsb = new JSONObject(json);
        specialCase.setId(jsb.getString("id"));
        specialCase.setWcId(jsb.getString("year"));
        specialCase.setCaseType(jsb.getString("caseType"));
        specialCase.setCaseDate(jsb.getString("caseDate"));
        specialCase.setOndutyTime(jsb.getString("ondutyTime"));
        specialCase.setOffdutyTime(jsb.getString("offdutyTime"));
        
        try {
            //获取更新的结果
        	result = calendarService.updateSpecialCase(specialCase);
           
        } catch (Exception e) {

            logger.error("工作日历设置更新出错!", e);
            throw new Exception("工作日历设置更新失败");
        }
        return result;
       
    }
    /** 删除某年的一项特殊日期
     * @throws Exception */
    @RequestMapping(value = "/deleteweihu", method = RequestMethod.POST)
    public @ResponseBody int deleteweihu(HttpServletRequest resq) throws Exception {
        int result = 1;
        String json = (String) resq.getParameter("json");
        JSONObject jsb = new JSONObject(json);
        String id = jsb.getString("id");
        
        try {
            //获取删除的结果
        	result = calendarService.deleteweihu(id);
           
        } catch (Exception e) {

            logger.error("特殊日期删除出错!", e);
            throw new Exception("特殊日期删除失败");
        }
        return result;
       
    }
    /** 删除某年的工作日历
     * @throws Exception */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public @ResponseBody int delete(HttpServletRequest resq) throws Exception {
        int result = 1;
        String json = (String) resq.getParameter("json");
        JSONObject jsb = new JSONObject(json);
        String year = jsb.getString("id");
        
        try {
            
        	calendarService.delete(year);
           
        } catch (Exception e) {

            logger.error("工作日历删除出错!", e);
            throw new Exception("工作日历删除失败");
        }
        return result;
       
    }
    /** 根据某年产生HAS_WORKDAYS的数据
     * 
     * @throws Exception */
    @RequestMapping(value = "/sc", method = RequestMethod.POST)
    public @ResponseBody int sc(HttpServletRequest resq) throws Exception {
        int result = 1;
        String json = (String) resq.getParameter("json");
        JSONObject jsb = new JSONObject(json);
        String year = jsb.getString("year");
        
        try {
        	//重置某年产生HAS_WORKDAYS的数据
        	iWorkCalendarService.resetHasWorkdays(year);
        } catch (Exception e) {
            result = 0;
            logger.error("生成工作日出错!", e);
            throw new Exception("生成工作日失败");
        }
        return result;
       
    }
    /**
     * 工作日历设置->维护方法
     * 
     * @Title: Page
     * @Description: 工作日历设置
     * @param pageNumber
     * @param pageSize
     * @param sortType
     * @param model
     * @param request
     * @return Page<WorkCalendar> 返回值類型
     * @throws Exception 
     */
	@RequestMapping(value = "/pageweihu", method = RequestMethod.POST)
    public @ResponseBody Page<SpecialCase> mpageweihu(
    		@RequestParam(value = "page", defaultValue = DEFAULTPAGE) int pageNumber,
            @RequestParam(value = "page.size", defaultValue = PAGESIZE) int pageSize,
            @RequestParam(value = "wcId", defaultValue = "auto") String wcId,
            @RequestParam(value = "sortType", defaultValue = "auto") String sortType,
            @RequestParam(value = "sortField", defaultValue = "auto") String sortField,
            Model model, ServletRequest request, HttpSession session) throws Exception {
        Page<SpecialCase> categoryPage = null;
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize,
            sortType,sortField);
        try {
            	categoryPage = calendarService.getFindAllweihu(pageRequest,wcId);
                return categoryPage;
        } catch (Exception e) {
            logger.error("工作日历设置维护分页出错!", e);
            throw new Exception("工作日历设置维护分页失败");
        }
    }
	
	@RequestMapping(value = "/pageworkday", method = RequestMethod.POST)
    public @ResponseBody Page<WorkDay> mpageworkday(
    		@RequestParam(value = "page", defaultValue = DEFAULTPAGE) int pageNumber,
            @RequestParam(value = "page.size", defaultValue = PAGESIZE) int pageSize,
            @RequestParam(value = "id", defaultValue = "auto") String id,
            @RequestParam(value = "sortType", defaultValue = "auto") String sortType,
            @RequestParam(value = "sortField", defaultValue = "auto") String sortField,
            Model model, ServletRequest request, HttpSession session) throws Exception {
        Page<WorkDay> categoryPage = null;
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize,
            sortType,sortField);
        try {
            	categoryPage = calendarService.getFindAllworkday(pageRequest, id);
                return categoryPage;
        } catch (Exception e) {
            logger.error("工作日列表分页出错!", e);
            throw new Exception("工作日列表分页失败");
        }
    }
}
