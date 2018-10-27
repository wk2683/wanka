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
	@Insert(" INSERT INTO wk_org (id,name,parents,parent_id,remark,seg,create_time,update_time,opt_id) " +
			" VALUES(#{id},#{name},#{parents},#{parentId},#{remark},#{seg},NOW(),NOW(),#{optId}) ")
	Integer add(Org org);

	/**
	 * 删
	 * @param id
	 * @return
	 */
	@Delete(" DELETE FROM wk_org WHERE ID=#{id} ")
	Integer delete(String id);

	/**
	 * 查
	 * @param id
	 * @return
	 */
	@Select(" SELECT * FROM wk_org WHERE ID=#{id} ")
	Org get(String id);

	/**
	 * 改
	 * @param org
	 * @return
	 */
	Integer update(Org org);

	/**
	 * 搜索
	 * @param org
	 * @return
	 */
	List<Org> search(Org org);
}
