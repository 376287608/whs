package com.ufgov.whs.system.web;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ufgov.whs.company.bean.CompanyList;
import com.ufgov.whs.company.bean.CompanyUser;
import com.ufgov.whs.company.bean.CompanyUserAttachment;
import com.ufgov.whs.company.service.CompanyListService;
import com.ufgov.whs.company.service.CompanyUserAttachmentService;
import com.ufgov.whs.company.service.CompanyUserService;
import com.ufgov.whs.system.dict.bean.SysDict;
import com.ufgov.whs.system.dict.service.DictService;
import com.ufgov.whs.system.user.bean.SysUser;
import com.ufgov.whs.system.user.bean.SysUserRole;
import com.ufgov.whs.system.user.service.UserRoleService;
import com.ufgov.whs.system.user.service.UserService;


/**
 * 企业controller
 * @author fucj
 * @date 2017年10月26日
 */
@Controller
@RequestMapping(value = "/system")
public class SystemController{
	
	@Autowired
	private DictService dictService ;
	
	@Autowired
	private UserService userService ;
	
	@Autowired
	private CompanyUserService companyService ;
	
	@Autowired
	private CompanyListService companyListService ;
	
	@Autowired
	private CompanyUserAttachmentService companyUserAttachmentService ;
	
	@Autowired
	private UserRoleService userRoleService ;
	
	/**
	 * 用户注册页面
	 * @return
	 */
	@RequestMapping(value="sign",method = RequestMethod.GET)
	public String login(Model model) {
		//证件类型
		List<SysDict> dictList = dictService.getSysDictByType("credentials");
		model.addAttribute("dictList", dictList);
		return "system/sign";
	}

	
	/**
	 * 企业同意页面
	 * @return
	 */
	@RequestMapping(value="/agreement",method = RequestMethod.GET)
	public String agreement() {
		return "system/agreement";
	}
	
	/**
	 * 查看组织机构代码是否可以注册
	 * @param orgBarcode
	 * @return
	 */
	@RequestMapping(value = "checkOrgBarcode",method = RequestMethod.POST)
	public @ResponseBody Map<String,String> checkOrgBarcode(String orgBarcode) {
		Map<String,String> map = new HashMap<String, String>();
		//查看企业是否已经注册
		if(isRegister(orgBarcode)){
			map.put("message", "0,企业已经注册") ;
		//查看企业是否在企业录
		}else if(getCompanyByOrgBarcode(orgBarcode) == null){
			map.put("message", "0,贵企业不属于外汇局中关村中心支局业务受理范围内，请到北京外汇管理部办理相关业务") ;
		}else{
			map.put("message", "1,未注册") ;
		}
		return map;
			
	}
	
	/**
	 * 查看组织机构代码是否已经注册
	 * @param orgBarcode
	 * @return
	 */
	public Boolean isRegister(String orgBarcode) {
		if (userService.getUser(orgBarcode) == null) {
			return false;
		} else {
			return true;
		}
	}
	
	/**
	 * 根据组织机构代码查找企业
	 * @param orgBarcode
	 * @return
	 */
	public CompanyList getCompanyByOrgBarcode(String orgBarcode) {
		return companyListService.getCompanyByLegalCode(orgBarcode);
	}
	
	/**
	 * 注册企业用户
	 * @param userName
	 * @param model
	 * @return
	 */
	@RequestMapping(value="registerCompany",method = RequestMethod.POST)
	public @ResponseBody Map<String,String> registerCompany(SysUser user,CompanyUser company,CompanyUserAttachment companyUserAttachment ,String password,String repwd,
			String registerName,String phone,String email,String credentialsType,String credentialNumber,String companyName,
			String orgBarcode,String certificateCode,String docId,String docName) {

		//返回信息
		Map<String,String> info = new HashMap<String, String>();
		/** ----------------------校验开始----------------------------------*/ 
		if(null == user || null == company){
			info.put("flag", "0") ;
			info.put("message", "信息不能为空");
			return info;
		}
		if(isEmpty(password) || isEmpty(repwd) || isEmpty(registerName) || isEmpty(phone) || isEmpty(email) || isEmpty(credentialsType) 
				|| isEmpty(credentialNumber) || isEmpty(companyName)){
			info.put("flag", "0") ;
			info.put("message", "信息填写有误，请检查录入数据是否正确");
			return info;
		}
		if(isEmpty(docId) || isEmpty(docName)){
			info.put("flag", "0") ;
			info.put("message", "附件不能为空");
			return info;
		}
		if(isEmpty(orgBarcode) && isEmpty(certificateCode)){
			info.put("flag", "0") ;
			info.put("message", "组织机构代码和统一社会信用代码不能都为空");
			return info;
		}
		//密码格式校验
		if(!password.matches("^[a-zA-Z0-9]{6,14}$")){
			info.put("flag", "0") ;
			info.put("message", "密码填写有误，请检查录入数据是否正确");
			return info;
		}
		if(!password.equals(repwd)){
			info.put("flag", "0") ;
			info.put("message", "密码填写有误，请检查录入数据是否正确");
			return info;
		}
		//电话校验
		if(phone.length() > 11){
			info.put("flag", "0") ;
			info.put("message", "联系电话填写有误，请检查录入数据是否正确");
			return info;
		}
		//组织机构代码为9位
		if(!isEmpty(orgBarcode) && orgBarcode.trim().length() != 9){
			info.put("flag", "0") ;
			info.put("message", "组织机构代码填写有误，请检查录入数据是否正确");
			return info;
		}
		//统一社会信用代码为18位
		if(!isEmpty(certificateCode) && certificateCode.trim().length() != 18){
			info.put("flag", "0") ;
			info.put("message", "统一社会信用代码填写有误，请检查录入数据是否正确");
			return info;
		}
		//如果组织机构代码为空 则从统一社会信用代码中提取
		if(isEmpty(orgBarcode)){
			orgBarcode = certificateCode.substring(8, 17);
		}
		//查看组织机构代码是否合法
		//已经注册
		if(isRegister(orgBarcode)){
			info.put("flag", "0") ;
			info.put("message", "企业已经注册");
			return info;
		}
		//没有在企业名录
		if(getCompanyByOrgBarcode(orgBarcode) == null){
			info.put("flag", "0") ;
			info.put("message", "贵企业不属于外汇局中关村中心支局业务受理范围内，请到北京外汇管理部办理相关业务");
			return info;
		}
		/**--------------------------校验结束----------------------*/
		
		//用户的登录名为组织机构代码
		user.setLoginName(orgBarcode);
		user.setPlainPassword(password);
		//保存标识
		boolean flag = false ;
		//保存用户
		flag = userService.save(user);
		//用户保存成功  则保存企业信息
		if(flag){
			//保存企业信息
			flag = companyService.save(user.getId(),company,true);
		}
		//保存企业信息成功 则保存附件信息
		if(flag){
			//保存附件信息
			flag = companyUserAttachmentService.save(user.getId(),companyUserAttachment);
		}
		SysUserRole sysUserRole = new SysUserRole();
		sysUserRole.setUserId(user.getId());
		sysUserRole.setRoleId(1);
		sysUserRole.setCreateDate(new Date());
		userRoleService.save(sysUserRole);
		if(flag){
			info.put("flag", "1") ;
			info.put("message", "注册成功");
		}else{
			info.put("flag", "0") ;
			info.put("message", "注册失败");
		}
		
		return info;
	}
	
	/**
	 * 判断字符串是否为空
	 * @param str
	 * @return
	 */
	public boolean isEmpty(String str){
		if(str == null || str.trim() == ""){
			return true ;
		}
		return false ;
	}
	
	
}
