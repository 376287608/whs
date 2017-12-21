package com.ufgov.whs.system.log.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ufgov.whs.common.utils.DateUtils;
import com.ufgov.whs.common.utils.excel.ExportExcel;
import com.ufgov.whs.system.user.bean.SysUser;
import com.ufgov.whs.common.persistence.PropertyFilter;
import com.ufgov.whs.common.controller.BaseController;
import com.ufgov.whs.system.log.bean.SysLog;
import com.ufgov.whs.system.log.service.LogService;

/**
 * 日志controller
 * @author fucj
 * @date 2015年1月14日
 */
@Controller
@RequestMapping("system/log")
public class LogController extends BaseController{

	@Autowired
	private LogService logService;
	
	/**
	 * 默认页面
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list(){
		return "system/logList";
	}
	
	/**
	 * 获取日志json
	 */
	@RequiresPermissions("sys:log:view")
	@RequestMapping("json")
	@ResponseBody
	public Map<String, Object> list(HttpServletRequest request) {
		Page<SysLog> logPage=null;
		//List<PropertyFilter> filters = PropertyFilter.buildFromHttpRequest(request);
		//if(filters.size()>0){
		//	logPage.setPageNo(1);
		//}
		//logPage = logService.search(logPage, filters);
		//构造easyui表格数据
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("rows", logPage.getContent());
		map.put("total", logPage.getSize());
		return map;
	}
	
	/**
	 * 删除日志
	 * @param id
	 */
	@RequiresPermissions("sys:log:delete")
	@RequestMapping(value = "delete/{id}",produces="text/html")
	@ResponseBody
	public String delete(@PathVariable("id") Integer id) {
		//logService.delete(id);
		return "success";
	}
	
	/**
	 * 批量删除日志
	 * @param idList
	 */
	@RequestMapping(value = "delete", method = RequestMethod.POST,produces="text/html")
	@ResponseBody
	public String delete(@RequestBody List<Integer> idList) {
		logService.deleteLog(idList);
		return "success";
	}

	/**
	 * 导出excel
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("exportExcel")
	public String exportExcel(HttpServletRequest request, HttpServletResponse response) throws Exception{
		try {
            String fileName = "日志数据"+DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
            //List<Log> log = logService.getAll();
    		//new ExportExcel("日志数据", Log.class).setDataList(log).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "system/logList";
	}
}
