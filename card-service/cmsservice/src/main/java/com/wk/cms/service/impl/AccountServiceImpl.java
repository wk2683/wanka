package com.wk.cms.service.impl;

import com.wk.cms.dao.AccountDao;
import com.wk.cms.service.AccountService;
import com.wk.entity.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * 账户信息服务实现类
 */
@Service
public class AccountServiceImpl implements AccountService {
    @Autowired
    private AccountDao accountDao;
    @Override
    public String add(Account account) {
        account.addInit();
        Integer addRow = accountDao.add(account);
        if(addRow>0){
            return account.getId();
        }else {
            return "";
        }

    }

    @Override
    public Integer delete(String id) {
        return accountDao.delete(id);
    }

    @Override
    public Account get(String id) {
        return accountDao.get(id);
    }

    @Override
    public Integer update(Account account) {
        return accountDao.update(account);
    }

    @Override
    public List<Account> search(Account account) {
        return accountDao.search(account);
    }
}
