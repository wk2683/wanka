package com.wk.cms.dao;

import com.wk.entity.Card;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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
	@Insert(" INSERT INTO wk.wk_card(id, self,customer_id ,card_name, name, id_number, phone, bank_name, card_number, password, bill_date, replay_date, valid_date,total, bill, replay_rate, mini_fee, cash_rate, income, remark, seg, create_time, update_time, opt_id) VALUES \n" +
			"(#{id}, #{self},#{customerId}, #{cardName}, #{name}, #{idNumber}, #{phone}, #{bankName}, #{cardNumber}, #{password}, #{billDate}, #{replayDate},#{validDate}, #{total}, #{bill}, #{replayRate}, #{miniFee}, #{cashRate}, #{income}, #{remark}, #{seg}, #{createTime}, #{updateTime}, #{optId}) ")
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
	@Select(" SELECT \n" +
			"card.id,\n" +
			"card.self,\n" +
			"card.customer_id customerId,\n" +
			"card.card_name cardName,\n" +
			"card.name,\n" +
			"card.id_number idNumber,\n" +
			"card.phone,\n" +
			"card.bank_name bankName,\n" +
			"card.card_number cardNumber,\n" +
			"card.password,\n" +
			"card.bill_date billDate,\n" +
			"card.replay_date replayDate,\n" +
			"card.valid_date validDate,\n" +
			"card.total,\n" +
			"card.bill,\n" +
			"card.replay_rate replayRate,\n" +
			"card.mini_fee miniFee,\n" +
			"card.cash_rate cashRate, \n" +
			"card.income, \t\t \n" +
			"card.remark, \t\t \n" +
			"card.seg, \t\t \n" +
			"card.lock, \t\t \n" +
			"card.lock_worker_id lockWorkerId, \n" +
			"worker.name lockWorkerName, \n" +
			"card.create_time createTime, \n" +
			"card.update_time updateTime, \n" +
			"card.opt_id optId \n" +
			"FROM wk.wk_card card \n" +
			"LEFT JOIN wk.wk_worker worker ON worker.id=card.lock_worker_id  WHERE card.id=#{id} ")
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

	/**
	 * 锁与解锁卡操作
	 * @param card
	 * @return
	 */
	@Update(" UPDATE wk.wk_card SET `lock`=#{lock},lock_worker_id=#{lockWorkerId},update_time=#{updateTime},opt_id=#{optId} WHERE id=#{id} ")
	Integer lock(Card card);
}
