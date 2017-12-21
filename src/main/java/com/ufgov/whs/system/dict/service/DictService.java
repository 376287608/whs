package com.ufgov.whs.system.dict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ufgov.whs.common.pagination.impl.IPaginationImpl;
import com.ufgov.whs.system.dict.bean.SysDict;
import com.ufgov.whs.system.dict.dao.DictDao;
import com.ufgov.whs.system.role.bean.SysRole;
import com.ufgov.whs.system.user.dao.UserDao;

/**
 * 字典service
 * @author fucj
 * @date 2015年1月13日
 */
@Service
@Transactional(readOnly=true)
public class DictService{
	
	@Autowired
	private DictDao dictDao;
	
	@Autowired
	private IPaginationImpl ipaginationservice;
	
	/**
	 * 删除字典
	 * @param id
	 */
	@Transactional(readOnly=false)
	public void delete(Integer id){
		dictDao.delete(id);
	}
	
	@Transactional(readOnly=false)
	public void save(SysDict dict) {
		dictDao.save(dict);
	}
	
	public SysDict get(int id) {
		return dictDao.findOne(id);		
	}
	
	/**
	 * 根据类型查找字典
	 * @param type
	 * @return
	 */
	public List<SysDict> getSysDictByType(String type){
		return dictDao.getSysDictByType(type) ;
	}
	
	public PageImpl getFindAll(PageRequest pageRequest) throws Exception {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder();
		sql.append("select ID as id,NAME as name,ROLE_CODE as roleCode,DESCRIPTION as description,SORT as sort,DEL_FLAG as delFlag from role");
	    return ipaginationservice.getPageImpl(sql.toString(), pageRequest, SysRole.class);
	}
}
