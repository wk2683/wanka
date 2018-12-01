package com.wk.cms.dao;

import com.wk.entity.Order;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * 订单操作数据库接口
 */
public interface OrderDao {
	/**
     * 增
	 * @param order
     * @return
     */
	@Insert(" INSERT INTO wk.wk_order(id, customer_id,card_id, type, total, rate, fee, discount, real_fee, status, remark, seg, create_time, update_time, opt_id) VALUES " +
			"(#{id}, #{customerId},#{cardId}, #{type}, #{total}, #{rate}, #{fee}, #{discount}, #{realFee}, #{status}, #{remark}, #{seg}, #{createTime}, #{updateTime}, #{optId}) ")
	Integer add(Order order);

    /**
     * 删
	 * @param id
     * @return
     */
	@Update(" UPDATE  wk.wk_order SET status=0,update_time=NOW(),opt_id=#{optId} WHERE ID=#{id} ")
	Integer delete(@Param("id")String id, @Param("optId")String optId);

    /**
     * 查
	 * @param id
     * @return
     */
	@Select(" SELECT\n" +
			"        orders.id,\n" +
			"        orders.customer_id customerId,\n" +
			"        customer.name customerName,\n" +
			"        orders.card_id cardId,\n" +
			"        card.card_name cardName,\n" +
			"        card.bill_date billDate,\n" +
			"        card.replay_date replayDate,\n" +
			"        card.total total2,\n" +
			"        orders.type,\n" +
			"        orders.total,\n" +
			"        orders.rate,\n" +
			"        orders.fee,\n" +
			"        orders.discount,\n" +
			"        orders.real_fee realFee,\n" +
			"        orders.status,\n" +
			"        orders.remark,\n" +
			"        orders.seg,\n" +
			"        orders.create_time createTime,\n" +
			"        orders.update_time updateTime,\n" +
			"        orders.opt_id optId\n" +
			"        FROM wk.wk_order orders\n" +
			"        LEFT JOIN wk.wk_customer customer ON customer.id = orders.customer_id\n" +
			"        LEFT JOIN wk.wk_card card ON card.id = orders.card_id " +
			" WHERE orders.id=#{id} ")
	Order get(String id);

	/**
     * 改
	 * @param order
     * @return
     */
	Integer update(Order order);

	/**
	 * 搜索记录总数
	 * @param order 搜索条件
	 * @return 返回搜索到的记录总数
	 */
	List<Order> search(Order order);

	/**
	 * 搜索记录总数
	 * @param order 搜索条件
	 * @return 返回搜索到的记录总数
	 */
	Integer searchCount(Order order);

	/**
	 * 检测订单是否存在（客户ID,信用卡ID，订单类型）
	 * @param order
	 * @return
	 */
	List<Order> orderCheck(Order order);
}
