package com.ufgov.whs.guide.service;

import java.sql.Timestamp;
import java.util.ArrayList;
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
import com.ufgov.whs.common.pagination.impl.IPaginationImpl;
import com.ufgov.whs.guide.bean.Guides;
import com.ufgov.whs.guide.dao.GuidesDao;
import com.ufgov.whs.system.user.bean.SysUser;

/**
 * 用户指南service
 * @author xlli
 * @date 2017-10-12
 */
@Service
@Transactional(readOnly = true)
public class GuidesService{
	
	@Autowired
	private GuidesDao guidesDao;
	
	@Autowired
	private IPaginationImpl ipaginationservice;
	
	/**
	 * 创建分页请求
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
	 * @param pageRequest 分页对象
	 * @param clazz 泛型
	 * @param user 用户
	 * @param guides 业务
	 * @return
	 * @throws Exception
	 */
	public PageImpl getFindAll(PageRequest pageRequest,Class clazz,SysUser user,
			List<BuGuides> guidesIds,String guidesName,String startDate,String endDate,boolean isNotPublish ) throws Exception {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder();
		sql.append("select * from guides where del_flag = '1' ");
		//不是发布列表 则显示此用户类型可查看的并且已发布的数据
		if(isNotPublish){
			sql.append(" and is_public = '1' ");
			//type 0 为企业 1为银行 2为公共
			sql.append(" and (type = '2' ");
			//用户类型
			if(user != null){
				sql.append(" or type = '"+user.getUserType()+"') ");
			}else{
				sql.append(" ) ");
			}
		}
		
		//业务类型
		if(guidesIds != null && guidesIds.size()>0){
			sql.append(" and id in ( ");
			for(BuGuides guide : guidesIds){
				sql.append(guide.getGuidesId()+",");
			}
			//去掉最后一个逗号
			sql = sql.deleteCharAt(sql.length()-1); 
			sql.append(") ");
		}
		//指南名称
		if(!isEmpty(guidesName)){
			sql.append(" and guides_name like '%"+guidesName+"%'");
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
	public Map<String, Object> getPageInfo(Page<Guides> page) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", page.getContent());
		map.put("count", page.getTotalElements());
		return map;
	}
	
	/**
	 * 根据id查找办事指南
	 * @param id
	 * @return
	 */
	public Guides getGuidesById(int id){
		return guidesDao.getGuidesById(id);
	}
	
	/**
	 * 添加/更新办事指南
	 * @param guides
	 * @param user
	 * @param flag 1 保存 2 更新
	 * @return
	 */
	@Transactional(readOnly = false)
	public boolean save(Guides guides,SysUser user,String flag) {
		//参数不为空
		if(guides != null && !StringUtils.isBlank(flag)){
			// 1 添加 2 更新
			if(flag.equals("1")){
				guides.setId(null);
				guides.setDelFlag("1");
				guides.setCreateBy(user.getLoginName());
				guides.setCreateDate(new Timestamp(System.currentTimeMillis()));
				guides.setUpdateBy(user.getLoginName());
				guides.setUpdateDate(new Timestamp(System.currentTimeMillis()));
			}else if(flag.equals("2")){
				guides.setUpdateBy(user.getLoginName());
				guides.setUpdateDate(new Timestamp(System.currentTimeMillis()));
			}
			guidesDao.save(guides);
			return true ;
		}
		return false;
	}
	
	/**
	 * 批量删除
	 * @param ids
	 * @param userName
	 * @param update
	 * @return
	 * @throws Exception
	 */
	@Transactional(readOnly = false)
	public int deleteGuidesByIds(Integer[] ids,String userName,String update) throws Exception{
		return guidesDao.deleteGuidesByIds(ids, userName, update);
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
	public int publishGuidesByIds(Integer[] ids,String isPublish,String userName,String update) throws Exception{
		return guidesDao.publishGuidesByIds(ids, isPublish, userName, update);
	}
	

}

