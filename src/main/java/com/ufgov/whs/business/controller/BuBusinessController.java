package com.ufgov.whs.business.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.activiti.engine.impl.util.json.JSONObject;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ufgov.whs.business.bean.BuBusiness;
import com.ufgov.whs.business.bean.BuGuides;
import com.ufgov.whs.business.service.BuBusinessService;
import com.ufgov.whs.guide.bean.Guides;
import com.ufgov.whs.law.bean.Laws;
import com.ufgov.whs.system.user.bean.SysUser;

/**
 * 业务类型controller
 * @author xlli
 * @date 2015年1月14日
 */
@Controller
@RequestMapping(value = "/bubusiness")
public class BuBusinessController{
	
	protected final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private BuBusinessService buBusinessService ;
	
	/**
	 * 业务类型列表页
	 * @return
	 */
	@RequestMapping(value="bubusinessList",method = {RequestMethod.POST,RequestMethod.GET})
	public String guidesList() {
		
		return "company/apply" ;
	}
	
	/**
	 * 业务类型查询/发布列表
	 * @param pageNumber
	 * @param pageSize
	 * @param businessId
	 * @param businessName
	 * @param queryDate
	 * @param isPublish 标识 0非发布列表 1 发布列表 （非发布列表要显示已发布的业务类型）
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "finally", "unchecked" })
	@RequestMapping(value="/getBusinessList",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> getBusinessList(Integer pageNumber,Integer pageSize,
			String businessName,String queryDate,String isPublish) throws Exception{
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
		PageRequest pageRequest = buBusinessService.buildPageRequest(pageNumber, pageSize,"desc","update_date");
		//分页对象
		Page<BuBusiness> page = buBusinessService.getFindAll(pageRequest,BuBusiness.class,businessName,startDate,endDate,isPublish);
		info.put("rows", page.getContent());
		//总条数
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
	 * 查找所有业务类型
	 * @param request 请求对象
	 * @param pageNumber 请求页数
	 * @param pageSize 每页条数
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="ajaxBubusinessList",method = RequestMethod.POST)
	public @ResponseBody List<BuBusiness> ajaxBubusinessList() throws Exception {

		List<BuBusiness> allBuBusiness = buBusinessService.getAllBuBusiness();
		return allBuBusiness ;
	}
	
	/**
	 * 根据业务类型 查找模板文件id和申请表文件id
	 * @param businessId
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="ajaxGetFileId",method = RequestMethod.POST)
	public @ResponseBody Map<String,String> ajaxGetFileId(Integer businessId) throws Exception {
		BuBusiness buBusiness = buBusinessService.getBuBusinessById(businessId);
		//返回信息
		HashMap<String,String> fileInfo = new HashMap<String, String>();
		fileInfo.put("filetemplateDocId", buBusiness.getFiletemplateDocId());
		fileInfo.put("fileDocId", buBusiness.getFileDocId());
		return fileInfo ;
	}

}
