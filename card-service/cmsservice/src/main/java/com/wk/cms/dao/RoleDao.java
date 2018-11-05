package com.wk.cms.dao;

import com.wk.entity.Role;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 角色操作数据库接口
 */
public interface RoleDao  {

    /**
     * 增
     * @param role
     * @return
     */
    @Insert(" INSERT INTO wk_role(id,name,remark,seg,create_time,update_time,opt_id)VALUES" +
            "(#{id},#{name},#{remark},#{seg},#{createTime},#{updateTime},#{optId}) ")
    Integer add(Role role);

    /**
     * 删
     * @param id
     * @return
     */
    @Delete(" DELETE FROM wk.wk_role WHERE ID=#{id} ")
    Integer delete(String id);

    /**
     * 查
     * @param id
     * @return
     */
    @Select(" SELECT  id,name,remark,seg,create_time createTime, update_time updateTime, opt_id optId  FROM wk.wk_role WHERE ID=#{id} ")
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
     * 搜索统计数记录数
     * @param role
     * @return
     */
    Integer searchCount(Role role);

    /**
     * 根据角色id查所有模块ID
     * @param roleId
     * @return
     */
    @Select(" SELECT model_id FROM wk.wk_role_model WHERE role_id=#{roleId} ")
    List<String> getModelIds(String roleId);

    /**
     * 根据角色id查所有权限ID
     * @param roleId
     * @return
     */
    @Select(" SELECT permission_id FROM wk.wk_role_permission WHERE role_id=#{roleId} ")
    List<String> getPermissionIds(String roleId);

    /**
     * 选择权限
     * @param roleId
     * @param permissionId
     * @return
     */
    @Insert(" INSERT INTO wk.wk_role_permission(role_id, permission_id) VALUES (#{roleId}, #{permissionId}) ")
    Integer selectPermission(@Param("roleId") String roleId, @Param("permissionId")String permissionId);

    /**
     * 取消选择权限
     * @param roleId
     * @param permissionId
     * @return
     */
    @Delete(" DELETE FROM wk.wk_role_permission WHERE role_id=#{roleId} AND permission_id=#{permissionId} ")
    Integer unselectPermission(@Param("roleId") String roleId, @Param("permissionId")String permissionId);

    /**
     * 选择模块
     * @param roleId
     * @param modelId
     * @return
     */
    @Insert("INSERT INTO wk.wk_role_model(role_id, model_id) VALUES (#{roleId}, #{modelId}) ")
    Integer selectModel(@Param("roleId") String roleId, @Param("modelId")String modelId);

    /**
     * 取消选择模块
     * @param roleId
     * @param modelId
     * @return
     */
    @Delete(" DELETE FROM wk.wk_role_model WHERE role_id=#{roleId} AND permission_id=#{modelId} ")
    Integer unselectModel(@Param("roleId") String roleId, @Param("modelId")String modelId);
}
