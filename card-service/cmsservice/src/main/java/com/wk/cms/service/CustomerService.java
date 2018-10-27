package com.wk.cms.service;

import com.wk.entity.Customer;

import java.util.List;

/**
 * 客户 服务接口
 */
public interface CustomerService {
	/**
     * 增
	 * @param customer
     * @return
     */
	String add(Customer customer);

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
	Customer get(String id);

	/**
     * 改
	 * @param customer
     * @return
     */
	Integer update(Customer customer);

    /**
     * 搜索
	 * @param customer
     * @return
     */
	List<Customer> search(Customer customer);
}
