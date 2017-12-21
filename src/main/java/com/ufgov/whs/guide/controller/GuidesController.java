package com.ufgov.whs.guide.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import com.ufgov.whs.business.bean.BuGuides;
import com.ufgov.whs.business.bean.BuLaws;
import com.ufgov.whs.business.service.BuGuidesService;
import com.ufgov.whs.common.utils.DateUtils;
import com.ufgov.whs.guide.bean.GuideAttachment;
import com.ufgov.whs.guide.bean.Guides;
import com.ufgov.whs.guide.service.GuidesAttachmentService;
import com.ufgov.whs.guide.service.GuidesService;
import com.ufgov.whs.law.bean.LawAttachment;
import com.ufgov.whs.law.bean.Laws;
import com.ufgov.whs.system.user.bean.SysUser;

/**
 * 办事指南controller
 * @author xlli
 * @date 2015年1月14日
 */
@Controller
@RequestMapping(value = "/guides")
public class GuidesController{
	
	protected final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private GuidesService guidesService ;
	
	@Autowired
	private GuidesAttachmentService guidesAttachmentService ;
	
	@Autowired
	private BuGuidesService buGuidesService ;
	
	/**
	 * 办事指南页
	 * @return
	 */
	@RequestMapping(value="/guidesList",method = {RequestMethod.POST,RequestMethod.GET})
	public String guidesList(Model model) {
		//法律法规标识（办事指南和法律法规共用页面）
		model.addAttribute("type", "G");
		model.addAttribute("typeName", "办事指南");
		
		return "main/rule" ;
	}
	
	/**
	 * 办事指南列表
	 * @param request 请求对象
	 * @param pageNumber 请求页数
	 * @param pageSize 每页条数
	 * @param businessId 业务Id
	 * @param guidesName 关键字
	 * @param queryDate 时间段
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/ajaxGuidesList",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String, Object> ajaxGuidesList(HttpServletRequest request,Integer pageNumber,Integer pageSize,
			Integer businessId,String guidesName,String queryDate) {
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
			new Exception("时间错误");
		}
		//根据业务编号查找办事指南编号
		List<BuGuides> guidesIds = null ;
		if(businessId != null){
			guidesIds = buGuidesService.getguidesIdsBybusiness(businessId);
		}
		//分页对象
		Page<Guides> page = null;
		PageRequest pageRequest = guidesService.buildPageRequest(pageNumber, pageSize,"desc","update_date");
		try {
			page = guidesService.getFindAll(pageRequest,Guides.class,user,guidesIds,guidesName,startDate,endDate,true);
			Map<String,Object> pageInfo = guidesService.getPageInfo(page);
			return pageInfo ;
		} catch (Exception e) {
			new Exception("办事指南列表查询失败");
		}
		
		return null ;
	}
	
	/**
	 * 添加或更新办事指南
	 * @param guide
	 * @param id
	 * @param businessIds
	 * @param guidesName
	 * @param guidesContent
	 * @param type
	 * @param attachmentlist
	 * @param isPublic
	 * @param flag
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value="/saveOrUpdateGuide",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> saveOrUpdateGuide(Guides guide,Integer id,Integer[] businessIds, String guidesName,
			String guidesContent,String type,String attachmentlist,String isPublic,String flag ) throws Exception{
		//test
//		businessIds = new Integer[]{15,16};
//		attachmentlist = "[{\"docName\":\"sss\",\"docId\":\"sss\"}]";
		
		Map<String,Object> info = new HashMap<String, Object>();
		info.put("msg", "添加或更新失败");
		info.put("success", "false");
		//校验
		if(businessIds == null || businessIds.length==0 || StringUtils.isBlank(guidesName) || StringUtils.isBlank(guidesContent) ||
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
		    	guide = guidesService.getGuidesById(id);
		    	//无此数据
		    	if(guide == null){
		    		info.put("msg", "没有此数据");
		    		return info;
		    	}else{
		    		guide.setGuidesName(guidesName);
		    		guide.setGuidesContent(guidesContent);
		    		guide.setType(type);
		    		guide.setIsPublic(isPublic);
		    	}
		    }
		    //保存或更新数据
		    bl = guidesService.save(guide,user,flag);
		    //数据保存成功 则保存附件
		    if(bl){
		    	ObjectMapper objectMapper = new ObjectMapper(); 
				JavaType javaType = objectMapper.getTypeFactory().constructParametricType(List.class, GuideAttachment.class);
				//把json字符串数组转换成List
			    List<GuideAttachment> attachmentList = objectMapper.readValue(attachmentlist, javaType); 
			    bl = guidesAttachmentService.save(attachmentList,guide.getId());
		    }
		    //附件保存成功 则保存关联的业务
		    if(bl){
		    	bl = buGuidesService.save(businessIds,guide.getId(),user);
		    }
		    //业务关系保存成功 则更新返回信息
		    if(bl){
		    	info.put("msg", "添加或更新成功");
				info.put("success", "true");
		    }
		}catch(Exception e){
			logger.error("添加或更新"+guide.getId()+"失败！"+e.getMessage(), e);
			throw new Exception("添加或更新"+guide.getId()+"失败！"+e.getMessage(),e);
		}finally{
			return info ;
		}
	}
	
	/**
	 * 批量删除办事指南
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value="/deleteGuidesByIds",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> deleteGuidesByIds(Integer[] ids) throws Exception{
		Map<String,Object> info = new HashMap<String, Object>();
		info.put("msg", "删除失败");
		info.put("success", "false");
		try {
			if(ids == null || ids.length == 0){
				info.put("msg", "办事指南序号不能为空");
				return info ;
			}
			//当前用户
			SysUser user = (SysUser)SecurityUtils.getSubject().getSession().getAttribute("user");
			if(user == null){
				info.put("msg", "用户未登录");
				return info ;
			}
			guidesService.deleteGuidesByIds(ids, user.getLoginName(), DateUtils.getDateTime());
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
	 * 办事指南发布列表
	 * @param request
	 * @param pageNumber
	 * @param pageSize
	 * @param businessId
	 * @param guidesName
	 * @param queryDate
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "unchecked", "finally" })
	@RequestMapping(value="/getGuidesPublishList",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> getGuidesPublishList(HttpServletRequest request,Integer pageNumber,Integer pageSize,
			Integer businessId,String guidesName,String queryDate) throws Exception{
		Map<String,Object> info = new HashMap<String, Object>();
		info.put("msg", "查询失败");
		info.put("success", "false");
		//校验参数
		if(null == pageNumber || null == pageSize){
			return info ;
		}
		//当前用户
		SysUser user = (SysUser)SecurityUtils.getSubject().getSession().getAttribute("user");
		if(user == null){
			return info ;
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
					info.put("msg", "时间格式不正确");
					return info ;
				}
			}
		//根据业务编号查找办事指南编号
		List<BuGuides> buGuideList = null;
		if(businessId != null){
			buGuideList = buGuidesService.getguidesIdsBybusiness(businessId);
		}
		PageRequest pageRequest = guidesService.buildPageRequest(pageNumber, pageSize,"desc","update_date");
		//分页对象
		Page<Guides> page = guidesService.getFindAll(pageRequest,Laws.class,user,buGuideList,guidesName,startDate,endDate,false);
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
	 * @param ids
	 * @param flag 0 未发布 1发布
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value="/setGuidePublish",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> setGuidePublish(Integer[] ids,String flag) throws Exception{
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
			guidesService.publishGuidesByIds(ids, flag, user.getLoginName(), DateUtils.getDateTime());
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
	 * 办事指南详情页
	 * @param id
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/getGuidesInfo",method = RequestMethod.GET)
	public String getGuidesInfo() throws Exception{
		return "main/ruleInfo" ;
	}
	
	/**
	 * 办事指南详情信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value="/ajaxGetGuidesInfo",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> getGuidesInfo(Integer id) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("msg", "查询失败");
		map.put("success", "false");
		//校验
		if(null == id){
			return map ;
		}
		try{
			Guides guides = guidesService.getGuidesById(id);
			map.put("item", guides);
			//根据办事指南id查找相关附件 
			List<GuideAttachment> attachments = null ;
			if(guides != null){
				attachments = guidesAttachmentService.getAttachmentByGuideId(guides.getId());
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
