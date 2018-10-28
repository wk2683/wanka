package com.wk.cms.dao;

import com.wk.entity.Customer;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 会员（顾客）操作数据库接口
 */
public interface CustomerDao {
	/**
     * 增
	 * @param customer
     * @return
     */
	@Insert(" INSERT INTO wk.wk_customer" +
			"(id, name, id_number, phone, worker_id, font_img, after_img, home_img, remark, seg, create_time, update_time, opt_id) VALUES \n" +
			"(#{id}, #{name}, #{idNumber}, #{phone}, #{workerId}, #{fontImg}, #{afterImg}, #{homeImg}, #{remark}, #{seg}, #{createTime}, #{updateTime}, #{optId}) ")
	Integer add(Customer customer);

    /**
     * 删
	 * @param id
     * @return
     */
	@Delete(" DELETE FROM wk.wk_customer WHERE ID=#{id} ")
	Integer delete(String id);

    /**
     * 查
	 * @param id
     * @return
     */
	@Select(" SELECT * FROM wk.wk_customer WHERE ID=#{id} ")
	Customer get(String id);

	/**
     * 改
	 * @param customer
     * @return
     */
	Integer update(Customer customer);

    /**
     * 搜索
	 * @param customer
     * @return
     */
	List<Customer> search(Customer customer);

	/**
	 * 搜索记录总数
	 * @param customer 搜索条件
	 * @return 返回搜索到的记录总数
	 */
	Integer searchCount(Customer customer);
}
