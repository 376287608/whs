package com.ufgov.whs.system.role.bean;

/**
 * 审批等级
 * @author xlli
 *
 */
public class VApprovalLevel {
	
	/**
	 * 等级
	 */
	private Integer level ;
	
	/**
	 * 等级名称
	 */
	private String levelName ;
	
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public String getLevelName() {
		return levelName;
	}
	public void setLevelName(String levelName) {
		this.levelName = levelName;
	}
}
