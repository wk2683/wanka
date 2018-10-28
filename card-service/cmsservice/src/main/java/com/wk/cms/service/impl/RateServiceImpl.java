package com.wk.cms.service.impl;

import com.wk.cms.dao.RateDao;
import com.wk.cms.service.RateService;
import com.wk.entity.Rate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 费率信息服务实现类
 */
@Service
public class RateServiceImpl implements RateService {
    @Autowired
    private RateDao rateDao;
    @Override
    public String add(Rate rate) {
        rate.addInit();
        Integer addRow = rateDao.add(rate);
        if(addRow>0){
            return rate.getId();
        }else {
            return "";
        }
    }

    @Override
    public Integer delete(String id) {
        return rateDao.delete(id);
    }

    @Override
    public Rate get(String id) {
        return rateDao.get(id);
    }

    @Override
    public Integer update(Rate rate) {
        return rateDao.update(rate);
    }

    @Override
    public List<Rate> search(Rate rate) {
        return rateDao.search(rate);
    }

    @Override
    public Integer searchCount(Rate rate) {
        return rateDao.searchCount(rate);
    }
}
