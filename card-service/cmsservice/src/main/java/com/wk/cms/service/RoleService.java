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

    /**
     * 查询角色下的模块ID和权限ID
     * @param roleId
     * @return
     */
    List<String> getModelPermission(String roleId);

    /**
     * 选择权限
     * @param roleId
     * @param permissionId
     * @return
     */
    Integer selectPermission(String roleId, String permissionId);

    /**
     * 取消选择权限
     * @param roleId
     * @param permissionId
     * @return
     */
    Integer unselectPermission(String roleId, String permissionId);

    /**
     * 选择模块
     * @param roleId
     * @param modeId
     * @return
     */
    Integer selectModel(String roleId, String modeId);

    /**
     * 取消选择模块
     * @param roleId
     * @param modeId
     * @return
     */
    Integer unselectModel(String roleId, String modeId);
}
