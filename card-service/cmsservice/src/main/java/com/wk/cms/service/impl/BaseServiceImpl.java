package com.wk.cms.service.impl;

import com.wk.bean.Page;
import com.wk.cms.dao.BaseDao;
import com.wk.cms.service.BaseService;
import com.wk.entity.BaseEntity;
import com.wk.entity.Role;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.UUID;

/**
 * 通用服务实现
 */
public class  BaseServiceImpl<T extends BaseEntity> implements BaseService<T>{

    @Autowired
    private BaseDao<T> dao;

    @Override
    public Integer add(T t) {
        t.setId(UUID.randomUUID().toString());
        Date curr = new Date();
        t.setCreateTime(curr);
        t.setUpdateTime(curr);

        return dao.add(t);
    }

    @Override
    public Integer delete(String id) {
        return dao.delete(id);
    }

    @Override
    public Integer update(T t) {
        return dao.update(t);
    }

    @Override
    public T getById(String id) {
        return dao.getById(id);
    }

    @Override
    public Page<T> search(T t) {
        return null;
    }
}
