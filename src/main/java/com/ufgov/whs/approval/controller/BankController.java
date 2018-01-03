package com.ufgov.whs.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * 业务查询controller
 * @author xlli
 * @date 2017年10月12日
 */
@Controller
@RequestMapping(value = "/bank")
public class BankController{
	
	/**
	 * 用户申请页面
	 * @return
	 */
	@RequestMapping(value="/myWork/approval",method = RequestMethod.GET)
	public String approval() {
		return "bank/myWork/approval";
	}
	
	/**
	 * 待接收
	 * @return
	 */
	@RequestMapping(value="/myWork/receive",method = RequestMethod.GET)
	public String receive() {
		return "bank/myWork/receive";
	}
	
	/**
	 * 被退回
	 * @return
	 */
	@RequestMapping(value="/myWork/returned",method = RequestMethod.GET)
	public String returned() {
		return "bank/myWork/returned";
	}
	
	/**
	 * 待办理
	 * @return
	 */
	@RequestMapping(value="/myWork/pendingorder",method = RequestMethod.GET)
	public String pendingOrder() {
		return "bank/myWork/pendingOrder";
	}
	
	/**
	 * 在办理
	 * @return
	 */
	@RequestMapping(value="/myWork/transact",method = RequestMethod.GET)
	public String transact() {
		return "bank/myWork/transact";
	}
	
	/**
	 * 已完结
	 * @return
	 */
	@RequestMapping(value="/myWork/finish",method = RequestMethod.GET)
	public String finish() {
		return "bank/myWork/finish";
	}
	
	/**
	 * 待完结
	 * @return
	 */
	@RequestMapping(value="/myWork/willFinish",method = RequestMethod.GET)
	public String willFinish() {
		return "bank/myWork/willFinish";
	}
	
	/**
	 * 工作流入口
	 * @return
	 */
	@RequestMapping(value="/myWork/entryProcess",method = RequestMethod.GET)
	public String entryProcess() {
		return "bank/myWork/entryProcess";
	}
	
	/**
	 * 历史
	 * @return
	 */
	@RequestMapping(value="/history",method = RequestMethod.GET)
	public String history() {
		return "main/history";
	}

	/**
	 * 状态查询
	 * @return
	 */
	@RequestMapping(value="/query/query",method = RequestMethod.GET)
	public String query() {
		return "bank/query/query";
	}
	
	/**
	 * 状态详情
	 * @return
	 */
	@RequestMapping(value="/query/queryInfo",method = RequestMethod.GET)
	public String queryInfo() {
		return "bank/query/queryInfo";
	}
	
	
	/**
	 * 导出
	 * @return
	 */
	@RequestMapping(value="/export/export",method = RequestMethod.GET)
	public String exportInfo() {
		return "bank/export/export";
	}
	
	/**
	 * 导入
	 * @return
	 */
	@RequestMapping(value="/import/import",method = RequestMethod.GET)
	public String importInfo() {
		return "bank/myWork/receive";
	}
	
	/**
	 * 人工分派
	 * @return
	 */
	@RequestMapping(value="/artificial",method = RequestMethod.GET)
	public String artificial() {
		return "bank/myWork/receive";
	}
	
	/**
	 * 人工录入
	 * @return
	 */
	@RequestMapping(value="/artificial/apply",method = RequestMethod.GET)
	public String applay() {
		return "bank/artificial/apply";
	}
	
	/**
	 * 统计
	 * @return
	 */
	@RequestMapping(value="/query/statistics",method = RequestMethod.GET)
	public String statistics() {
		return "bank/query/statistics";
	}
	
	/**
	 * 业务流程管理
	 * @return
	 */
	@RequestMapping(value="/background/businessProcessManagement",method = RequestMethod.GET)
	public String businessProcessManagement() {
		return "background/businessProcessManagement";
	}
	
	/**
	 * 监管科审批
	 * @return
	 */
	@RequestMapping(value="/specialJianGuan/specialApply",method = RequestMethod.GET)
	public String specialApply() {
		return "bank/specialJianGuan/specialApply";
	}
	
	/**
	 * 监管科列表
	 * @return
	 */
	@RequestMapping(value="/specialJianGuan/specialList",method = RequestMethod.GET)
	public String specialList() {
		return "bank/specialJianGuan/specialList";
	}
	
	/**
	 * 监管科待办列表
	 * @return
	 */
	@RequestMapping(value="/specialJianGuan/specialPendingorder",method = RequestMethod.GET)
	public String specialPendingorder() {
		return "bank/specialJianGuan/specialPendingorder";
	}
	
	/**
	 * 监管科在办列表
	 * @return
	 */
	@RequestMapping(value="/specialJianGuan/specialTransact",method = RequestMethod.GET)
	public String specialTransact() {
		return "bank/specialJianGuan/specialTransact";
	}
	
	/**
	 * 监管科已办结列表
	 * @return
	 */
	@RequestMapping(value="/specialJianGuan/specialFinish",method = RequestMethod.GET)
	public String specialFinish() {
		return "bank/specialJianGuan/specialFinish";
	}
	
	/**
	 * 监管科审批
	 * @return
	 */
	@RequestMapping(value="/specialJianGuan/specialApproval",method = RequestMethod.GET)
	public String specialApproval() {
		return "bank/specialJianGuan/specialApproval";
	}
	
	/**
	 * 监管科查询
	 * @return
	 */
	@RequestMapping(value="/specialJianGuan/specialQuery",method = RequestMethod.GET)
	public String specialQuery() {
		return "bank/specialJianGuan/specialQuery";
	}
}
