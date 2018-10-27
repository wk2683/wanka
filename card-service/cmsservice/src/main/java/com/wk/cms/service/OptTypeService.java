package com.wk.cms.service;

import com.wk.entity.OptType;

import java.util.List;

/**
 * 操作类型服务接口
 */
public interface OptTypeService {
	/**
     * 增
	 * @param optType
     * @return
     */
	String add(OptType optType);

    /**
     * 删
	 * @param id
     * @return
     */
	Integer delete(String id);

    /**
     * 查
	 * @param id
     * @return
     */
	OptType get(String id);

	/**
     * 改
	 * @param optType
     * @return
     */
	Integer update(OptType optType);

    /**
     * 搜索
	 * @param optType
     * @return
     */
	List<OptType> search(OptType optType);
}
