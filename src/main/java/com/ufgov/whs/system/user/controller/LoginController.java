package com.ufgov.whs.system.user.controller;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ufgov.whs.common.utils.Global;
import com.ufgov.whs.system.user.bean.SysUser;

/**
 * 登录controller
 * @author fucj
 * @date 2015年1月14日
 */
@Controller
@RequestMapping(value = "{adminPath}")
public class LoginController{
	
	/**
	 * 默认页面
	 * @return
	 */
	@RequestMapping(value="/login",method = RequestMethod.GET)
	public String login(Model model) {
		Subject subject = SecurityUtils.getSubject();
		SysUser user = (SysUser)subject.getSession().getAttribute("user");
		String loginPath = (String)subject.getSession().getAttribute("loginPath");
		if(user != null){
			//如果用户类型和登陆类型不一致 则直接注销 重新登录
			if(!user.getUserType().equals("1")){
				SecurityUtils.getSubject().logout();
				if(!StringUtils.isBlank(loginPath) && (loginPath.indexOf("bank") != -1)){
					model.addAttribute("loginError", "用户名不存在，请重试");
				}
				return "system/loginBank";
			}else{
				return "main/index";
			}
		}
		if(subject.isAuthenticated()||subject.isRemembered()){
			return "main/index";
		} 
		return "system/loginBank";
	}

	/**
	 * 登录失败
	 * @param userName
	 * @param model
	 * @return
	 */
	@RequestMapping(value="login",method = RequestMethod.POST)
	public String fail(@RequestParam(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM) String userName, Model model) {
		model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, userName);
		return "system/loginBank";
	}

	/**
	 * 登出
	 * @param userName
	 * @param model
	 * @return
	 */
	@RequestMapping(value="logout")
	public String logout(Model model) {
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		return "system/loginBank";
	}

}
