package com.wk.cms.service;

import com.wk.entity.Mall;

import java.util.List;

/**
 * 商户信息服务接口
 */
public interface MallService {

	String add(Mall mall);
	/**
	 * 加载所有商户信息
	 * @return
	 */
	List<Mall> load();
}
