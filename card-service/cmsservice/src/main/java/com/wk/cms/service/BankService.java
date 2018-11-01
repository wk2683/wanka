package com.wk.cms.service;

import com.wk.entity.Bank;

import java.util.List;

/**
 * 银行信息
 */
public interface BankService {
	/**
	 * 加载所有银行信息
	 * @return
	 */
	List<Bank> load();
}
