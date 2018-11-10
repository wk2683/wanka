package com.wk.cms.service;

import com.wk.entity.Permission;


import java.util.List;

/**
 * 权限服务接口
 */
public interface PermissionService {
	/**
	 * 增
	 * @param permission
	 * @return
	 */
	String add(Permission permission);

	/**
	 * 删
	 * @param id
	 * @return
	 */
	Integer delete(String id);

	/**
	 * 查
	 * @param id
	 * @return
	 */
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

	Integer searchCount(Permission permission);

	/**
	 * 获取一个角色一的所有权限action
	 * @param roleId
	 * @return 返回所有权限的action 集合
	 */
	List<String> getUserActionInRole(String roleId);
}
