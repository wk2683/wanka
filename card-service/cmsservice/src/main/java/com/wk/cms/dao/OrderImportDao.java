package com.wk.cms.dao;

import com.wk.entity.OrderImport;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 订单入账操作数据库接口
 */
public interface OrderImportDao {
	/**
     * 增
	 * @param orderImport
     * @return
     */
	@Insert(" INSERT INTO wk.wk_order_import\n" +
			"(id, order_id, export_datae, type, pos_id, mall_name, consume_account_id, bill, consume_type, result, rate, fee, import_bill, should_bill, remark, seg, create_time, update_time, opt_id) \n" +
			"VALUES \n" +
			"(#{id},#{orderId},#{exportDatae},#{type},#{posId},#{mallName},#{consumeAccountId},#{bill},#{consumeType},#{result},#{rate},#{fee},#{importBill},#{shouldBill},#{remark},#{seg},#{createTime},#{updateTime},#{optId}) \n" +
			"\n ")
	Integer add(OrderImport orderImport);

    /**
     * 删
	 * @param id
     * @return
     */
	@Delete(" DELETE FROM  wk.wk_order_import  WHERE id=#{id} ")
	Integer delete(@Param("id") String id);

    /**
     * 查
	 * @param id
     * @return
     */
	@Select(" SELECT  " +
			"id id,\n" +
			" order_id  orderId,\n" +
			" export_datae exportDatae,\n" +
			" type type,\n" +
			" pos_id posId,\n" +
			" mall_name mallName,\n" +
			" consume_account_id consumeAccountId,\n" +
			" bill bill,\n" +
			" consume_type consumeType,\n" +
			" result result,\n" +
			" rate rate,\n" +
			" fee fee,\n" +
			" import_bill importBill,\n" +
			" should_bill shouldBill,\n" +
			" remark remark,\n" +
			" seg seg,\n" +
			" create_time createTime,\n" +
			" update_time updateTime,\n" +
			" opt_id optId " +
			" FROM wk.wk_order_import WHERE id=#{id} ")
	OrderImport get(String id);

	/**
     * 改
	 * @param orderImport
     * @return
     */
	Integer update(OrderImport orderImport);

	/**
	 * 搜索记录总数
	 * @param orderImport 搜索条件
	 * @return 返回搜索到的记录总数
	 */
	List<OrderImport> search(OrderImport orderImport);

	/**
	 * 搜索记录总数
	 * @param orderImport 搜索条件
	 * @return 返回搜索到的记录总数
	 */
	Integer searchCount(OrderImport orderImport);
}
