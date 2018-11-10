package com.wk.cms.dao;

import com.wk.entity.Mall;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 商户数据库操作接口
 */
public interface MallDao {

    @Insert("  INSERT INTO wk.wk_mall(id, name, nick_name, seg, remark) VALUES \n" +
            "(#{id},#{name},#{nickName},#{seg},#{remark})\n ")
    Integer add(Mall mall);

    /**
     * 加载所有商户信息
     * @return
     */
    @Select(" SELECT id,name,nick_name nickName,seg,remark FROM wk.wk_mall ORDER BY seg DESC  ")
    List<Mall> load();


}
