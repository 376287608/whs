package com.ufgov.whs.law.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ufgov.whs.business.bean.BuGuides;
import com.ufgov.whs.business.bean.BuLaws;
import com.ufgov.whs.common.pagination.impl.IPaginationImpl;
import com.ufgov.whs.law.bean.Laws;
import com.ufgov.whs.law.dao.LawsDao;
import com.ufgov.whs.system.user.bean.SysUser;

/**
 * 法律法规service
 * @author xlli
 * @date 2017-10-12
 */
@Service
@Transactional(readOnly = true)
public class LawsService{
	
	@Autowired
	private LawsDao lawsDao;
	
	@Autowired
	private IPaginationImpl ipaginationservice;
	
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
	 * @param user
	 * @param buLawsList
	 * @param lawsName
	 * @param startDate
	 * @param endDate
	 * @param isPublish 是否发布列表
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	public PageImpl getFindAll(PageRequest pageRequest,Class clazz,SysUser user,List<BuLaws> buLawsList,
			String lawsName,String startDate,String endDate,boolean isNotPublish) throws Exception {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder();
		sql.append("select * from laws where del_flag = '1' ");
		//不是发布列表 则显示此用户类型可查看的并且已发布的数据
		if(isNotPublish){
			sql.append(" and is_public = '1' ");
			//type 0 为企业1为银行 2为公共
			sql.append(" and (type = '2' ");
			//用户类型
			if(user != null){
				sql.append(" or type = '"+user.getUserType()+"') ");
			}else{
				sql.append(" ) ");
			}
		}
		//业务类型
		if(buLawsList != null && buLawsList.size()>0){
			sql.append(" and id in ( ");
			for(BuLaws buLaws : buLawsList){
				sql.append(buLaws.getLawId()+",");
			}
			//去掉最后一个逗号
			sql = sql.deleteCharAt(sql.length()-1); 
			sql.append(") ");
		}
		//法律法规名称
		if(!isEmpty(lawsName)){
			sql.append(" and law_name like '%"+lawsName+"%'");
		}
		//提交时间
		if(!isEmpty(startDate) && !isEmpty(endDate)){
			sql.append(" and DATE_FORMAT(update_date,'%Y-%m-%d') >='"+startDate+"' and DATE_FORMAT(update_date,'%Y-%m-%d') <='"+endDate+"' ") ;
		}
	    return ipaginationservice.getPageImpl(sql.toString(), pageRequest, clazz);
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
	 * 得到分页信息数据
	 * @param page
	 * @return
	 */
	public Map<String, Object> getPageInfo(Page<Laws> page) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", page.getContent());
		map.put("count", page.getTotalElements());
		return map;
	}
	
	/**
	 * 法律法规详情（有发布状态）
	 * @param id
	 * @return
	 */
	public Laws getLawsById(int id){
		return lawsDao.getLawsById(id);
	}
	
	/**
	 * 法律法规详情（无发布状态）
	 * @param id
	 * @return
	 */
	public Laws getLawsPublishById(int id){
		return lawsDao.getLawsPublishById(id);
	}
	
	/**
	 * 批量删除（逻辑删除）
	 * @param ids
	 * @param userName
	 * @param update
	 * @return
	 * @throws Exception
	 */
	@Transactional(readOnly = false)
	public int deleteLawsByIds(Integer[] ids,String userName,String update) throws Exception{
		return lawsDao.deleteLawsByIds(ids,userName,update);
	}
	
	/**
	 * 批量发布/取消发布
	 * @param ids
	 * @param isPublish
	 * @param userName
	 * @param update
	 * @return
	 * @throws Exception
	 */
	@Transactional(readOnly = false)
	public int publishLawsByIds(Integer[] ids,String isPublish,String userName,String update) throws Exception{
		return lawsDao.publishLawsByIds(ids, isPublish, userName, update);
	}

	/**
	 * 添加/更新法律法规
	 * @param laws
	 * @param flag 标识 1 保存 2 更新
	 * @return
	 */
	@Transactional(readOnly = false)
	public boolean save(Laws laws,SysUser user,String flag) {
		//参数不为空
		if(laws != null && !StringUtils.isBlank(flag)){
			// 1 添加 2 更新
			if(flag.equals("1")){
				laws.setId(null);
				laws.setDelFlag("1");
				laws.setCreateBy(user.getLoginName());
				laws.setCreateDate(new Timestamp(System.currentTimeMillis()));
				laws.setUpdateBy(user.getLoginName());
				laws.setUpdateDate(new Timestamp(System.currentTimeMillis()));
			}else if(flag.equals("2")){
				laws.setUpdateBy(user.getLoginName());
				laws.setUpdateDate(new Timestamp(System.currentTimeMillis()));
			}
			lawsDao.save(laws);
			return true ;
		}
		return false;
	}
	
	/**
	 * 逻辑删除
	 * @param laws
	 * @return
	 */
	@SuppressWarnings("finally")
	@Transactional(readOnly = false)
	public boolean delete(Laws laws) {
		boolean flag = false ;
		try {
			laws.setDelFlag("0");
			lawsDao.save(laws);
			flag = true ;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			return flag ;
		}
	}

}

