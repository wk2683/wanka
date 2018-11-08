package com.wk.cms.service.impl;

import com.wk.cms.dao.OrderImportDao;
import com.wk.cms.service.OrderImportService;
import com.wk.entity.OrderImport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 订单服务实现类
 */
@Service
public class OrderImportServiceImpl implements OrderImportService {
    @Autowired
    private OrderImportDao orderImportDao;
    @Override
    public String add(OrderImport orderImport) {
        orderImport.addInit();

        Integer addRow = orderImportDao.add(orderImport);
        if(addRow>0){
            return orderImport.getId();
        }else {
            return "";
        }
    }

    @Override
    public Integer delete(String id,String optId) {
        return orderImportDao.delete(id);
    }

    @Override
    public OrderImport get(String id) {
        return orderImportDao.get(id);
    }

    @Override
    public Integer update(OrderImport orderImport) {
        orderImport.updateInit();
        return orderImportDao.update(orderImport);
    }

    @Override
    public List<OrderImport> search(OrderImport orderImport) {
        return orderImportDao.search(orderImport);
    }

    @Override
    public Integer searchCount(OrderImport orderImport) {
        return orderImportDao.searchCount(orderImport);
    }
}
