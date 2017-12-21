package com.ufgov.whs.message.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ufgov.whs.business.bean.BuLaws;
import com.ufgov.whs.business.service.BuLawsService;
import com.ufgov.whs.law.bean.LawAttachment;
import com.ufgov.whs.law.bean.Laws;
import com.ufgov.whs.law.service.LawsAttachmentService;
import com.ufgov.whs.law.service.LawsService;
import com.ufgov.whs.message.bean.Message;
import com.ufgov.whs.message.service.MessageService;
import com.ufgov.whs.system.user.bean.SysUser;

/**
 * 法律法规controller
 * @author xlli
 * @date 2015年1月14日
 */
@Controller
@RequestMapping(value = "/message")
public class MessageController{
	
	protected final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private MessageService messageService ;
	
	
	/**
	 * 消息列表
	 * @param pageNumber
	 * @param pageSize
	 * @param queryDate
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "finally" })
	@RequestMapping(value="/ajaxMessageList",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String, Object> ajaxLawsList(Integer pageNumber,Integer pageSize,String queryDate) {
		//返回信息
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("msg", "查询失败");
		map.put("success", "false");
		//校验参数
		if(null == pageNumber || null == pageSize){
			return map ;
		}
		//当前用户
		SysUser user = (SysUser)SecurityUtils.getSubject().getSession().getAttribute("user");
		if(user == null){
			return map ;
		}
		//开始查询日期
		String startDate = null ;
		//结束查询日期
		String endDate = null ;
		try {
			//如果查询时间不为空
			if(queryDate != null && !queryDate.trim().isEmpty()){
				String[] times = queryDate.split(" ");
				startDate = times[0] ;
				endDate = times[2] ;
				//判断时间格式是否是 yyyy-MM-dd
				if(!startDate.matches("\\d{4}-\\d{2}-\\d{2}") || !endDate.matches("\\d{4}-\\d{2}-\\d{2}")){
					return map ;
				}
				
			}
			PageRequest pageRequest = messageService.buildPageRequest(pageNumber, pageSize,"desc","submit_time");
			//分页对象
			Page<Message>page = messageService.getFindAll(pageRequest,Message.class,user,startDate,endDate);
			map.put("rows", page.getContent());
			map.put("count", page.getTotalElements());
			map.put("msg", "查询成功");
			map.put("success", "true");
			return map ;
		} catch(Exception e){
			logger.error("查询失败！"+e.getMessage(), e);
			throw new Exception("查询失败！"+e.getMessage(),e);
		}finally{
			return map ;
		}
	}
	
	
	/**
	 * 查看
	 * @return
	 */
	@RequestMapping(value="view",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> view(
			@RequestParam(value = "id") Integer id
			) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "查看失败");
		map.put("success", "false");
		try{
			 String message = messageService.view(id);
			 if(message.equals("操作成功")){
				map.put("msg", "操作成功");
				map.put("success", "true"); 
			 }
			//ar.setAcceptResult(acceptResult);
		}catch(Exception e){
			logger.error("查看失败！"+e.getMessage(), e);
			throw new Exception("查看失败！"+e.getMessage(),e);
		}
		return map;
	}
	
}
