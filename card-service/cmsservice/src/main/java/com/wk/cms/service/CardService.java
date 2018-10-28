package com.wk.cms.service;

import com.wk.entity.Card;

import java.util.List;

/**
 * 信用卡信息
 */
public interface CardService {
	/**
     * 增
	 * @param card
     * @return
     */
	String add(Card card);

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
	Card get(String id);

	/**
     * 改
	 * @param card
     * @return
     */
	Integer update(Card card);

    /**
     * 搜索
	 * @param card
     * @return
     */
	List<Card> search(Card card);

	Integer searchCount(Card card);
}