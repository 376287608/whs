package com.ufgov.whs.system.utils;

/**
 * 系统常量
 * 
 * @author fucj
 *
 */
public class StatuConstant {
	/**
	 * 企业用户操作
	 */
	public static final String FORMSTATU_SAVE = "待提交";  
	
	public static final String FORMSTATU_SUBMIT  = "待接收"; 	
	
	public static final String FORMSTATU_RECALL  = "待终止";
	
	public static final String FORMSTATU_YBZ  = "已补正";
	/**
	 * 银行用户操作
	 */
	public static final String FORMSTATU_RETURN = "被退回";  
	
	public static final String FORMSTATU_RECEIVE = "办理中"; 
	
	public static final String REPORTSTATU_DSL = "待受理";
	
	public static final String REPORTSTATU_CLZ  = "处理中"; 
	
	public static final String FORMSTATU_ADDITION  = "办理中(补正)";
	
	public static final String REPORTSTATU_DBZ  = "待补正"; 
	
	public static final String REPORTSTATU_DSP  = "待审批"; 
		
	public static final String REPORTSTATU_SPZ  = "审批中"; 
	
	public static final String FORMSTATU_FINISH  = "已办结"; 
	
	public static final String REPORTSTATU_YBJ  = "已办结"; 
    
	public static final String FORMSTATU_YCX  = "已撤销"; 
	
	public static final String REPORTSTATU_YCX  = "已撤销"; 
	
	public static final String REPORTSTATU_YZZ  = "已终止"; 
	
	public static final String REPORTSTATU_YBC  = "已保存"; //监测分析科专用 
	
	/**
	 *办结标志  0未办结 1已办结
	 */
	public static final String FINISHSTATU_YBJ  = "1"; 
	public static final String FINISHSTATU_WBJ  = "0"; 
}
