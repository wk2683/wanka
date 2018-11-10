package com.wk.cms.dao;

import com.wk.entity.Bank;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface BankDao {

    @Insert("  INSERT INTO wk.wk_bank(id, name, nick_name, seg, remark) VALUES \n" +
            "(#{id},#{name},#{nickName},#{seg},#{remark})\n ")
    Integer add(Bank bank);

    /**
     * 加载所有银行信息
     * @return
     */
    @Select(" SELECT id,name,nick_name nickName,seg,remark FROM wk_bank ORDER BY seg DESC  ")
    List<Bank> load();


}
