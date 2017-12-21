package com.ufgov.whs.common.dao;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

public class PublicDao extends HibernateDaoSupport {

	public Integer executeSql(String sql) {
		if (StringUtils.isNotBlank(sql)) {			
			Session s = begin();
			SQLQuery query = s.createSQLQuery(sql);
			int result = -1;
			try {				
				result = query.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
				s.getTransaction().rollback();
			}
			end(s);
			return result;
		}
		return -1;
	}
	
	public void executeSqlBatch(List<String> sqls, int num) throws Exception {
		if (sqls != null && sqls.size() > 0) {
			Session s = begin();
			int count = 0;
			for (String sql : sqls) {				
				try {				
					SQLQuery q = s.createSQLQuery(sql);
					q.executeUpdate();
				} catch (Exception e) {
					if (e.getCause().toString().contains("Duplicate entry")) {
						continue;
					} else {
						e.printStackTrace();
						s.getTransaction().rollback();					
						throw new Exception("dataInsert failed");
					}
				}
				count++;
				if (count % num == 0) {
					s.flush();
				}
			}
			end(s);
		}
	}
	
	private Session begin() {
		Session s = getHibernateTemplate().getSessionFactory().openSession();
		s.beginTransaction();
		return s;
	}
	
	private void end(Session s) {
		s.flush();
		s.getTransaction().commit();
		s.close();
	}
	
}
