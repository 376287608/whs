package com.ufgov.whs.approval.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.ufgov.whs.approval.bean.ApprovalForm;
import com.ufgov.whs.approval.bean.FormAttachment;
import com.ufgov.whs.approval.service.ApprovalFormService;
import com.ufgov.whs.approval.service.FormAttachmentService;
import com.ufgov.whs.business.service.BusinessService;
import com.ufgov.whs.company.bean.CompanyUser;
import com.ufgov.whs.company.service.CompanyUserService;
import com.ufgov.whs.system.bankuser.bean.VBankUser;
import com.ufgov.whs.system.user.bean.SysUser;

/**
 * 业务查询controller
 * @author xlli
 * @date 2017年10月12日
 */
@Controller
@RequestMapping(value = "/approvalform")
public class ApprovalFormController{
	
	protected final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private ApprovalFormService approvalFormService ;
	
	@Autowired
	private FormAttachmentService formAttachmentService ;
	
	@Autowired
	private CompanyUserService companyService ;
	
	@Autowired
	private BusinessService businessService ;
	
	/**
	 * 业务查询页
	 * @return
	 */
	@RequestMapping(value="approvalFormList",method = RequestMethod.GET)
	public String approvalFormList() {
		return "";
	}
	

	/**
	 * 业务申请列表
	 * @param pageNumber
	 * @param pageSize
	 * @param formCode 申请编号
	 * @param businessName 业务名称
	 * @param statuCompany 业务状态
	 * @param queryDate 查询时间段
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/ajaxApprovalFormList",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> ajaxApprovalFormList(Integer pageNumber,Integer pageSize,String formCode,
			String businessName,String statuCompany,String queryDate) throws Exception {
		//校验分页参数
		if(null == pageNumber || null == pageSize){
			return null ;
		}
		//当前用户
		SysUser user = (SysUser)SecurityUtils.getSubject().getSession().getAttribute("user");
		//开始查询时间
		String startDate = null ;
		//结束查询时间
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
		//分页对象
		Page<ApprovalForm> page = null;
		Map<String,Object> pageInfo = null;
		PageRequest pageRequest = approvalFormService.buildPageRequest(pageNumber, pageSize,"desc","modify_time");
		try {
			page = approvalFormService.getFindAll(pageRequest,ApprovalForm.class,formCode,businessName,statuCompany,startDate,endDate,user);
			pageInfo = approvalFormService.getPageInfo(page);
			pageInfo.put("success", "true");
		} catch (Exception e) {
			pageInfo.put("success", "false");
			throw new Exception("业务申请列表查询失败");
		}
		return pageInfo ;
	}
	
	/**
	 * 待接收任务
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/getToReceive",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> getToReceive(Integer pageNumber,Integer pageSize) throws Exception {
		//校验分页参数
		if(null == pageNumber || null == pageSize){
			return null ;
		}
		//当前用户
		SysUser user = (SysUser)SecurityUtils.getSubject().getSession().getAttribute("user");
		//分页对象
		Page<ApprovalForm> page = null;
		Map<String,Object> pageInfo = null;
		PageRequest pageRequest = approvalFormService.buildPageRequest(pageNumber, pageSize,"desc","submit_time");
		try {
			page = approvalFormService.getFindAll(pageRequest,ApprovalForm.class,user,"0");
			pageInfo = approvalFormService.getPageInfo(page);
			pageInfo.put("success", "true");
		} catch (Exception e) {
			pageInfo.put("success", "false");
			throw new Exception("业务申请列表查询失败");
		}
		return pageInfo ;
	}
	
	/**
	 * 被退回业务
	 * @param pageNumber
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "finally", "unchecked" })
	@RequestMapping(value="/getReturned",method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody Map<String,Object> getReturned(Integer pageNumber,Integer pageSize) throws Exception {
		//返回信息
		Map<String,Object> info = new HashMap<String, Object>();
		info.put("msg", "查询失败");
		info.put("success", "false");
		//校验分页参数
		if(null == pageNumber || null == pageSize){
			return info ;
		}
		try {
			//当前用户
			SysUser user = (SysUser)SecurityUtils.getSubject().getSession().getAttribute("user");
			if(user == null){
				info.put("msg", "用户未登录");
				return info ;
			}
			PageRequest pageRequest = approvalFormService.buildPageRequest(pageNumber, pageSize,"desc","submit_time");
			//分页对象
			Page<ApprovalForm> page = approvalFormService.getFindAll(pageRequest,ApprovalForm.class,user,"1");
			info.put("rows", page.getContent());
			info.put("count", page.getTotalElements());
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
	 * 人工分派列表
	 * @param pageNumber
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "unchecked", "finally" })
	@RequestMapping(value="/getArtificial",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> getArtificial(Integer pageNumber,Integer pageSize) throws Exception {
		//返回信息
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("msg", "查询失败");
		map.put("success", "false");
		//校验分页参数
		if(null == pageNumber || null == pageSize){
			return map ;
		}
		try {
			//当前用户
			SysUser user = (SysUser)SecurityUtils.getSubject().getSession().getAttribute("user");
			PageRequest pageRequest = approvalFormService.buildPageRequest(pageNumber, pageSize,"desc","submit_time");
			//分页对象
			Page<ApprovalForm> page = approvalFormService.getAllArtificial(pageRequest,ApprovalForm.class,user.getId());
			map.put("rows", page.getContent());
			map.put("count", page.getTotalElements());
			map.put("msg", "查询成功");
			map.put("success", "true");
			return map ;
		}catch(Exception e){
			logger.error("查询失败！"+e.getMessage(), e);
			throw new Exception("查询失败！"+e.getMessage(),e);
		}finally{
			return map ;
		}
	}
	
	/**
	 * 人工分派人员下拉列表
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getArtificialList",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> getArtificialInfo(Integer businessId){
		//返回信息
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("msg", "查询失败");
		map.put("success", "false");
		//id不能为空
		if(businessId == null){
			map.put("msg", "业务序号不能为空");
			return map ;
		}
		try {
			//查找可分配的前台人员 roleId是2的为前台人员
			List<VBankUser> bankUsers = businessService.getAcceptUserBy(businessId, 2);
			map.put("bankUser", bankUsers);
			map.put("msg", "查询成功");
			map.put("success", "true");
			return map ;
		}catch(Exception e){
			logger.error("查询失败！"+e.getMessage(), e);
			return map ;
		}
	}
	
	/**
	 * 新建业务申请单 回显字段数据
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buildApprovalForm", method = RequestMethod.POST)
    public @ResponseBody Map<String,Object> buildApprovalForm(){
		//返回信息
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("msg", "查询失败");
		map.put("success", "false");
		try {
			//当前用户
			SysUser user = (SysUser)SecurityUtils.getSubject().getSession().getAttribute("user");
			//根据用户id查找企业信息
			CompanyUser companyUser = companyService.getByUserId(user.getId());
			if(companyUser == null){
				return map ;
			}
			map.put("companyUser", companyUser);
			map.put("msg", "查询成功");
			map.put("success", "true");
			return map ;
		}catch(Exception e){
			logger.error("查询失败！"+e.getMessage(), e);
			return map ;
		}
  }
	
	
	/**
	 * 根据申请单id回显数据
	 * @param id 申请单id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/seeApprovalForm", method = {RequestMethod.POST,RequestMethod.GET})
    public @ResponseBody Map<String,Object> seeApprovalForm(String id) throws Exception {
		//返回信息
		Map<String,Object> baseInfo = new HashMap<String, Object>();
		//为了方便前台接收数据 增加一层
		Map<String,Object> item = new HashMap<String, Object>();
		ApprovalForm approvalForm = approvalFormService.getById(id);
		if(approvalForm != null){
			baseInfo.put("formId", approvalForm.getId());
			baseInfo.put("registerName", approvalForm.getContactName());
			baseInfo.put("businessId", approvalForm.getBusinessId());
			baseInfo.put("phone", approvalForm.getContactTele());
			baseInfo.put("email", approvalForm.getContactMail());
			baseInfo.put("address", approvalForm.getContactAddress());
			baseInfo.put("formCode", approvalForm.getFormCode());
			baseInfo.put("businessName", approvalForm.getBusinessName());
			baseInfo.put("applyTime", approvalForm.getApplyTime());
			baseInfo.put("submitTime", approvalForm.getSubmitTime());
			item.put("statuCompany", approvalForm.getStatuCompany());
			item.put("statuBank", approvalForm.getStatuBank());
			//通知获取方式
			baseInfo.put("noticeGet", approvalForm.getNoticeGet());
			//附件信息
			List<FormAttachment> formAttachments = null ;
			//已办结附件
			if(approvalForm.getIsfinish().equals("1")){
				formAttachments = formAttachmentService.getFormAttachmentByFormIdIsFinish(approvalForm.getId());
			}else{
				formAttachments = formAttachmentService.getFormAttachmentByFormId(approvalForm.getId());
			}
//			baseInfo.put("attachments", formAttachments) ;
			item.put("item", baseInfo) ;
			item.put("attachments", formAttachments);
		}
		return item;
  }
}
