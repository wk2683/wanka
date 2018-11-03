package com.wk.cms.service.impl;

import com.wk.cms.dao.OrderTypeDao;
import com.wk.cms.service.OrderTypeService;
import com.wk.entity.OrderType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 订单类型服务实现类
 */
@Service
public class OrderTypeServiceImpl implements OrderTypeService {
    @Autowired
    private OrderTypeDao orderTypeDao;
    @Override
    public String add(OrderType orderType) {
        orderType.addInit();
        Integer addRow = orderTypeDao.add(orderType);
        if(addRow>0){
            return orderType.getId();
        }else {
            return "";
        }
    }

    @Override
    public Integer delete(String id) {
        return orderTypeDao.delete(id);
    }

    @Override
    public OrderType get(String id) {
        return orderTypeDao.get(id);
    }

    @Override
    public Integer update(OrderType orderType) {
        orderType.updateInit();
        return orderTypeDao.update(orderType);
    }

    @Override
    public List<OrderType> search(OrderType orderType) {
        return orderTypeDao.search(orderType);
    }

    @Override
    public Integer searchCount(OrderType orderType) {
        return orderTypeDao.searchCount(orderType);
    }
}
