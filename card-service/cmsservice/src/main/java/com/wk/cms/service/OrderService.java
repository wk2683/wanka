package com.wk.cms.service;

import com.wk.entity.Order;

import java.util.List;

/**
 * 订单服务接口
 */
public interface OrderService {
	/**
     * 增
	 * @param order
     * @return
     */
	String add(Order order);

	/**
	 * 设置为关闭
	 * @param id
	 * @param optId
	 * @return
	 */
	Integer delete(String id,String optId);

    /**
     * 查
	 * @param id
     * @return
     */
	Order get(String id);

	/**
     * 改
	 * @param order
     * @return
     */
	Integer update(Order order);

    /**
     * 搜索
	 * @param order
     * @return
     */
	List<Order> search(Order order);


	Integer searchCount(Order order);
}
