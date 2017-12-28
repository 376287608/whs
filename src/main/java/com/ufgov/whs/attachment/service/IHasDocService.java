package com.ufgov.whs.attachment.service;

import java.util.List;
import java.util.Map;

import com.ufgov.whs.attachment.bean.HasDoc;

/**
 * 附件存储元数据接口
 */
public interface IHasDocService {

	/**
	 * 保存对象
	 * @param doc
	 * @return HasDoc
	 */
	public HasDoc saveHasDoc(HasDoc doc);
	
	/**
	 * 批量保存对象
	 * @param docList
	 * @return List<HasDoc>
	 */
	public List<HasDoc> saveBatchHasDoc(List<HasDoc> docList);

	/**
	 * 删除数据{对象id}
	 * @param docId
	 */
	public void delete(String docId);

	/**
	 * 删除对象{对象}
	 * @param doc
	 */
	public void delete(HasDoc doc);

	/**
	 * 查询对象{对象id}
	 * @param docId
	 * @return
	 */
	public HasDoc queryById(String docId);
	
	/**
	 * 动态条件查询
	 * @param map 查询条件
	 * @return List<HasDoc>
	 */
	public List<HasDoc> getDataByMap(Map<String, Object> map);
}
