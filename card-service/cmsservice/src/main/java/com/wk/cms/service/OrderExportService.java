package com.wk.cms.service;

import com.wk.entity.OrderExport;

import java.util.List;

/**
 * 订单出账服务接口
 */
public interface OrderExportService {
	/**
     * 增
	 * @param orderExport
     * @return
     */
	String add(OrderExport orderExport);

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
	OrderExport get(String id);

	/**
     * 改
	 * @param orderExport
     * @return
     */
	Integer update(OrderExport orderExport);

    /**
     * 搜索
	 * @param orderExport
     * @return
     */
	List<OrderExport> search(OrderExport orderExport);


	Integer searchCount(OrderExport orderExport);
}
