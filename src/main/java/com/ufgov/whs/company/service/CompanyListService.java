package com.ufgov.whs.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ufgov.whs.company.bean.CompanyList;
import com.ufgov.whs.company.dao.CompanyListDao;

/**
 * 用户service
 * @author xlli
 * @date 2017-10-12
 */
@Service
@Transactional(readOnly = true)
public class CompanyListService{
	
	@Autowired
	private CompanyListDao companyListDao;
	
	/**
	 * 根据组织机构代码查找企业
	 * @param legalCode
	 * @return
	 */
	public CompanyList getCompanyByLegalCode(String orgBarcode) {
		return companyListDao.getCompanyByOrgBarcode(orgBarcode) ;
	}

}

