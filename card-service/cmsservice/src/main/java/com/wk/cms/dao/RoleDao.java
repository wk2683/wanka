package com.wk.cms.dao;

import com.wk.entity.Role;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
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
    @Delete(" DELETE FROM wk.wk_rate WHERE ID=#{id} ")
    Integer delete(String id);

    /**
     * 查
     * @param id
     * @return
     */
    @Select(" SELECT * FROM wk.wk_rate WHERE ID=#{id} ")
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
}
