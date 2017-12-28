package com.ufgov.whs.system.role.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ufgov.whs.common.persistence.PropertyFilter;
import com.ufgov.whs.common.controller.BaseController;
import com.ufgov.whs.system.role.bean.SysRole;
import com.ufgov.whs.system.role.bean.VApprovalLevel;
import com.ufgov.whs.system.role.service.RolePermissionService;
import com.ufgov.whs.system.role.service.RoleService;
import com.ufgov.whs.system.user.bean.SysUser;


/**
 * 角色controller
 * @author fucj
 * @date 2015年1月13日
 */
@Controller
@RequestMapping("system/role")
public class RoleController extends BaseController{
	
	protected final Logger logger = LoggerFactory.getLogger(getClass());
	
	public static final String PAGESIZE = "10";

    public static final String DEFAULTPAGE = "10";
    
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private RolePermissionService rolePermissionService;
	
	/**
	 * 默认页面
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list(){
		return "system/roleList";
	}
	
	/**
	 * 角色集合(JSON)
	 * @throws Exception 
	 */
	@RequiresPermissions("sys:role:view")
	@RequestMapping(value="json",method = RequestMethod.GET)
	@ResponseBody
	public  Map<String, Object> getData(@RequestParam(value = "page", defaultValue = DEFAULTPAGE) int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGESIZE) int pageSize,
            @RequestParam(value = "sortType", defaultValue = "auto") String sortType,
            @RequestParam(value = "sortField", defaultValue = "auto") String sortField,
            Model model, ServletRequest request, HttpSession session) throws Exception {
		Page<SysRole> page = null;
		PageRequest pageRequest = buildPageRequest(pageNumber, pageSize,sortType,sortField);
        try {
        	page = roleService.getFindAll(pageRequest);
        	return getEasyUIData(page);
            //return page;
        } catch (Exception e) {
        	//logger.error("工作日历设置维护分页出错!", e);
        	throw new Exception("获取角色分页失败");
        }		
	}
	
	/**
	 * 获取角色拥有的权限ID集合
	 * @param id
	 * @return
	 */
	@RequiresPermissions("sys:role:permView")
	@RequestMapping("{id}/json")
	@ResponseBody
	public List<Integer> getRolePermissions(@PathVariable("id") Integer id){
		List<Integer> permissionIdList=rolePermissionService.getPermissionIds(id);
		return permissionIdList;
	}
	
	/**
	 * 修改角色权限
	 * @param id
	 * @param newRoleList
	 * @return
	 */
	@RequiresPermissions("sys:role:permUpd")
	@RequestMapping(value = "{id}/updatePermission")
	@ResponseBody
	public String updateRolePermission(@PathVariable("id") Integer id,@RequestBody List<Integer> newRoleIdList,HttpSession session){
		List<Integer> oldRoleIdList=rolePermissionService.getPermissionIds(id);
		
		//获取application中的sessions
		@SuppressWarnings("rawtypes")
		HashSet sessions=(HashSet) session.getServletContext().getAttribute("sessions");
		if (null!=sessions) {//当前如果有正在使用的用户，需要更新正在使用的用户的权限
			
			@SuppressWarnings("unchecked")
			Iterator<Session> iterator= sessions.iterator();
			PrincipalCollection pc=null;
			
			//遍历sessions
			while(iterator.hasNext()){
				HttpSession s=(HttpSession) iterator.next();
				SysUser user=(SysUser) s.getAttribute("user");
				if(user.getId()==id){
					pc= (PrincipalCollection) s.getAttribute(String.valueOf(id));
					//清空该用户权限缓存
					rolePermissionService.clearUserPermCache(pc);
					s.removeAttribute(String.valueOf(id));
					break;
				}
			}
		}
		
		rolePermissionService.updateRolePermission(id,oldRoleIdList ,newRoleIdList);
		
		return "success";
	}
	
	/**
	 * 添加角色跳转
	 * @param model
	 * @return
	 */
	@RequiresPermissions("sys:role:add")
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("role", new SysRole());
		model.addAttribute("action", "create");
		return "system/roleForm";
	}

	/**
	 * 添加角色
	 * @param role
	 * @param model
	 * @return
	 */
	@RequiresPermissions("sys:role:add")
	@RequestMapping(value = "create", method = RequestMethod.POST,produces="text/html")
	@ResponseBody
	public String create(@Valid SysRole role,Model model) {
		roleService.save(role);
		return "success";
	}

	/**
	 * 修改角色跳转
	 * @param id
	 * @param model
	 * @return
	 */
	@RequiresPermissions("sys:role:update")
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Integer id, Model model) {
		model.addAttribute("role", roleService.get(id));
		model.addAttribute("action", "update");
		return "system/roleForm";
	}

	/**
	 * 修改角色
	 * @param role
	 * @param model
	 * @return
	 */
	@RequiresPermissions("sys:role:update")
	@RequestMapping(value = "update", method = RequestMethod.POST,produces="text/html")
	@ResponseBody
	public String update(@Valid @ModelAttribute("role") SysRole role,Model model) {
		roleService.save(role);
		return "success";
	}

	/**
	 * 删除角色
	 * @param id
	 * @return
	 */
	@RequiresPermissions("sys:role:delete")
	@RequestMapping(value = "delete/{id}",produces="text/html")
	@ResponseBody
	public String delete(@PathVariable("id") Integer id) {
		roleService.delete(id);
		return "success";
	}
	
	@ModelAttribute
	public void getRole(@RequestParam(value = "id", defaultValue = "-1") Integer id, Model model) {
		if (id != -1) {
			model.addAttribute("role", roleService.get(id));
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
    
    /**
     * 根据用户查找此部门下所有可以审批的角色和可选审批层级
     * @return
     */
    @SuppressWarnings("finally")
	@RequestMapping(value = "/getApprovalLevel", method = {RequestMethod.POST,RequestMethod.GET})
    public @ResponseBody Map<String,Object> getApprovalLevel() {
    	//返回信息
		Map<String,Object> info = new HashMap<String, Object>();
		info.put("msg", "查询失败");
		info.put("success", "false");
		try {
			//当前用户
			SysUser user = (SysUser)SecurityUtils.getSubject().getSession().getAttribute("user");
			//查找此用户部门下所有角色
			List<SysRole> roles = roleService.getRoleByUserId(user.getId());
			List<VApprovalLevel> approvalLevels = roleService.getApprovalLevel(roles.size()) ;
			info.put("rows", approvalLevels);
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
     * 返回审核权限大于此角色的所有角色
     * @param id
     * @return
     * @throws Exception
     */
    @SuppressWarnings("finally")
	@RequestMapping(value="/getGtRole",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody Map<String,Object> getGtRole(Integer id) throws Exception{
    	//返回信息
		Map<String,Object> info = new HashMap<String, Object>();
		info.put("msg", "查询失败");
		info.put("success", "false");
		try {
			//当前用户
			SysUser user = (SysUser)SecurityUtils.getSubject().getSession().getAttribute("user");
			List<SysRole> roles = roleService.getGtRoleByRoleId(user.getId(),id);
			info.put("rows", roles);
			info.put("msg", "查询成功");
			info.put("success", "true");
		} catch (Exception e) {
			logger.error("查询失败！"+e.getMessage(), e);
			throw new Exception("查询失败！"+e.getMessage(),e);
		}finally{
			return info ;
		}
	}
    

}
