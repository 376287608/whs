package com.ufgov.whs.business.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ufgov.whs.business.bean.BuBusiness;
import com.ufgov.whs.business.bean.BuGuides;
import com.ufgov.whs.business.dao.BusinessDao;
import com.ufgov.whs.common.pagination.impl.IPaginationImpl;
import com.ufgov.whs.system.user.bean.SysUser;

/**
 * 业务类型service
 * @author xlli
 * @date 2017-10-12
 */
@Service
@Transactional(readOnly = true)
public class BuBusinessService{
	
	@Autowired
	private IPaginationImpl ipaginationservice;
	
	@Autowired
	private BusinessDao businessDao ;
	
	/**
	 * 创建分页请求对象
	 * @param pageNumber 当前页码
	 * @param pagzSize 显示条数
	 * @param sortType 排序类型
	 * @param sortField 排序字段
	 * @return
	 */
	public PageRequest buildPageRequest(int pageNumber, int pagzSize,
	           String sortType,String sortField) {
	       Sort sort = null;
	       List<String> orders=new ArrayList<String>();
	       orders.add(sortField);
	       if ("desc".equalsIgnoreCase(sortType)) {
	       		sort = new Sort(Direction.DESC, orders);
	       }else{
	   		sort = new Sort(Direction.ASC, orders);
	       }
	       return new PageRequest(pageNumber - 1, pagzSize, sort);
	   }

	/**
	 * 获取分页数据 包括记录和条数
	 * @param pageRequest
	 * @param clazz
	 * @param businessName
	 * @param startDate
	 * @param endDate
	 * @param isPublish
	 * @return
	 * @throws Exception
	 */
	public PageImpl getFindAll(PageRequest pageRequest,Class clazz,
			String businessName,String startDate,String endDate,String isPublish ) throws Exception {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder();
		sql.append("select * from bu_business where del_flag = '1' and end_node = '0'");
		//0非发布列表 1 发布列表 （非发布列表要显示已发布的业务类型）
		if(isPublish.equals("0")){
			sql.append(" and is_public = '1' ");
		}
		//业务名称
		if(!isEmpty(businessName)){
			sql.append(" and business_name like '%"+businessName+"%'");
		}
		//提交时间
		if(!isEmpty(startDate) && !isEmpty(endDate)){
			sql.append(" and DATE_FORMAT(update_date,'%Y-%m-%d') >='"+startDate+"' and DATE_FORMAT(update_date,'%Y-%m-%d') <='"+endDate+"' ") ;
		}
	    return ipaginationservice.getPageImpl(sql.toString(), pageRequest, clazz);
	}

	/**
	 * 分页详情
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getPageInfo(Page<BuBusiness> page) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", page.getContent());
		map.put("totalPage", page.getTotalPages());
		return map;
	}
	
	/**
	 * 获取全部业务类型
	 * @return
	 */
	public List<BuBusiness> getAllBuBusiness() throws Exception{
		List<BuBusiness> findAll = businessDao.getAllBuBusiness();
		return findAll;
	}
	
	/**
	 * 根据id获取业务类型
	 * @param buBusinessId
	 * @return
	 */
	public BuBusiness getBuBusinessById(Integer buBusinessId){
		return businessDao.findOne(buBusinessId);
	}
	public String getBusinessNameById(Integer buBusinessId) throws Exception{
		return businessDao.getBusinessNameById(buBusinessId);
	}
	
	public BuBusiness getBuBusinessByBusinessNo(String businessNo){
		return businessDao.getBuBusinessByBusinessNo(businessNo);
	}
	
	/**
	 * 判断字符串是否为空
	 * @param str
	 * @return
	 */
	public boolean isEmpty(String str){
		if(str == null || str.trim().isEmpty()){
			return true ;
		}
		return false ;
	}

	/**
	 * 根据流程获取相关业务
	 * @param id
	 * @return
	 */
	public List<BuBusiness> getByProcessId(Integer processId) throws Exception {
		if(processId == null) return null ;
		return businessDao.getByProcessId(processId);
	}
	
	/**
	 * 获取所有的末级业务
	 * @return
	 * @throws Exception
	 */
	public List<BuBusiness> getAllEndNodeBusiness()throws Exception {
		return businessDao.getAllEndNodeBusiness();
	}
	
	/**
	 * 根据分页参数获取末级业务
	 * @param pageNumber 当前页数
	 * @param pageSize 每页条数
	 * @return
	 * @throws Exception
	 */
	public List<BuBusiness> getEndNodeBusiness(Integer pageNumber,Integer pageSize,Integer userId)throws Exception {
		if((pageNumber-1)<0 || pageSize<1) return null ;
		return businessDao.getEndNodeBusiness((pageNumber-1)*pageSize,pageSize,userId);
	}
}

