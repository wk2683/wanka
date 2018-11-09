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
			"(id, order_id, export_Date, type, pos_id, mall_name, consume_account_id, bill, consume_type, result, rate, fee, import_bill, should_bill, remark, seg, create_time, update_time, opt_id) \n" +
			"VALUES \n" +
			"(#{id},#{orderId},#{exportDate},#{type},#{posId},#{mallName},#{consumeAccountId},#{bill},#{consumeType},#{result},#{rate},#{fee},#{importBill},#{shouldBill},#{remark},#{seg},#{createTime},#{updateTime},#{optId}) \n" +
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
			" import.id id,\n" +
			" import.order_id  orderId,\n" +
			" import.export_date exportDate,\n" +
			" import.type type,\n" +
			" import.pos_id posId,\n" +
			" pos.name posName,\n" +
			" import.mall_name mallName,\n" +
			" import.consume_account_id consumeAccountId,\n" +
			" account.name consumeAccountName,\n" +
			" import.bill bill,\n" +
			" import.consume_type consumeType,\n" +
			" import.result result,\n" +
			" import.rate rate,\n" +
			" import.fee fee,\n" +
			" import.import_bill importBill,\n" +
			" import.should_bill shouldBill,\n" +
			" import.remark remark,\n" +
			" import.seg seg,\n" +
			" import.create_time createTime,\n" +
			" import.update_time updateTime,\n" +
			" import.opt_id optId " +
			" FROM wk.wk_order_import import " +
			" LEFT JOIN wk.wk_account account ON account.id = import.consume_account_id " +
			" LEFT JOIN wk.wk_pos pos ON pos.id = import.pos_id " +
			"WHERE import.id=#{id} ")
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
