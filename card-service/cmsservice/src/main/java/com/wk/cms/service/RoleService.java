package com.wk.cms.service;

import com.wk.entity.Role;

import java.util.List;

/**
 * 角色服务接口
 */
public interface RoleService {

    /**
     * 增
     * @param role
     * @return
     */
    String add(Role role);

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
    Role get(String id);

    /**
     * 改
     * @param role
     * @return
     */
    Integer update(Role role);

    /**
     * 搜索
     * @param role
     * @return
     */
    List<Role> search(Role role);

    /**
     * 统计搜索的总记录数
     * @param role
     * @return
     */
    Integer searchCount(Role role);
}
