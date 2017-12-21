package com.ufgov.whs.system.utils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;

import com.ufgov.whs.system.user.bean.SysUser;


/**
 * 扩展认证默认过滤
 * @author fucj
 * @date 2014年12月2日 下午10:47:09
 */
public class FormAuthenticationCaptchaFilter extends FormAuthenticationFilter {

	public static final String DEFAULT_CAPTCHA_PARAM = "captcha";
	private String captchaParam = DEFAULT_CAPTCHA_PARAM;
	public static final String DEFAULT_USER_TYPE = "1"; //默认企业用户
	private String userType = DEFAULT_USER_TYPE;

	public String getCaptchaParam() {
		return captchaParam;
	}
	
	public String getUserType() {
		return userType;
	}
	
	protected String getUserType(ServletRequest request) {
		return WebUtils.getCleanParam(request, getCaptchaParam());
	}

	protected String getCaptcha(ServletRequest request) {
		return WebUtils.getCleanParam(request, getCaptchaParam());
	}

	protected AuthenticationToken createToken(ServletRequest request, ServletResponse response) {
		String username = getUsername(request);
		String password = getPassword(request);
		String userType = getUserType(request);
		boolean rememberMe = isRememberMe(request);
		String host = getHost(request);
		String loginPath = ((HttpServletRequest)request).getRequestURI();
		return new UsernamePasswordCaptchaToken(username,password.toCharArray(), rememberMe, host,userType,loginPath);
	}

	/**
	 * 登录失败调用事件
	 */
	@Override
	protected boolean onLoginFailure(AuthenticationToken token,
			AuthenticationException e, ServletRequest request, ServletResponse response) {
		String className = e.getClass().getName(), message = "";
		if (IncorrectCredentialsException.class.getName().equals(className)
				|| UnknownAccountException.class.getName().equals(className)){
			message = "用户或密码错误, 请重试.";
		}
		//else if (e.getMessage() != null && StringUtils.startsWith(e.getMessage(), "msg:")){
		//	message = StringUtils.replace(e.getMessage(), "msg:", "");
		//}
		else{
			message = "系统出现点问题，请稍后再试！";
			e.printStackTrace(); // 输出到控制台
		}
        request.setAttribute(getFailureKeyAttribute(), className);
        return true;
	}
	
	public String getUsertype(ServletRequest request){
		return request.getParameter("userType");
	}
	
	/**
	 * 登陆成功之后跳转到首页
	 */
	@Override
	protected boolean onLoginSuccess(AuthenticationToken token, Subject subject,ServletRequest request, 
			ServletResponse response) throws Exception {
		String requestUrl = ((HttpServletRequest)request).getRequestURI();
		String newUrl = "/company/login";
		if(requestUrl.indexOf("bank") != -1){
			newUrl = "/bank/login";
		}
		//清除原来的地址
		WebUtils.getAndClearSavedRequest(request);
		WebUtils.redirectToSavedRequest(request, response, newUrl);
		return false;
	}
	
	/**
	 * 重写 isAccessAllowed
	 * 解决同一个浏览器两个窗口 第一个窗口登陆之后 不刷新另一个窗口不能登陆的问题
	 */
	@Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue){
        if (isLoginRequest(request, response)){
            if (isLoginSubmission(request, response)){
                //本次用户登陆账号
                String account = this.getUsername(request);
                Subject subject = this.getSubject(request, response);
                //之前登陆的用户
                SysUser user = (SysUser) subject.getSession().getAttribute("user");
                //如果两次登陆的用户不一样，则先退出之前登陆的用户
                if (account != null && user != null && !account.equals(user.getLoginName())){
                    subject.logout();
                }
            }
        }

        return super.isAccessAllowed(request, response, mappedValue);
    }
}