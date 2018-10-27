package com.wk.cms.service;

import com.wk.entity.Pos;

import java.util.List;

/**
 * POS机信息服务接口
 */
public interface PosService {
	/**
	 * 增
	 * @param pos
	 * @return
	 */
	String add(Pos pos);

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
	Pos get(String id);

	/**
     * 改
	 * @param pos
     * @return
     */
	Integer update(Pos pos);

    /**
     * 搜索
	 * @param pos
     * @return
     */
	List<Pos> search(Pos pos);
}
