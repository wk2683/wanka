package com.wk.cms.dao;

import com.wk.entity.Pos;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * POS机信息操作数据库接口
 */
public interface PosDao {
	/**
     * 增
	 * @param pos
     * @return
     */
	@Insert(" INSERT INTO wk.wk_pos(id, name, import_account_id , bank_name, card_number,rate1,rate2, remark, seg, create_time, update_time, opt_id) VALUES \n" +
			"(#{id}, #{name}, #{importAccountId}, #{bankName}, #{cardNumber},  #{rate1}, #{rate2}, #{remark}, #{seg}, #{createTime}, #{updateTime}, #{optId}) ")
	Integer add(Pos pos);

    /**
     * 删
	 * @param id
     * @return
     */
	@Delete(" DELETE FROM wk.wk_pos WHERE ID=#{id} ")
	Integer delete(String id);

    /**
     * 查
	 * @param id
     * @return
     */
	@Select(" SELECT\n" +
			"        pos.id,\n" +
			"        pos.NAME,\n" +
			"        pos.import_account_id importAccountId,\n" +
			"        account.name importAccountName,\n" +
			"        pos.bank_name bankName,\n" +
			"        pos.card_number cardNumber,\n" +
			"        pos.rate1,\n" +
			"        pos.rate2,\n" +
			"        pos.remark,\n" +
			"        pos.seg,\n" +
			"        pos.create_time createTime,\n" +
			"        pos.update_time updateTime,\n" +
			"        pos.opt_id optId\n" +
			"        FROM\n" +
			"        wk.wk_pos pos\n" +
			"        LEFT JOIN wk.wk_account account ON account.id = pos.import_account_id " +
			" WHERE pos.id=#{id} ")
	Pos get(String id);

	/**
     * 改
	 * @param pos
     * @return
     */
	Integer update(Pos pos);

    /**
     * 搜索
	 * @param pos
     * @return
     */
	List<Pos> search(Pos pos);

	/**
	 * 搜索记录总数
	 * @param pos 搜索条件
	 * @return 返回搜索到的记录总数
	 */
	Integer searchCount(Pos pos);
}
