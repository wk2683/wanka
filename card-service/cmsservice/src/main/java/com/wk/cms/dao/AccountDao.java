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
			"(id, account_name, user_name, password, card_no, web_user_name, web_password, seg, create_time, update_time, opt_id) VALUES \n" +
			"(#{id}, #{accountName}, #{userName}, #{password}, #{cardNo}, #{webUserName}, #{webPassword}, #{seg}, #{createTime}, #{updateTime}, #{optId}); ")
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
	@Select(" SELECT * FROM wk.wk_account WHERE ID=#{id} ")
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
}
