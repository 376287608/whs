package com.ufgov.whs.system.resource.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ufgov.whs.business.service.BusinessService;
import com.ufgov.whs.common.controller.BaseController;
import com.ufgov.whs.system.resource.bean.SysResource;
import com.ufgov.whs.system.resource.service.ResourceService;
import com.ufgov.whs.system.role.service.RolePermissionService;
import com.ufgov.whs.system.utils.UserUtil;

/**
 * 权限controller
 * @author fucj
 * @date 2015年1月13日
 */
@Controller
@RequestMapping("system/resource")
public class ResourceController extends BaseController{
	protected final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private ResourceService resourceService;
	
	@Autowired
	private RolePermissionService rolePermissionService;
	
	@Autowired
	private BusinessService businessService;
	
	/**
	 * 默认页面
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list(){
		return "system/permissionList";
	}
	
	/**
	 * 菜单页面
	 */
	@RequestMapping(value="menu",method = RequestMethod.GET)
	public String menuList(){
		return "system/menuList";
	}
	
	/**
	 * 菜单集合(JSON)
	 * @throws Exception 
	 */
	@RequiresPermissions("sys:perm:menu:view")
	@RequestMapping(value="menu/json",method = RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> menuDate() throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "查询菜单失败");
		map.put("success", "false");
		try{
			List<SysResource> permissionList=resourceService.getMenus();	
			map.put("user", permissionList);
			map.put("msg", "查询菜单成功");
			map.put("success", "true");
		}catch(Exception e){
			logger.error("查询菜单失败！"+e.getMessage(), e);
			throw new Exception("查询菜单失败！"+e.getMessage(),e);
		}
		return map;
	}
	
	/**
	 * 权限集合(JSON)
	 */
	@RequiresPermissions("sys:perm:view")
	@RequestMapping(value="json",method = RequestMethod.GET)
	@ResponseBody
	public List<SysResource> getData() {
		List<SysResource> permissionList=resourceService.getAll();
		return permissionList;
	}
	
	/**
	 * 获取菜单下的操作
	 */
	@RequiresPermissions("sys:perm:view")
	@RequestMapping("ope/json")
	@ResponseBody
	public Map<String, Object> menuOperationDate(Integer pid){
		List<SysResource> menuOperList=resourceService.getMenuOperation(pid);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", menuOperList);
		map.put("total",menuOperList.size());
		return map;
	}
	
	/**
	 * 当前登录用户的权限集合
	 */
	@RequestMapping("i/json")
	@ResponseBody
	public Map<String, Object> myPermissionDate() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<SysResource> permissionList=resourceService.getPermissions(UserUtil.getCurrentUser().getId());
		//List<SysResource> permissionList=resourceService.getPermissions(3);
		map.put("rows",permissionList);
		map.put("msg", "查询成功");
		map.put("success", "true");
		if(UserUtil.getCurrentUser()!=null){
			map.put("user",UserUtil.getCurrentLoginUser());
			map.put("bankUser", UserUtil.getCurrentBankUser());
			map.put("companyUser", UserUtil.getCurrentCompanyUser());
			map.put("type",UserUtil.getCurrentUser().getUserType());	
		}else
			map.put("type",0);		
		return map;
	}
	
	/**
	 * 某用户的权限集合
	 */
	@RequiresPermissions("sys:perm:view")
	@RequestMapping("{userId}/json")
	@ResponseBody
	public List<SysResource> otherPermissionDate(@PathVariable("userId") Integer userId) {
		List<SysResource> permissionList=resourceService.getPermissions(userId);
		return permissionList;
	}
	
	/**
	 * 添加权限跳转
	 */
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("permission", new SysResource());
		model.addAttribute("action", "create");
		return "system/permissionForm";
	}
	
	/**
	 * 添加菜单跳转
	 */
	@RequestMapping(value = "menu/create", method = RequestMethod.GET)
	public String menuCreateForm(Model model) {
		model.addAttribute("permission", new SysResource());
		model.addAttribute("action", "create");
		return "system/menuForm";
	}

	/**
	 * 添加权限/菜单
	 */
	@RequiresPermissions("sys:perm:add")
	@RequestMapping(value = "create", method = RequestMethod.POST,produces="text/html")
	@ResponseBody
	public String create(@Valid SysResource permission,Model model) {
		resourceService.save(permission);
		return "success";
	}
	
	/**
	 * 添加菜单基础操作
	 * @param pid
	 * @return
	 */
	@RequiresPermissions("sys:perm:add")
	@RequestMapping(value = "createBase/{pname}/{pid}", method = RequestMethod.GET,produces="text/html")
	@ResponseBody
	public String create(@PathVariable("pname") String pname,@PathVariable("pid") Integer pid){
		resourceService.addBaseOpe(pid, pname);
		return "success";
	}

	/**
	 * 修改权限跳转
	 */
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Integer id, Model model) {
		model.addAttribute("permission", resourceService.get(id));
		model.addAttribute("action", "update");
		return "system/permissionForm";
	}
	
	/**
	 * 修改菜单跳转
	 */
	@RequestMapping(value = "menu/update/{id}", method = RequestMethod.GET)
	public String updateMenuForm(@PathVariable("id") Integer id, Model model) {
		model.addAttribute("permission", resourceService.get(id));
		model.addAttribute("action", "update");
		return "system/menuForm";
	}

	/**
	 * 修改权限/菜单
	 */
	@RequiresPermissions("sys:perm:update")
	@RequestMapping(value = "update", method = RequestMethod.POST,produces="text/html")
	@ResponseBody
	public String update(@Valid @ModelAttribute("permission") SysResource permission,Model model) {
		resourceService.save(permission);
		return "success";
	}

	/**
	 * 删除权限
	 */
	@RequiresPermissions("sys:perm:delete")
	@RequestMapping(value = "delete/{id}",produces="text/html")
	@ResponseBody
	public String delete(@PathVariable("id") Integer id) {
		resourceService.delete(id);
		return "success";
	}
	
	@ModelAttribute
	public void getPermission(@RequestParam(value = "id", defaultValue = "-1") Integer id, Model model) {
		if (id != -1) {
			model.addAttribute("permission", resourceService.get(id));
		}
	}
	
	/**
	 * 当前登录用户的权限集合
	 */
	@RequestMapping(value = "button/json", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getOperateButtons(
			@RequestParam(value = "formId") String formId) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<SysResource> permissionList=resourceService.getOperateButtons(UserUtil.getCurrentUser().getId(),formId);
		//List<SysResource> permissionList=resourceService.getPermissions(3);
		map.put("rows",permissionList);
		map.put("msg", "查询成功");
		map.put("success", "true");
		return map;
	}
	
	/**
	 * 监测分析科按钮集合
	 */
	@RequestMapping(value = "specialJianGuan/button", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getSpecialJianGuanOperateButtons(
			@RequestParam(value = "formId") String formId) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<SysResource> permissionList=resourceService.getSpecialJianGuanOperateButtons(UserUtil.getCurrentUser().getId(),formId);
		//List<SysResource> permissionList=resourceService.getPermissions(3);
		map.put("rows",permissionList);
		map.put("msg", "查询成功");
		map.put("success", "true");
		return map;
	}
}
