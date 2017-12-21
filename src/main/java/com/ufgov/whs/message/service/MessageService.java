package com.ufgov.whs.message.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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

import com.ufgov.whs.common.pagination.impl.IPaginationImpl;
import com.ufgov.whs.guide.bean.Guides;
import com.ufgov.whs.message.bean.Message;
import com.ufgov.whs.message.dao.MessageDao;
import com.ufgov.whs.system.user.bean.SysUser;

/**
 * 消息通知service
 * @author xlli
 * @date 2017-10-12
 */
@Service
@Transactional(readOnly = true)
public class MessageService{
	
	@Autowired
	private MessageDao messageDao;
	
	@Autowired
	private IPaginationImpl ipaginationservice;

	@Transactional(readOnly=false)
	public void insertMessage(String formId, String formCode, String businessName,
			Date submitTime, String status1, String status2, Date updateTime,String contantName, 
			String readFlag,String loginName,String companyName,String bankLoginName,Integer businessId){
		Message ma = new Message(formId, formCode, businessName,submitTime, status1, status2, updateTime,
				contantName, readFlag);
		ma.setCompanyLoginName(loginName);
		ma.setCompanyName(companyName);
		ma.setBankLoginName(bankLoginName);
		ma.setBusinessId(businessId);
		ma.setDelFlag("1");
		messageDao.save(ma);
	}
	
	@Transactional(readOnly = false)
	public String view(Integer id) {
		Message m = messageDao.findOne(id);
		m.setReadFlag("1");
		messageDao.save(m);
		return "操作成功";
	}
	
	@Transactional(readOnly = false)
	public void updateNotReadMessage(String formId) {
		List<Message> mlist = messageDao.getMessageByFormId(formId,"0");
		if(mlist!=null && mlist.size()>0){
			for(Message m:mlist){
				m.setDelFlag("0");
				messageDao.save(m);
			}
		}
	}
	
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
	 * @return
	 * @throws Exception
	 */
	public PageImpl getFindAll(PageRequest pageRequest,Class<?> clazz,SysUser user,String startDate,String endDate ) throws Exception {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder();
		sql.append("select * from message where 1=1 and del_flag='1' ");
		if(user != null){
			//银行用户
			if(user.getUserType().equals("1")){
				sql.append(" and bank_login_name = '"+user.getLoginName()+"' and read_flag = '1' ") ;
			}else{//企业用户
				sql.append(" and company_login_name = '"+user.getLoginName()+"' and read_flag = '0' ") ;
			}
		}
		//提交时间
		if(!isEmpty(startDate) && !isEmpty(endDate)){
			sql.append(" and DATE_FORMAT(submit_time,'%Y-%m-%d') >='"+startDate+"' and DATE_FORMAT(submit_time,'%Y-%m-%d') <='"+endDate+"' ") ;
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
	

}

