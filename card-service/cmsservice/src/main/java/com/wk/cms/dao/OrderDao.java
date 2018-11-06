package com.wk.cms.dao;

import com.wk.entity.Order;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

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
	@Insert(" INSERT INTO wk.wk_order(id, customer_id, type, total, rate, fee, discount, real_fee, status, remark, seg, create_time, update_time, opt_id) VALUES " +
			"(#{id}, #{customerId}, #{type}, #{total}, #{rate}, #{fee}, #{discount}, #{realFee}, #{status}, #{remark}, #{seg}, #{createTime}, #{updateTime}, #{optId}) ")
	Integer add(Order order);

    /**
     * 删
	 * @param id
     * @return
     */
	@Delete(" DELETE FROM wk.wk_order WHERE ID=#{id} ")
	Integer delete(String id);

    /**
     * 查
	 * @param id
     * @return
     */
	@Select(" SELECT  id, customer_id customerId, type, total, rate, fee, discount, real_fee realFee, status, remark, seg, create_time createTime, update_time updateTime, opt_id optId  FROM wk.wk_order WHERE ID=#{id} ")
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
}
