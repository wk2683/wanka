package com.wk.cms.dao;

import com.wk.entity.Org;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * 组织操作数据库接口
 */
public interface OrgDao {
	/**
	 * 增
	 * @param org
	 * @return
	 */
	@Insert(" INSERT INTO wk.wk_org (id,name,parents,parent_id,remark,seg,create_time,update_time,opt_id) " +
			" VALUES(#{id},#{name},#{parents},#{parentId},#{remark},#{seg},#{createTime}, #{updateTime},#{optId}) ")
	Integer add(Org org);

	/**
	 * 删
	 * @param id
	 * @return
	 */
	@Delete(" DELETE FROM wk.wk_org WHERE ID=#{id} ")
	Integer delete(String id);

	/**
	 * 查
	 * @param id
	 * @return
	 */
	@Select(" SELECT  id,name,parents,parent_id parentId,remark,seg,create_time createTime,update_time updateTime,opt_id optId   FROM wk.wk_org WHERE ID=#{id} ")
	Org get(String id);

	/**
	 * 改
	 * @param org
	 * @return
	 */
	Integer update(Org org);

	/**
	 * 搜索
	 * @param org 搜索条件
	 * @return 返回搜索到的数据
	 */
	List<Org> search(Org org);

	/**
	 * 搜索记录总数
	 * @param org 搜索条件
	 * @return 返回搜索到的记录总数
	 */
	Integer searchCount(Org org);

	/**
	 * 查询所有子组织
	 * @param orgId
	 * @return
	 */
	@Select(" SELECT  id,name,parents,parent_id parentId,remark,seg,create_time createTime,update_time updateTime,opt_id optId   FROM wk.wk_org " +
			"WHERE parents LIKE LIKE CONCAT(CONCAT('%', #{orgId}),'%') ")
	List<Org> getByParentId(String orgId);

	/**
	 * 删除所有子组织
	 * @param orgId
	 */
	@Delete(" DELETE FROM parents LIKE LIKE CONCAT(CONCAT('%', #{orgId}),'%') ")
	Integer deleteByParentId(String orgId);
}
