package com.wk.cms.dao;

import com.wk.entity.OrderExport;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 订单出账操作数据库接口
 */
public interface OrderExportDao {
	/**
     * 增
	 * @param orderExport
     * @return
     */
	@Insert(" INSERT INTO wk.wk_order_export\n" +
			"(id, order_id, export_datae, type, export_account_id, import_account_id, card_password, name, card_number, import_bill, rate, fee, remark, seg, create_time, update_time, opt_id) VALUES \n" +
			"(#{id},#{orderId},#{exportDatae},#{type},#{exportAccountId},#{importAccountId},#{cardPassword},#{name},#{cardNumber},#{importBill},#{rate},#{fee},#{remark},#{seg},#{createTime},#{updateTime},#{optId)) ")
	Integer add(OrderExport orderExport);

    /**
     * 删
	 * @param id
     * @return
     */
	@Delete(" DELETE FROM  wk.wk_order_export  WHERE id=#{id} ")
	Integer delete(@Param("id") String id);

    /**
     * 查
	 * @param id
     * @return
     */
	@Select(" SELECT  " +
			"\n" +
			"id, \n" +
			"order_id orderId, \n" +
			"export_datae exportDatae, \n" +
			"type, \n" +
			"export_account_id exportAccountId,\n" +
			"import_account_id importAccountId, \n" +
			"card_password cardPassword, \n" +
			"name, \n" +
			"card_number cardNumber, \n" +
			"import_bill importBill, \n" +
			"rate, \n" +
			"fee, \n" +
			"remark, \n" +
			"seg, \n" +
			"create_time createTime,\n" +
			" update_time updateTime, \n" +
			" opt_id optId " +
			" FROM wk.wk_order_export WHERE id=#{id} ")
	OrderExport get(String id);

	/**
     * 改
	 * @param orderExport
     * @return
     */
	Integer update(OrderExport orderExport);

	/**
	 * 搜索记录总数
	 * @param orderExport 搜索条件
	 * @return 返回搜索到的记录总数
	 */
	List<OrderExport> search(OrderExport orderExport);

	/**
	 * 搜索记录总数
	 * @param orderExport 搜索条件
	 * @return 返回搜索到的记录总数
	 */
	Integer searchCount(OrderExport orderExport);
}
