package com.wk.cms.dao;

import com.wk.entity.OrderType;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 订单类型操作数据库接口
 */
public interface OrderTypeDao {
	/**
     * 增
	 * @param orderType
     * @return
     */
	@Insert(" INSERT INTO wk.wk_order_type(id, name, remark, seg, create_time, update_time, opt_id) VALUES \n" +
			"(#{id}, #{name}, #{remark}, #{seg}, #{createTime}, #{updateTime}, #{optId}) ")
	Integer add(OrderType orderType);

    /**
     * 删
	 * @param id
     * @return
     */
	@Delete(" DELETE FROM wk.wk_order_type WHERE ID=#{id} ")
	Integer delete(String id);

    /**
     * 查
	 * @param id
     * @return
     */
	@Select(" SELECT * FROM wk.wk_order_type WHERE ID=#{id} ")
	OrderType get(String id);

	/**
     * 改
	 * @param orderType
     * @return
     */
	Integer update(OrderType orderType);

    /**
     * 搜索
	 * @param orderType
     * @return
     */
	List<OrderType> search(OrderType orderType);

	/**
	 * 搜索记录总数
	 * @param orderType 搜索条件
	 * @return 返回搜索到的记录总数
	 */
	Integer searchCount(OrderType orderType);
}
