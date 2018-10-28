package com.wk.cms.service;

import com.wk.entity.Account;


import java.util.List;

/**
 * 账户信息 服务接口
 */
public interface AccountService {
	/**
     * 增
	 * @param account
     * @return
     */
	String add(Account account);

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
	Account get(String id);

	/**
     * 改
	 * @param account
     * @return
     */
	Integer update(Account account);

    /**
     * 搜索
	 * @param account
     * @return
     */
	List<Account> search(Account account);

	Integer searchCount(Account account);
}
