package com.wk.cms.service;

import com.wk.entity.Rate;

import java.util.List;

/**
 * 费率服务接口
 */
public interface RateService {
	/**
	 * 增
	 * @param rate
	 * @return
	 */
	String add(Rate rate);

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
	Rate get(String id);

	/**
     * 改
	 * @param rate
     * @return
     */
	Integer update(Rate rate);

    /**
     * 搜索
	 * @param rate
     * @return
     */
	List<Rate> search(Rate rate);

	Integer searchCount(Rate rate);
}
