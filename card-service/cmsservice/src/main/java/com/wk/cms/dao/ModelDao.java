package com.wk.cms.dao;

import com.wk.entity.Model;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 模块操作数据库接口
 */
public interface ModelDao {
	/**
     * 增
	 * @param model
     * @return
     */
	@Insert(" INSERT INTO wk.wk_model(id, name,icon, remark, seg, create_time, update_time, opt_id) VALUES \n" +
			"(#{id}, #{name},#{icon}, #{remark}, #{seg}, #{createTime}, #{updateTime}, #{optId}) ")
	Integer add(Model model);

    /**
     * 删
	 * @param id
     * @return
     */
	@Delete(" DELETE FROM wk.wk_model WHERE ID=#{id} ")
	Integer delete(String id);

    /**
     * 查
	 * @param id
     * @return
     */
	@Select(" SELECT  id, name, remark, seg, create_time createTime, update_time updateTime, opt_id optId  FROM wk.wk_model WHERE ID=#{id} ")
	Model get(String id);

	/**
     * 改
	 * @param model
     * @return
     */
	Integer update(Model model);

    /**
     * 搜索
	 * @param model
     * @return
     */
	List<Model> search(Model model);

	/**
	 * 搜索记录总数
	 * @param model 搜索条件
	 * @return 返回搜索到的记录总数
	 */
	Integer searchCount(Model model);
}
