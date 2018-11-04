package com.wk.cms.dao;

import com.wk.entity.Account;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 账户信息操作数据库接口
 */
public interface AccountDao {
	/**
     * 增
	 * @param account
     * @return
     */
	@Insert(" INSERT INTO wk.wk_account " +
			"(id, name, user_name,user_id,bank_name , card_number, web_user_name, web_password, seg, remark,create_time, update_time, opt_id) VALUES \n" +
			"(#{id}, #{name}, #{userName},#{userId}, #{bankName}, #{cardNumber}, #{webUserName}, #{webPassword}, #{seg},#{remark}, #{createTime}, #{updateTime}, #{optId}); ")
	Integer add(Account account);

    /**
     * 删
	 * @param id
     * @return
     */
	@Delete(" DELETE FROM wk.wk_account WHERE ID=#{id} ")
	Integer delete(String id);

    /**
     * 查
	 * @param id
     * @return
     */
	@Select(" SELECT id,  name, user_name userName,user_id userId,bank_name bankName,card_number cardNumber , web_user_name webUserName, web_password webPassword, seg,remark, create_time createTime, update_time updateTime, opt_id optId  FROM wk.wk_account WHERE ID=#{id} ")
	Account get(String id);

	/**
     * 改
	 * @param account
     * @return
     */
	Integer update(Account account);

    /**
     * 搜索
	 * @param account
     * @return
     */
	List<Account> search(Account account);

	/**
	 * 搜索记录总数
	 * @param account 搜索条件
	 * @return 返回搜索到的记录总数
	 */
	Integer searchCount(Account account);
}
