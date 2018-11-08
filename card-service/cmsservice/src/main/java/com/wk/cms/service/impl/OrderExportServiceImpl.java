package com.wk.cms.service.impl;

import com.wk.cms.dao.OrderExportDao;
import com.wk.cms.service.OrderExportService;
import com.wk.entity.OrderExport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 订单服务实现类
 */
@Service
public class OrderExportServiceImpl implements OrderExportService {
    @Autowired
    private OrderExportDao orderExportDao;
    @Override
    public String add(OrderExport orderExport) {
        orderExport.addInit();

        Integer addRow = orderExportDao.add(orderExport);
        if(addRow>0){
            return orderExport.getId();
        }else {
            return "";
        }
    }

    @Override
    public Integer delete(String id,String optId) {
        return orderExportDao.delete(id);
    }

    @Override
    public OrderExport get(String id) {
        return orderExportDao.get(id);
    }

    @Override
    public Integer update(OrderExport orderExport) {
        orderExport.updateInit();
        return orderExportDao.update(orderExport);
    }

    @Override
    public List<OrderExport> search(OrderExport orderExport) {
        return orderExportDao.search(orderExport);
    }

    @Override
    public Integer searchCount(OrderExport orderExport) {
        return orderExportDao.searchCount(orderExport);
    }
}
