package com.ufgov.whs.system.user.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springside.modules.persistence.DynamicSpecifications;
import org.springside.modules.persistence.SearchFilter;

import com.ufgov.whs.attachment.bean.HasDoc;
import com.ufgov.whs.common.persistence.PropertyFilter;
import com.ufgov.whs.common.controller.BaseController;
import com.ufgov.whs.system.user.bean.SysUser;
import com.ufgov.whs.system.user.service.UserRoleService;
import com.ufgov.whs.system.user.service.UserService;

/**
 * 用户controller
 * @author fucj
 * @date 2015年1月13日
 */
@Controller
@RequestMapping("system/user")
public class UserController extends BaseController {
	public static final String PAGESIZE = "10";

    public static final String DEFAULTPAGE = "10";
    
	@Autowired
	private UserService userService;

	@Autowired
	private UserRoleService userRoleService;


	/**
	 * 默认页面
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list() {
		return "system/userList";
	}
	
	/**
	 * 修改密码页
	 */
	@RequestMapping(value = "updatePwd", method = RequestMethod.GET)
	public String updatePwdForm(Model model, HttpSession session) {
//		model.addAttribute("user", (SysUser) session.getAttribute("user"));
		return "system/pwd";
	}
	
	/**
	 * 检查原密码是否正确
	 * @param oldPassword
	 * @return
	 */
	@RequestMapping(value = "ajaxCheckPwd")
	@ResponseBody
	public Map<String,String> ajaxCheckPwd(String oldPwd) {
		//当前用户
		SysUser user = (SysUser) SecurityUtils.getSubject().getSession().getAttribute("user");
		//返回信息
		Map<String,String> map = new HashMap<String, String>();
		if (userService.checkPassword(user,oldPwd)) {
			map.put("message", "1,原密码正确") ;
		} else {
			map.put("message", "0,原密码错误") ;
		}
		return map ;
	}
	
	/**
	 * 修改密码
	 */
	@RequestMapping(value = "ajaxUpdatePwd", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,String> ajaxUpdatePwd(String oldpwd,String pwd,String repwd) {
		//返回信息
		Map<String,String> info = new HashMap<String, String>();
		if(isEmpty(oldpwd) || isEmpty(pwd) || isEmpty(repwd)){
			info.put("flag", "0") ;
			info.put("message", "密码为必填项");
			return info;
		}
		//密码格式校验
		if(!pwd.matches("^[a-zA-Z0-9]{6,14}$")){
			info.put("flag", "0") ;
			info.put("message", "密码必须为6~14位的字母或数字");
			return info;
		}
		//新密码确认
		if(!pwd.equals(repwd)){
			info.put("flag", "0") ;
			info.put("message", "新密码确认与新密码输入不一致");
			return info;
		}
		//当前用户
		Session session =SecurityUtils.getSubject().getSession();
		SysUser user = (SysUser)session.getAttribute("user");
		if(userService.checkPassword(user,oldpwd)){
			user.setPlainPassword(pwd);
			userService.updatePwd(user);
			info.put("flag", "1") ;
			info.put("userType", user.getUserType());
			info.put("message", "密码已修改，请重新登录");
			SecurityUtils.getSubject().logout();
			return info;
		}else{
			info.put("flag", "0") ;
			info.put("message", "原密码错误");
			return info;
		}
	}
	
	/**
	 * 判断字符串是否为空
	 * @param str
	 * @return
	 */
	public boolean isEmpty(String str){
		if(str == null || str.trim().equals("")){
			return true ;
		}
		return false ;
	}
	
	/**
	 * 获取用户json
	 */
	@RequiresPermissions("sys:user:view")
	@RequestMapping(value="json",method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getData(@RequestParam(value = "page", defaultValue = DEFAULTPAGE) int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGESIZE) int pageSize,
            @RequestParam(value = "sortType", defaultValue = "auto") String sortType,
            @RequestParam(value = "sortField", defaultValue = "auto") String sortField,
            Model model, ServletRequest request, HttpSession session) throws Exception {
		Page<SysUser> page = null;
		PageRequest pageRequest = buildPageRequest(pageNumber, pageSize,sortType,sortField);
		 try {
	        	page = userService.getFindAll(pageRequest);
	        	return getEasyUIData(page);
	            //return page;
	        } catch (Exception e) {
	        	//logger.error("工作日历设置维护分页出错!", e);
	        	throw new Exception("用户维护分页失败");
	        }		
	}

	/**
	 * 添加用户跳转
	 * 
	 * @param model
	 */
	@RequiresPermissions("sys:user:add")
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("user", new SysUser());
		model.addAttribute("action", "create");
		return "system/userForm";
	}

	/**
	 * 添加用户
	 * 
	 * @param user
	 * @param model
	 */
	@RequiresPermissions("sys:user:add")
	@RequestMapping(value = "create", method = RequestMethod.POST,produces="text/html")
	@ResponseBody
	public String create(@Valid SysUser user, Model model) {
		userService.save(user);
		return "success";
	}

	/**
	 * 修改用户跳转
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequiresPermissions("sys:user:update")
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Integer id, Model model) {
		model.addAttribute("user", userService.get(id));
		model.addAttribute("action", "update");
		return "system/userForm";
	}

	/**
	 * 修改用户
	 * 
	 * @param user
	 * @param model
	 * @return
	 */
	@RequiresPermissions("sys:user:update")
	@RequestMapping(value = "update", method = RequestMethod.POST,produces="text/html")
	@ResponseBody
	public String update(@Valid @ModelAttribute @RequestBody SysUser user,Model model) {
		userService.save(user);
		return "success";
	}

	/**
	 * 删除用户
	 * 
	 * @param id
	 * @return
	 */
	@RequiresPermissions("sys:user:delete")
	@RequestMapping(value = "delete/{id}",produces="text/html")
	@ResponseBody
	public String delete(@PathVariable("id") Integer id) {
		userService.delete(id);
		return "success";
	}

	/**
	 * 弹窗页-用户拥有的角色
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequiresPermissions("sys:user:roleView")
	@RequestMapping(value = "{userId}/userRole")
	public String getUserRole(@PathVariable("userId") Integer id, Model model) {
		model.addAttribute("userId", id);
		return "system/userRoleList";
	}
	/**
	 * 弹窗页-用户所在机构
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequiresPermissions("sys:user:orgView")
	@RequestMapping(value = "{userId}/userOrg")
	public String getUserOrg(@PathVariable("userId") Integer id, Model model) {
		model.addAttribute("userId", id);
		return "system/userOrgList";
	}

	/**
	 * 获取用户拥有的角色ID集合
	 * 
	 * @param id
	 * @return
	 */
	@RequiresPermissions("sys:user:roleView")
	@RequestMapping(value = "{id}/role")
	@ResponseBody
	public List<Integer> getRoleIdList(@PathVariable("id") Integer id) {
		return userRoleService.getRoleIdList(id);
	}


	/**
	 * 修改用户拥有的角色
	 * 
	 * @param id
	 * @param newRoleList
	 * @return
	 */
	@RequiresPermissions("sys:user:roleUpd")
	@RequestMapping(value = "{id}/updateRole",produces="text/html")
	@ResponseBody
	public String updateUserRole(@PathVariable("id") Integer id,@RequestBody List<Integer> newRoleList) {
		userRoleService.updateUserRole(id, userRoleService.getRoleIdList(id),newRoleList);
		return "success";
	}

	/**
	 * 修改密码
	 */
	@RequestMapping(value = "updatePwd", method = RequestMethod.POST,produces="text/html")
	@ResponseBody
	public String updatePwd(String oldPassword,@Valid @ModelAttribute @RequestBody SysUser user, HttpSession session) {
		if (userService.checkPassword((SysUser) session.getAttribute("user"),oldPassword)) {
			userService.updatePwd(user);
			session.setAttribute("user", user);
			return "success";
		} else {
			return "fail";
		}
	}

	/**
	 * Ajax请求校验loginName是否唯一。
	 */
	@RequestMapping(value = "checkLoginName", method = RequestMethod.POST)
	@ResponseBody
	public String checkLoginName(String loginName) {
		if (userService.getUser(loginName) == null) {
			return "true";
		} else {
			return "false";
		}
	}

	/**
	 * ajax请求校验原密码是否正确
	 * 
	 * @param oldPassword
	 * @param request
	 * @return
	 */
	@RequiresPermissions("sys:user:update")
	@RequestMapping(value = "checkPwd")
	@ResponseBody
	public String checkPwd(String oldPassword, HttpSession session) {
		if (userService.checkPassword((SysUser) session.getAttribute("user"),oldPassword)) {
			return "true";
		} else {
			return "false";
		}
	}
	
	/**
	 * 所有RequestMapping方法调用前的Model准备方法, 实现Struts2
	 * Preparable二次部分绑定的效果,先根据form的id从数据库查出Task对象,再把Form提交的内容绑定到该对象上。
	 * 因为仅update()方法的form中有id属性，因此仅在update时实际执行.
	 */
	@ModelAttribute
	public void getUser(@RequestParam(value = "id", defaultValue = "-1") Integer id,Model model) {
		if (id != -1) {
			model.addAttribute("user", userService.get(id));
		}
	}
   
	
	 /**
    * 创建分页请求.
    */
   private PageRequest buildPageRequest(int pageNumber, int pagzSize,
           String sortType,String sortField) {
       Sort sort = null;
       List<String> orders=new ArrayList<String>();
       if ("asc".equals(sortType)) {
       		orders.add(sortField);
       		orders.add("id");
       		sort = new Sort(Direction.ASC, orders);
       } else if ("desc".equals(sortType)) {
	        	orders.add(sortField);
	        	orders.add("id");
	            sort = new Sort(Direction.DESC, orders);
       }else{
   		orders.add("id");
   		sort = new Sort(Direction.ASC, orders);
       }
       return new PageRequest(pageNumber - 1, pagzSize, sort);
   }
   
}
