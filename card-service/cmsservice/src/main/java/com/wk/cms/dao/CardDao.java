package com.wk.cms.dao;

import com.wk.entity.Card;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 信用卡信息操作数据库接口
 */
public interface CardDao {
	/**
     * 增
	 * @param card
     * @return
     */
	@Insert(" INSERT INTO wk.wk_card(id, self, card_name, name, id_number, phone, bank_name, card_number, password, bill_date, replay_date, total, bill, replay_rate, mini_fee, cash_rate, income, remark, seg, create_time, update_time, opt_id) VALUES \n" +
			"(#{id}, #{self}, #{cardName}, #{name}, #{idNumber}, #{phone}, #{bankName}, #{cardNumber}, #{password}, #{billDate}, #{replayDate}, #{total}, #{bill}, #{replayRate}, #{miniFee}, #{cashRate}, #{income}, #{remark}, #{seg}, #{createTime}, #{updateTime}, #{optId});\n ")
	Integer add(Card card);

    /**
     * 删
	 * @param id
     * @return
     */
	@Delete(" DELETE FROM wk.wk_card WHERE ID=#{id} ")
	Integer delete(String id);

    /**
     * 查
	 * @param id
     * @return
     */
	@Select(" SELECT * FROM wk.wk_card WHERE ID=#{id} ")
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

	/**
	 * 搜索记录总数
	 * @param card 搜索条件
	 * @return 返回搜索到的记录总数
	 */
	Integer searchCount(Card card);
}
