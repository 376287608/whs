package com.ufgov.whs.system.dict.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.shiro.authz.annotation.RequiresPermissions;
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
import com.ufgov.whs.system.dict.bean.SysDict;
import com.ufgov.whs.system.dict.service.DictService;
import com.ufgov.whs.system.user.bean.SysUser;

/**
 * 字典controller
 * @author fucj
 * @date 2015年1月13日
 */
@Controller
@RequestMapping("system/dict")
public class DictController extends BaseController{
	public static final String PAGESIZE = "10";

    public static final String DEFAULTPAGE = "10";
	
	@Autowired
	private DictService dictService;
	
	/**
	 * 默认页面
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String list() {
		return "system/dictList";
	}

	/**
	 * 获取字典json
	 */
	@RequiresPermissions("sys:dict:view")
	@RequestMapping(value="json",method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> dictList(@RequestParam(value = "page", defaultValue = DEFAULTPAGE) int pageNumber,
            @RequestParam(value = "pageSize", defaultValue = PAGESIZE) int pageSize,
            @RequestParam(value = "sortType", defaultValue = "auto") String sortType,
            @RequestParam(value = "sortField", defaultValue = "auto") String sortField,
            Model model, ServletRequest request, HttpSession session) throws Exception {
		Page<SysDict> page = null;
		PageRequest pageRequest = buildPageRequest(pageNumber, pageSize,sortType,sortField);
		 try {
	        	page = dictService.getFindAll(pageRequest);
	        	return getEasyUIData(page);
	            //return page;
	        } catch (Exception e) {
	        	//logger.error("工作日历设置维护分页出错!", e);
	        	throw new Exception("字典维护分页失败");
	        }		
	}
	
	/**
	 * 添加字典跳转
	 * 
	 * @param model
	 */
	@RequiresPermissions("sys:dict:add")
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("dict", new SysDict());
		model.addAttribute("action", "create");
		return "system/dictForm";
	}

	/**
	 * 添加字典
	 * 
	 * @param dict
	 * @param model
	 */
	@RequiresPermissions("sys:dict:add")
	@RequestMapping(value = "create", method = RequestMethod.POST,produces="text/html")
	@ResponseBody
	public String create(@Valid SysDict dict, Model model) {
		dictService.save(dict);
		return "success";
	}

	/**
	 * 修改字典跳转
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequiresPermissions("sys:dict:update")
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Integer id, Model model) {
		model.addAttribute("dict", dictService.get(id));
		model.addAttribute("action", "update");
		return "system/dictForm";
	}

	/**
	 * 修改字典
	 * 
	 * @param dict
	 * @param model
	 * @return
	 */
	@RequiresPermissions("sys:dict:update")
	@RequestMapping(value = "update", method = RequestMethod.POST,produces="text/html")
	@ResponseBody
	public String update(@Valid @ModelAttribute @RequestBody SysDict dict,Model model) {
		//dictService.update(dict);
		return "success";
	}

	/**
	 * 删除字典
	 * 
	 * @param id
	 * @return
	 */
	@RequiresPermissions("sys:dict:delete")
	@RequestMapping(value = "delete/{id}",produces="text/html")
	@ResponseBody
	public String delete(@PathVariable("id") Integer id) {
		dictService.delete(id);
		return "success";
	}
	
	@ModelAttribute
	public void getDict(@RequestParam(value = "id", defaultValue = "-1") Integer id,Model model) {
		if (id != -1) {
			model.addAttribute("dict", dictService.get(id));
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
