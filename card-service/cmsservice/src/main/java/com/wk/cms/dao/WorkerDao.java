package com.wk.cms.dao;

import com.wk.entity.Worker;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 组织操作数据库接口
 */
public interface WorkerDao {
	/**
     * 增
	 * @param worker
     * @return
     */
	@Insert(" INSERT INTO wk.wk_worker(id, org_id, role_id, user_name, password, name, id_number, phone, weixin, font_img, after_img, home_img, remark, seg, create_time, update_time, opt_id) VALUES \n" +
			"(#{id}, #{orgId}, #{roleId}, #{userName}, #{password}, #{name}, #{idNumber}, #{phone}, #{weixin}, #{fontImg}, #{afterImg}, #{homeImg}, #{remark}, #{seg}, #{createTime}, #{updateTime}, #{optId}) ")
	Integer add(Worker worker);

    /**
     * 删
	 * @param id
     * @return
     */
	@Delete(" DELETE FROM wk.wk_worker WHERE ID=#{id} ")
	Integer delete(String id);

    /**
     * 查
	 * @param id
     * @return
     */
	@Select(" SELECT id, org_id orgId, role_id roleId, user_name userName, name, id_number idNumber, phone, weixin, font_img fontImg, after_img afterImg, home_img homeImg, remark, seg,create_time createTime, update_time updateTime, opt_id optId   FROM wk.wk_worker WHERE ID=#{id} ")
	Worker get(String id);

	/**
     * 改
	 * @param worker
     * @return
     */
	Integer update(Worker worker);

    /**
     * 搜索
	 * @param worker
     * @return
     */
	List<Worker> search(Worker worker);

	/**
	 * 搜索统计数记录数
	 * @param worker
	 * @return
	 */
	Integer searchCount(Worker worker);
}
