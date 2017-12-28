package com.ufgov.whs.system.utils;


import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * 扩展添加用户类型-继承用户验证类
 * @author fucj
 * @date 2014年12月2日 下午10:45:57
 */
public class UsernamePasswordCaptchaToken extends UsernamePasswordToken {

	private static final long serialVersionUID = 1L;
	
	private String userType;
	
	/**
	 * 登录时地址
	 */
	private String loginPath ;

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}
	
	public UsernamePasswordCaptchaToken() {
		super();
	}
	
	public String getLoginPath() {
		return loginPath;
	}

	public void setLoginPath(String loginPath) {
		this.loginPath = loginPath;
	}

	public UsernamePasswordCaptchaToken(String username, char[] password,boolean rememberMe, String host, String userType,String loginPath) {
		super(username, password, rememberMe, host);
		this.userType = userType;
		this.loginPath = loginPath ;
	}

}