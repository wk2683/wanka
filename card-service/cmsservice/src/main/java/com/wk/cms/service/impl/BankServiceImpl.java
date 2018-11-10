package com.wk.cms.service.impl;

import com.wk.cms.dao.BankDao;
import com.wk.cms.service.BankService;
import com.wk.entity.Bank;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 银行服务实现类
 */
@Service
public class BankServiceImpl implements BankService {

    @Autowired
    private BankDao bankDao;


    @Override
    public String add(Bank bank) {
        bank.addInit();
        Integer affectRow = bankDao.add(bank);
        if(affectRow>0){
            return  bank.getId();
        }else{
            return "";
        }
    }

    @Override
    public List<Bank> load() {
        return bankDao.load();
    }
}
