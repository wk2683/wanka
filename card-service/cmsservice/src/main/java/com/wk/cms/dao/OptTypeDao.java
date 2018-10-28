package com.wk.cms.dao;

import com.wk.entity.OptType;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 操作类型数据库接口
 */
public interface OptTypeDao {
	/**
     * 增
	 * @param optType
     * @return
     */
	@Insert(" INSERT INTO wk.wk_opt_type(id, name, remark, seg, create_time, update_time, opt_id) VALUES \n" +
			"(#{id}, #{name}, #{remark}, #{seg}, #{create_time}, #{update_time}, #{opt_id}) ")
	Integer add(OptType optType);

    /**
     * 删
	 * @param id
     * @return
     */
	@Delete(" DELETE FROM wk.wk_opt_type WHERE ID=#{id} ")
	Integer delete(String id);

    /**
     * 查
	 * @param id
     * @return
     */
	@Select(" SELECT * FROM wk.wk_opt_type WHERE ID=#{id} ")
	OptType get(String id);

	/**
     * 改
	 * @param optType
     * @return
     */
	Integer update(OptType optType);

    /**
     * 搜索
	 * @param optType
     * @return
     */
	List<OptType> search(OptType optType);

	/**
	 * 搜索记录总数
	 * @param optType 搜索条件
	 * @return 返回搜索到的记录总数
	 */
	Integer searchCount(OptType optType);
}
