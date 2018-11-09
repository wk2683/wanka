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
	@Select(" SELECT\n" +
			"        worker.id,\n" +
			"        worker.org_id orgId,\n" +
			"        org.name orgName,\n" +
			"        worker.role_id roleId,\n" +
			"        role.name roleName,\n" +
			"        worker.user_name userName,\n" +
			"        worker.name,\n" +
			"        worker.id_number idNumber,\n" +
			"        worker.phone,\n" +
			"        worker.weixin,\n" +
			"        worker.font_img fontImg,\n" +
			"        worker.after_img afterImg,\n" +
			"        worker.home_img homeImg,\n" +
			"        worker.remark,\n" +
			"        worker.seg,\n" +
			"        worker.create_time createTime,\n" +
			"        worker.update_time updateTime,\n" +
			"        worker.opt_id optId\n" +
			"        FROM wk.wk_worker worker\n" +
			"        LEFT JOIN wk.wk_org org ON org.id = worker.org_id\n" +
			"        LEFT JOIN wk.wk_role role ON role.id = worker.role_id WHERE worker.id=#{id} ")
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

	@Select(" SELECT\n" +
			"        worker.id,\n" +
			"        worker.org_id orgId,\n" +
			"        org.name orgName,\n" +
			"        worker.role_id roleId,\n" +
			"        role.name roleName,\n" +
			"        worker.user_name userName,\n" +
			"        worker.password password,\n" +
			"        worker.name,\n" +
			"        worker.id_number idNumber,\n" +
			"        worker.phone,\n" +
			"        worker.weixin,\n" +
			"        worker.font_img fontImg,\n" +
			"        worker.after_img afterImg,\n" +
			"        worker.home_img homeImg,\n" +
			"        worker.remark,\n" +
			"        worker.seg,\n" +
			"        worker.create_time createTime,\n" +
			"        worker.update_time updateTime,\n" +
			"        worker.opt_id optId\n" +
			"        FROM wk.wk_worker worker\n" +
			"        LEFT JOIN wk.wk_org org ON org.id = worker.org_id\n" +
			"        LEFT JOIN wk.wk_role role ON role.id = worker.role_id WHERE worker.user_name=#{userName} ")
	List<Worker> getByName(String userName);
}
