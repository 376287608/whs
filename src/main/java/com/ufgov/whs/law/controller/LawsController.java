package com.ufgov.whs.law.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
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

import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ufgov.whs.business.bean.BuLaws;
import com.ufgov.whs.business.service.BuLawsService;
import com.ufgov.whs.common.utils.DateUtils;
import com.ufgov.whs.law.bean.LawAttachment;
import com.ufgov.whs.law.bean.Laws;
import com.ufgov.whs.law.service.LawsAttachmentService;
import com.ufgov.whs.law.service.LawsService;
import com.ufgov.whs.system.user.bean.SysUser;

/**
 * 法律法规controller
 * @author xlli
 * @date 2015年1月14日
 */
@Controller
@RequestMapping(value = "/laws")
public class LawsController{
	
	protected final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private LawsService lawsService ;
	
	@Autowired
	private LawsAttachmentService lawsAttachmentService ;
	
	@Autowired
	private BuLawsService buLawsService ;
	
	/**
	 * 法律法规页
	 * @return
	 */
	@RequestMapping(value="/lawsList",method = {RequestMethod.POST,RequestMethod.GET})
	public String lawsList(Model model) {
		//法律法规标识（办事指南和法律法规共用页面）
		model.addAttribute("type", "L");
		model.addAttribute("typeName", "法律法规");
		return "main/rule" ;
	}
	
	/**
	 * 法律法规列表
	 * @param user
	 * @param company
	 * @return
	 * @throws Exception 
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/ajaxLawsList",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String, Object> ajaxLawsList(Integer pageNumber,Integer pageSize,Integer businessId,
			@RequestParam(value="guidesName") String lawsName,String queryDate) throws Exception {
		//校验参数
		if(null == pageNumber || null == pageSize){
			return null ;
		}
		//当前用户
		SysUser user = (SysUser)SecurityUtils.getSubject().getSession().getAttribute("user");
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
					return null ;
				}
				
			}
		} catch (Exception e) {
			throw new Exception("时间错误");
		}
		//根据业务编号查找法律法规编号
		List<BuLaws> buLawsList = null;
		if(businessId != null){
			buLawsList = buLawsService.getguidesIdsBybusiness(businessId);
		}
		//分页对象
		Page<Laws> page = null;
		PageRequest pageRequest = lawsService.buildPageRequest(pageNumber, pageSize,"desc","update_date");
		try {
			page = lawsService.getFindAll(pageRequest,Laws.class,user,buLawsList,lawsName,startDate,endDate,true);
			Map<String,Object> pageInfo = lawsService.getPageInfo(page);
			return pageInfo ;
		} catch (Exception e) {
			throw new Exception("法律法规列表查询失败");
		}
	}
	
	/**
	 * 添加或更新法律法规
	 * @param laws
	 * @param id
	 * @param businessId
	 * @param lawName
	 * @param lawContent
	 * @param type
	 * @param attachmentlist
	 * @param isPublic 0 未发布 1 发布
	 * @param flag 标识 1 保存 2 更新
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "finally" })
	@RequestMapping(value="/saveOrUpdateLaw",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> saveOrUpdateLaw(Laws laws,Integer id,Integer[] businessIds, String lawName,String lawContent,
			String type,String attachmentlist,String isPublic,String flag ) throws Exception{
		//test
//		businessIds = new Integer[]{15,16};
//		attachmentlist = "[{\"docName\":\"sss\",\"docId\":\"sss\"}]";
		
		Map<String,Object> info = new HashMap<String, Object>();
		info.put("msg", "添加或更新失败");
		info.put("success", "false");
		//校验
		if(businessIds == null || businessIds.length==0 || StringUtils.isBlank(lawName) || StringUtils.isBlank(lawContent) ||
				StringUtils.isBlank(type) || StringUtils.isBlank(attachmentlist) || StringUtils.isBlank(isPublic)){
			return info;
		}
		try {
			//当前用户
			SysUser user = (SysUser)SecurityUtils.getSubject().getSession().getAttribute("user");
			//flag必须是1或者2 type必须是 0 1 2其中之一
			if(!flag.matches("[01]{1}") || !type.matches("[012]{1}") || user == null){
				info.put("msg", "设置失败");
				return info ;
			}
		    //成功标识
		    boolean bl = false ;
		    //更新操作
		    if(flag.equals("2")){
		    	//id 业务状态不能为空 
		    	if(id == null) {
		    		return info;
		    	}
		    	laws = lawsService.getLawsById(id);
		    	//无此数据
		    	if(laws == null){
		    		info.put("msg", "没有此数据");
		    		return info;
		    	}else{
		    		laws.setLawName(lawName);
		    		laws.setLawContent(lawContent);
		    		laws.setType(type);
		    		laws.setIsPublic(isPublic);
		    	}
		    }
		    //保存或更新数据
		    bl = lawsService.save(laws,user,flag);
		    //数据保存成功 则保存附件
		    if(bl){
		    	ObjectMapper objectMapper = new ObjectMapper(); 
				JavaType javaType = objectMapper.getTypeFactory().constructParametricType(List.class, LawAttachment.class);
				//把json字符串数组转换成List
			    List<LawAttachment> attachmentList = objectMapper.readValue(attachmentlist, javaType); 
			    bl = lawsAttachmentService.save(attachmentList,laws.getId());
		    }
		    //附件保存成功 则保存关联的业务
		    if(bl){
		    	bl = buLawsService.save(businessIds,laws.getId(),user);
		    }
		    //业务关系保存成功 则更新返回信息
		    if(bl){
		    	info.put("msg", "添加或更新成功");
				info.put("success", "true");
		    }
		}catch(Exception e){
			logger.error("添加或更新失败！"+e.getMessage(), e);
			throw new Exception("添加或更新失败！"+e.getMessage(),e);
		}finally{
			return info ;
		}
	}
	
	/**
	 * 批量删除法律法规
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value="/deleteLawsByIds",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> deleteLawsById(Integer[] ids) throws Exception{
		Map<String,Object> info = new HashMap<String, Object>();
		info.put("msg", "删除失败");
		info.put("success", "false");
		try {
			if(ids == null){
				info.put("msg", "法律法规序号不能为空");
				return info ;
			}
			//当前用户
			SysUser user = (SysUser)SecurityUtils.getSubject().getSession().getAttribute("user");
			if(user == null){
				return info ;
			}
			lawsService.deleteLawsByIds(ids, user.getLoginName(), DateUtils.getDateTime());
			info.put("msg", "删除完成");
			info.put("success", "true");
		}catch(Exception e){
			logger.error("删除失败！"+e.getMessage(), e);
			throw new Exception("删除失败！"+e.getMessage(),e);
		}finally{
			return info ;
		}
	}
	
	/**
	 * 法律法规发布列表
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "finally", "unchecked" })
	@RequestMapping(value="/getLawsPublishList",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> getLawsPublishList(Integer pageNumber,Integer pageSize,Integer businessId,
			@RequestParam(value="guidesName") String lawsName,String queryDate) throws Exception{
		Map<String,Object> info = new HashMap<String, Object>();
		info.put("msg", "查询失败");
		info.put("success", "false");
		//校验参数
		if(null == pageNumber || null == pageSize){
			return info ;
		}
		//当前用户
		SysUser user = (SysUser)SecurityUtils.getSubject().getSession().getAttribute("user");
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
					info.put("msg", "时间格式不正确");
					return info ;
				}
			}
		//根据业务编号查找法律法规编号
		List<BuLaws> buLawsList = null;
		if(businessId != null){
			buLawsList = buLawsService.getguidesIdsBybusiness(businessId);
		}
		PageRequest pageRequest = lawsService.buildPageRequest(pageNumber, pageSize,"desc","update_date");
		//分页对象
		Page<Laws> page = lawsService.getFindAll(pageRequest,Laws.class,user,buLawsList,lawsName,startDate,endDate,false);
		info.put("rows", page.getContent());
		info.put("count", page.getTotalElements());
		info.put("msg", "查询成功");
		info.put("success", "true");
		}catch(Exception e){
			logger.error("查询失败！"+e.getMessage(), e);
			throw new Exception("查询失败！"+e.getMessage(),e);
		}finally{
			return info ;
		}
	}
	
	/**
	 * 发布/取消发布
	 * @param id
	 * @param flag 0 取消发布 1 发布
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value="/setLawsPublish",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> setLawsPublish(Integer[] ids,String flag) throws Exception{
		Map<String,Object> info = new HashMap<String, Object>();
		info.put("msg", "发布失败");
		info.put("success", "false");
		if(ids == null || ids.length==0 || StringUtils.isBlank(flag)){
			info.put("msg", "设置失败");
			return info ;
		}
		//返回消息
		if("0".equals(flag)){
			info.put("msg", "取消发布失败");
		}
		try {
			//当前用户
			SysUser user = (SysUser)SecurityUtils.getSubject().getSession().getAttribute("user");
			//flag必须是1或者2
			if(!flag.matches("[01]{1}") || user == null){
				info.put("msg", "设置失败");
				return info ;
			}
			lawsService.publishLawsByIds(ids, flag, user.getLoginName(), DateUtils.getDateTime());
			info.put("msg", "发布成功");
			//返回消息
			if("0".equals(flag)){
				info.put("msg", "取消发布成功");
			}
			info.put("success", "true");
		}catch(Exception e){
			logger.error("发布/取消发布失败！"+e.getMessage(), e);
			throw new Exception("发布/取消发布失败！"+e.getMessage(),e);
		}finally{
			return info ;
		}
	}
	
	/**
	 * 法律法规详情页
	 * @param id
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/getLawsInfo",method = RequestMethod.GET)
	public String getLawsInfo() throws Exception{
		return "main/ruleInfo" ;
	}
	
	/**
	 * 法律法规详情信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value="/ajaxGetLawsInfo",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> ajaxGetLawsInfo(Integer id) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("msg", "查询失败");
		map.put("success", "false");
		//校验
		if(null == id){
			return  map ;
		}
		try{
			Laws laws = lawsService.getLawsById(id);
			map.put("item",laws);
			//根据办事指南id查找相关附件 
			List<LawAttachment> attachments = null ;
			if(laws != null){
				attachments = lawsAttachmentService.getAttachmentByLawId(laws.getId());
			}
			map.put("attachments", attachments);
			map.put("msg", "查询成功");
			map.put("success", "true");
		}catch(Exception e){
			logger.error("查询失败！"+e.getMessage(), e);
			throw new Exception("查询失败！"+e.getMessage(),e);
		}finally{
			return map ;
		}
		
	}

}
