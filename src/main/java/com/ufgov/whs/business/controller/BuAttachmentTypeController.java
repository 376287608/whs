package com.ufgov.whs.business.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ufgov.whs.business.bean.BuAttachmentType;
import com.ufgov.whs.business.bean.BuBusiness;
import com.ufgov.whs.business.service.BuAttachmentTypeService;

/**
 * 业务类型附件controller
 * @author xlli
 * @date 2015年1月14日
 */
@Controller
@RequestMapping(value = "/buAttachmentType")
public class BuAttachmentTypeController{
	
	@Autowired
	private BuAttachmentTypeService buAttachmentTypeService ;
	
	/**
	 * 根据业务类型id查找附件
	 * @return
	 */
	@RequestMapping(value="getBuAttachmentType",method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody List<BuAttachmentType> getBuAttachmentTypeByBusinessId(Integer businessId) throws Exception {
		List<BuAttachmentType> attachmentList = buAttachmentTypeService.getBuAttachmentTypeByBusinessId(businessId); 
		return attachmentList ;
	}

}
