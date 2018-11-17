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
	@Insert(" INSERT INTO wk.wk_pos(id, name, import_user_name,import_user_id, bank_name, card_number, rate_id,rate1,rate2, remark, seg, create_time, update_time, opt_id) VALUES \n" +
			"(#{id}, #{name}, #{importUserName},#{importUserId}, #{bankName}, #{cardNumber}, #{rateId}, #{rate1}, #{rate2}, #{remark}, #{seg}, #{createTime}, #{updateTime}, #{optId}) ")
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
	@Select(" SELECT id,name,import_user_name importUserName,import_user_id importUserId, bank_name bankName,card_number cardNumber , rate_id rateId ,rate1,rate2,  remark ,  seg , create_time createTime, update_time updateTime, opt_id optId FROM wk.wk_pos WHERE ID=#{id} ")
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
