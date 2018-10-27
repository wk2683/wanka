package com.wk.cms.service;

import com.wk.entity.OrderType;


import java.util.List;

/**
 * 订单类型 服务接口
 */
public interface OrderTypeService {
	/**
     * 增
	 * @param orderType
     * @return
     */
	String add(OrderType orderType);

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
	OrderType get(String id);

	/**
     * 改
	 * @param orderType
     * @return
     */
	Integer update(OrderType orderType);

    /**
     * 搜索
	 * @param orderType
     * @return
     */
	List<OrderType> search(OrderType orderType);
}
