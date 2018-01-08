package com.ufgov.whs.approval.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

import com.ufgov.whs.approval.bean.ApprovalReport;
import com.ufgov.whs.approval.bean.ReportAttachment;
import com.ufgov.whs.approval.bean.TransactBusiness;
import com.ufgov.whs.approval.bean.VBankStatus;
import com.ufgov.whs.approval.service.ApprovalFormService;
import com.ufgov.whs.approval.service.ApprovalReportService;
import com.ufgov.whs.approval.service.FormAttachmentService;
import com.ufgov.whs.approval.service.ReportAttachmentService;
import com.ufgov.whs.attachment.service.IDocAddrInfoService;
import com.ufgov.whs.businesslog.bean.BusinessLog;
import com.ufgov.whs.businesslog.service.BusinessLogService;
import com.ufgov.whs.company.service.CompanyUserService;
import com.ufgov.whs.process.bean.ProStep;
import com.ufgov.whs.process.service.ProStepService;
import com.ufgov.whs.system.user.bean.SysUser;
import com.ufgov.whs.system.utils.StatuConstant;

/**
 * 业务审批controller
 * @author xlli
 * @date 2017年10月12日
 */
@Controller
@RequestMapping(value = "/approvalreport")
public class ApprovalReportController{
	
	protected final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private ApprovalFormService approvalFormService ;
	
	@Autowired
	private ApprovalReportService approvalReportService ;
	
	@Autowired
	private FormAttachmentService formAttachmentService ;
	
	@Autowired
	private CompanyUserService companyService ;
	
	@Autowired
	ReportAttachmentService reportAttachmentService;
	
	@Autowired
	private IDocAddrInfoService docAddrInfoService ;
	
	@Autowired
	private BusinessLogService businessLogService ;
	
	@Autowired
	private ProStepService proStepService ;
	
	/**
	 * 业务查询页
	 * @return
	 */
	@RequestMapping(value="/approvalFormList",method = RequestMethod.GET)
	public String approvalFormList() {
		return "";
	}

	/**
	 * 业务审批待办在办已完结列表
	 * @param pageNumber
	 * @param pageSize
	 * @param formCode 申请编号
	 * @param businessName 业务名称
	 * @param statuCompany 业务状态
	 * @param queryDate 查询时间段
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/ajaxToTransactList",method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody Map<String,Object> ajaxToTransactList(HttpServletRequest request,Integer pageNumber,
			Integer pageSize,String status) throws Exception {
		//校验分页参数
		if(null == pageNumber || null == pageSize || isEmpty(status)){
			return null ;
		}
		//当前用户
		SysUser user = (SysUser)SecurityUtils.getSubject().getSession().getAttribute("user");
		if(user == null || !status.matches("[0123]{1}")){
			return null ;
		}
		//判断是内网还是互联网
		boolean flag = approvalReportService.isInner();
		//分页对象
		Page<ApprovalReport> page = null;
		Page<TransactBusiness> pageBusiness = null ;
		PageRequest pageRequest = approvalReportService.buildPageRequest(pageNumber, pageSize,"desc","submit_time");
		Map<String,Object> pageInfo = null ;
		try {
			// status 0 待办理 1 在办理 2 已办结 3 待办结
			if("0".equals(status)){
				page = approvalReportService.getToTransactList(pageRequest,ApprovalReport.class,user,flag);
			}else if("1".equals(status)){//在办理
				pageBusiness = approvalReportService.getTransactingList(pageRequest,TransactBusiness.class,user,flag);
			}else if("2".equals(status)){//已办结
				page = approvalReportService.getfinishList(pageRequest,ApprovalReport.class,user);
			}else if("3".equals(status)){//待办结
				page = approvalReportService.getToFinishList(pageRequest,ApprovalReport.class,user,flag);
			}else{
				return null ;
			}
			//返回信息
			if("1".equals(status)){
				pageInfo = approvalReportService.getBusinessPageInfo(user.getLoginName(),pageBusiness);
			}else{
				pageInfo = approvalReportService.getPageInfo(page);
			}
			pageInfo.put("success", "true");
			return pageInfo;
		} catch (Exception e) {
			pageInfo.put("success", "false");
			throw new Exception("列表查询失败");
		}
	}
	
	/**
	 * 根据id返回审批单详情信息
	 * @param id
	 * @return
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value="/approvalReportInfo",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> approvalReportInfo(HttpServletRequest request,String id) {
		//返回信息
		Map<String,Object> info = new HashMap<String, Object>();
		info.put("msg", "查询失败");
		info.put("success", "false");
		//id不能为空
		if(isEmpty(id)){
			return info ;
		}
		try {
			//根据id查询详情信息
			ApprovalReport approvalReport = approvalReportService.getApprovalReport(id);
			if(approvalReport == null){
				return info ;
			}
			//当前用户
			SysUser user = (SysUser) SecurityUtils.getSubject().getSession().getAttribute("user");
			if(user == null){
				return info ;
			}
			//查找相关附件
			List<ReportAttachment> attachments = approvalReportService.getReportAttachment(id);
			//如果审批单不是已办结和已终止 则设置附件上一版本
			if(!approvalReport.getStatuBank().equals(StatuConstant.REPORTSTATU_YBJ) && !approvalReport.getStatuBank().equals(StatuConstant.REPORTSTATU_YZZ)){
				approvalReportService.setPreversion(attachments);
			}
			//当前意见
			BusinessLog businessLog = businessLogService.getCurrentUserBusinessLog(user.getLoginName(), id);
			String currentSug = null ;
			if(businessLog != null){
				currentSug = businessLog.getOperationOpinon();
			}
			//历史意见
			List<BusinessLog> businessLogList = businessLogService.getByReportId(id);
			//最终审核人
			ProStep proStep = null ;
			//审批单最后审批角色
			proStep = proStepService.getMaxStepByReportId(id);
			//为了实现前台代码复用，所以审批单返回字段需要和申请单一致
			Map<String,Object> item = new HashMap<String, Object>();
			item.put("formId", approvalReport.getId());
			item.put("formCode", approvalReport.getFormCode());
			item.put("registerName", approvalReport.getContactName());
			item.put("phone", approvalReport.getContactTele());
			item.put("email", approvalReport.getContactMail());
			item.put("address", approvalReport.getContactAddress());
			item.put("businessName", approvalReport.getBusinessName());
			item.put("applyTime", approvalReport.getApplyTime());
			item.put("statuCompany", approvalReport.getStatuCompany());
			item.put("statuBank", approvalReport.getStatuBank());
			item.put("reportState", approvalReport.getReportState());
			//通知获取方式
			item.put("noticeGet", approvalReport.getNoticeGet());
			item.put("applyName", approvalReport.getApplyName());
			item.put("applyOrgCode", approvalReport.getApplyOrgCode());
			item.put("completeTime", approvalReport.getCompleteTime());
			info.put("item", item);
			info.put("attachments", attachments);
			info.put("currentSug", currentSug);
			info.put("sug", businessLogList);
			info.put("topUser", proStep);
			info.put("businessDocumentCode", approvalReport.getBusinessDocumentCode());
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
	    * 导出列表
	    * @param pageNumber
	    * @param pageSize
	    * @return
	    * @throws Exception
	    */
	   @SuppressWarnings({ "finally", "unchecked" })
	   @RequestMapping(value = "/exportOrImportList", method = {RequestMethod.POST,RequestMethod.GET})
	   public @ResponseBody Map<String,Object> exportOrImportList(Integer pageNumber,Integer pageSize,String flag) throws Exception {                 
		   	//返回信息
			Map<String,Object> info = new HashMap<String, Object>();
			info.put("msg", "查询失败");
			info.put("success", "false");
			SysUser user = (SysUser) SecurityUtils.getSubject().getSession().getAttribute("user");
			try {
				if(user == null || isEmpty(user.getLoginName()) || isEmpty(flag)){
					return info ;
				}
				PageRequest pageRequest = approvalReportService.buildPageRequest(pageNumber, pageSize,"desc","apply_time");
				Page<ApprovalReport> page = null ;
				//导出列表
				if("1".equals(flag)){
					page = approvalReportService.getExportList(pageRequest, ApprovalReport.class, user.getLoginName());
				}else if("2".equals(flag)){//导入列表
					page = approvalReportService.getImportList(pageRequest, ApprovalReport.class, user.getLoginName());
				}else{
					return info ;
				}
				//列表数据
				info.put("rows", page.getContent());
				//总页数
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
	 * 审批单列表综合查询
	 * @param pageNumber
	 * @param pageSize
	 * @param formCode 申请编号
	 * @param businessName 业务名称
	 * @param statuBank 业务状态
	 * @param queryDate 查询时间段
	 * @return
	 * @throws Exception
	 */
   	@SuppressWarnings({ "unchecked", "finally" })
	@RequestMapping(value="/ajaxApprovalReportList",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> ajaxApprovalFormList(HttpServletRequest request,Integer pageNumber,Integer pageSize,String formCode,
			String businessName,String statuBank,String queryDate) throws Exception {
   		//返回信息
   		Map<String,Object> map = new HashMap<String, Object>();
		map.put("msg", "查询失败");
		map.put("success", "false");
		//校验分页参数
		if(null == pageNumber || null == pageSize){
			return map ;
		}
		//当前用户
		SysUser user = (SysUser)SecurityUtils.getSubject().getSession().getAttribute("user");
		if(user == null){
			return map ;
		}
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
					map.put("msg", "时间格式错误");
					return map ;
				}
			}
			PageRequest pageRequest = approvalReportService.buildPageRequest(pageNumber, pageSize,"desc","modify_time");
			//分页对象
			Page<ApprovalReport> page = approvalReportService.getFindAll(pageRequest,ApprovalReport.class,formCode,businessName,statuBank,startDate,endDate,user.getId());
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
   	 * 根据内外网返回银行状态
   	 * @return
   	 */
	@SuppressWarnings("finally")
	@RequestMapping(value="/getBankStatus",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> getBankStatus() {
		Map<String,Object> info = new HashMap<String, Object>();
		info.put("msg", "状态查询失败");
		info.put("success", "false");
		try {
			//判断是内网还是互联网
			boolean flag = approvalReportService.isInner();
			//业务状态
			List<VBankStatus> bankStatus = approvalReportService.getBankStatus(flag);
			info.put("statusOfBank", bankStatus);
			info.put("msg", "状态查询成功");
			info.put("success", "true");
		}catch(Exception e){
			logger.error("状态查询失败！"+e.getMessage(), e);
			throw new Exception("状态查询失败！"+e.getMessage(),e);
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
