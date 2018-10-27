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
	@Insert(" INSERT INTO wk.wk_pos(id, name, import_user_name, bank_name, card_number, rate_id, remark, seg, create_time, update_time, opt_id) VALUES \n" +
			"(#{id}, #{name}, #{importUserName}, #{bankName}, #{cardNumber}, #{rateId}, #{remark}, #{seg}, #{createTime}, #{updateTime}, #{optId}) ")
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
	@Select(" SELECT * FROM wk.wk_pos WHERE ID=#{id} ")
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
}
