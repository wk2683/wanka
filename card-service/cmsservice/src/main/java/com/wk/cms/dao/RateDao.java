package com.wk.cms.dao;

import com.wk.entity.Rate;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 费率信息操作数据库接口
 */
public interface RateDao {
	/**
     * 增
	 * @param rate
     * @return
     */
	@Insert(" INSERT INTO wk.wk_rate(id, rate, remark, seg, create_time, update_time, opt_id) VALUES \n" +
			"(#{id}, #{rate}, #{remark}, #{seg}, #{createTime}, #{updateTime}, #{optId}) ")
	Integer add(Rate rate);

    /**
     * 删
	 * @param id
     * @return
     */
	@Delete(" DELETE FROM wk.wk_rate WHERE ID=#{id} ")
	Integer delete(String id);

    /**
     * 查
	 * @param id
     * @return
     */
	@Select(" SELECT  id, rate, remark, seg, create_time createTime, update_time updateTime, opt_id optId  FROM wk.wk_rate WHERE ID=#{id} ")
	Rate get(String id);

	/**
     * 改
	 * @param rate
     * @return
     */
	Integer update(Rate rate);

    /**
     * 搜索
	 * @param rate
     * @return
     */
	List<Rate> search(Rate rate);

	/**
	 * 搜索记录总数
	 * @param rate 搜索条件
	 * @return 返回搜索到的记录总数
	 */
	Integer searchCount(Rate rate);
}
