package com.wk.cms.service;

import com.wk.entity.Worker;

import java.util.List;

/**
 * 员工 服务接口
 */
public interface WorkerService {
	/**
	 * 增
	 * @param worker
	 * @return
	 */
	String add(Worker worker);

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
	Worker get(String id);


	/**
     * 改
	 * @param worker
     * @return
     */
	Integer update(Worker worker);

    /**
     * 搜索
	 * @param worker
     * @return
     */
	List<Worker> search(Worker worker);

	Integer searchCount(Worker worker);
}
