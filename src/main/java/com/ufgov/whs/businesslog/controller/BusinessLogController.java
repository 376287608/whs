package com.ufgov.whs.businesslog.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ufgov.whs.businesslog.bean.BusinessLog;
import com.ufgov.whs.businesslog.service.BusinessLogService;

/**
 * 业务日志controller
 * @author xlli
 * @date 2015年1月14日
 */
@Controller
@RequestMapping(value = "/bulog")
public class BusinessLogController{
	
	protected final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private BusinessLogService businessLogService ;
	
	/**
	 * 根据申请单id查找日志
	 * @param reportId
	 * @return
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value="getBusinessLogList",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> getByReportId(String reportId){
		//返回信息
		Map<String,Object> info = new HashMap<String, Object>();
		info.put("msg", "查询失败");
		info.put("success", "false");
		//id不能为空
		if(isEmpty(reportId)){
			return info ;
		}
		try {
			List<BusinessLog> businessLogList = businessLogService.getByReportId(reportId);
			info.put("rows", businessLogList);
			info.put("msg", "查询成功");
			info.put("success", "true");
		} catch (Exception e) {
			logger.error("查询失败！"+e.getMessage(), e);
			throw new Exception("查询失败！"+e.getMessage(),e);
		}finally{
			return info ;
		}
	}
	
	/**
	 * 判断字符串是否为空
	 * @param str
	 * @return
	 */
	public boolean isEmpty(String str){
		if(str == null || str.trim().isEmpty()){
			return true ;
		}
		return false ;
	}
	
}
