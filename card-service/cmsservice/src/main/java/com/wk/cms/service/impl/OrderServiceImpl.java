package com.wk.cms.service.impl;

import com.wk.cms.dao.OrderDao;
import com.wk.cms.service.OrderService;
import com.wk.entity.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 订单服务实现类
 */
@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderDao orderDao;
    @Override
    public String add(Order order) {
        order.addInit();
        order.setStatus(1);
        Integer addRow = orderDao.add(order);
        if(addRow>0){
            return order.getId();
        }else {
            return "";
        }
    }

    @Override
    public Integer delete(String id,String optId) {
        return orderDao.delete(id,optId);
    }

    @Override
    public Order get(String id) {
        return orderDao.get(id);
    }

    @Override
    public Integer update(Order order) {
        order.updateInit();
        return orderDao.update(order);
    }

    @Override
    public List<Order> search(Order order) {
        return orderDao.search(order);
    }

    @Override
    public Integer searchCount(Order order) {
        return orderDao.searchCount(order);
    }
}
