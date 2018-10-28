package com.wk.cms.service;

import com.wk.entity.Model;

import java.util.List;

/**
 * 模块 服务接口
 */
public interface ModelService {
	/**
     * 增
	 * @param model
     * @return
     */
	String add(Model model);

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
	Model get(String id);

	/**
     * 改
	 * @param model
     * @return
     */
	Integer update(Model model);

    /**
     * 搜索
	 * @param model
     * @return
     */
	List<Model> search(Model model);

	Integer searchCount(Model model);
}
