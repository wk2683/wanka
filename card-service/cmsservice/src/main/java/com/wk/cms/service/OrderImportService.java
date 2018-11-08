package com.wk.cms.service;

import com.wk.entity.OrderImport;

import java.util.List;

/**
 * 订单出账服务接口
 */
public interface OrderImportService {
	/**
     * 增
	 * @param orderImport
     * @return
     */
	String add(OrderImport orderImport);

	/**
	 * 设置为关闭
	 * @param id
	 * @param optId
	 * @return
	 */
	Integer delete(String id, String optId);

    /**
     * 查
	 * @param id
     * @return
     */
	OrderImport get(String id);

	/**
     * 改
	 * @param orderImport
     * @return
     */
	Integer update(OrderImport orderImport);

    /**
     * 搜索
	 * @param orderImport
     * @return
     */
	List<OrderImport> search(OrderImport orderImport);


	Integer searchCount(OrderImport orderImport);
}
