package com.wk.cms.dao;

import com.wk.entity.Permission;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 权限操作数据库接口
 */
public interface PermissionDao {
	/**
     * 增
	 * @param permission
     * @return
     */
	@Insert(" INSERT INTO wk.wk_permission(id, model_id, name, action, opt_type, remark, seg, create_time, update_time, opt_id) VALUES \n" +
            "(#{id}, #{modelId}, #{name}, #{action}, #{optType}, #{remark}, #{seg}, #{createTime}, #{updateTime}, #{optId}) ")
	Integer add(Permission permission);

    /**
     * 删
	 * @param id
     * @return
     */
	@Delete(" DELETE FROM wk.wk_permission WHERE ID=#{id} ")
	Integer delete(String id);

    /**
     * 查
	 * @param id
     * @return
     */
	@Select(" SELECT  id, model_id modelId, name, action, opt_type optType, remark, seg, create_time createTime, update_time updateTime, opt_id optId  FROM wk.wk_permission WHERE ID=#{id} ")
	Permission get(String id);

	/**
     * 改
	 * @param permission
     * @return
     */
	Integer update(Permission permission);

    /**
     * 搜索
	 * @param permission
     * @return
     */
	List<Permission> search(Permission permission);

	/**
	 * 搜索记录总数
	 * @param permission 搜索条件
	 * @return 返回搜索到的记录总数
	 */
	Integer searchCount(Permission permission);
}
