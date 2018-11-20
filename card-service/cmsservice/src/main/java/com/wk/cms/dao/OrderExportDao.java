package com.wk.cms.dao;

import com.wk.entity.OrderExport;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.bind.annotation.RequestBody;

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
			"(id, order_id, export_date, type, export_account_id, import_account_id, card_password, name, card_number, import_bill, rate, fee, remark, seg, create_time, update_time, opt_id) VALUES \n" +
			"(#{id},#{orderId},#{exportDate},#{type},#{exportAccountId},#{importAccountId},#{cardPassword},#{name},#{cardNumber},#{importBill},#{rate},#{fee},#{remark},#{seg},#{createTime},#{updateTime},#{optId}) ")
	Integer add( OrderExport orderExport);

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
			"export.id, \n" +
			"export.order_id orderId, \n" +
			"export.export_date exportDate, \n" +
			"export.type, \n" +
			"export.export_account_id exportAccountId,\n" +
			"account1.name exportAccountName,\n" +
			"account1.card_number exportAccountNumber,\n" +
			"export.import_account_id importAccountId, \n" +
			"account2.name importAccountName, \n" +
			"export.card_password cardPassword, \n" +
			"export.name, \n" +
			"export.card_number cardNumber, \n" +
			"export.import_bill importBill, \n" +
			"export.rate, \n" +
			"export.fee, \n" +
			"export.remark, \n" +
			"export.seg, \n" +
			"export.create_time createTime,\n" +
			"export.update_time updateTime, \n" +
			"export.opt_id optId " +
			" FROM wk.wk_order_export export " +
			" LEFT JOIN wk.wk_account account1 ON account1.id = export.export_account_id " +
			" LEFT JOIN wk.wk_card account2 ON account2.id = export.import_account_id " +
			" WHERE export.id=#{id} ")
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
