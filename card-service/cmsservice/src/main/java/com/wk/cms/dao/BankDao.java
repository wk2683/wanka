package com.wk.cms.dao;

import com.wk.entity.Bank;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface BankDao {
    /**
     * 加载所有银行信息
     * @return
     */
    @Select(" SELECT id,name,nick_name nickName,seg,remark FROM wk_bank ORDER BY seg DESC  ")
    List<Bank> load();
}
