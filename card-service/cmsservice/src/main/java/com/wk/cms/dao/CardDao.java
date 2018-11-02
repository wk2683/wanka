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
	@Insert(" INSERT INTO wk.wk_card(id, self,customer_id ,card_name, name, id_number, phone, bank_name, card_number, password, bill_date, replay_date, total, bill, replay_rate, mini_fee, cash_rate, income, remark, seg, create_time, update_time, opt_id) VALUES \n" +
			"(#{id}, #{self},#{customerId}, #{cardName}, #{name}, #{idNumber}, #{phone}, #{bankName}, #{cardNumber}, #{password}, #{billDate}, #{replayDate}, #{total}, #{bill}, #{replayRate}, #{miniFee}, #{cashRate}, #{income}, #{remark}, #{seg}, #{createTime}, #{updateTime}, #{optId}) ")
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
	@Select(" SELECT id,\n" +
			"        self,\n" +
			"        customer_id customerId,\n" +
			"        card_name cardName,\n" +
			"        name,\n" +
			"        id_number idNumber,\n" +
			"        phone,\n" +
			"        bank_name bankName,\n" +
			"        card_number cardNumber,\n" +
			"        password,\n" +
			"        bill_date billDate,\n" +
			"        replay_date replayDate,\n" +
			"        total,\n" +
			"        bill,\n" +
			"        replay_rate replayRate,\n" +
			"        mini_fee miniFee,\n" +
			"        cash_rate cashRate, \n" +
			"        income, remark, seg, create_time createTime, update_time updateTime, opt_id optId FROM wk.wk_card WHERE ID=#{id} ")
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
