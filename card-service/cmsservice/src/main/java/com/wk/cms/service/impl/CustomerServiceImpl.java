package com.wk.cms.service.impl;

import com.wk.cms.dao.CustomerDao;
import com.wk.cms.service.CustomerService;
import com.wk.entity.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * 客户服务实现类
 */
@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerDao customerDao;

    @Override
    public String add(Customer customer) {
        customer.addInit();
        Integer addRow = customerDao.add(customer);
        if(addRow>0){
            return customer.getId();
        }else {
            return "";
        }
    }

    @Override
    public Integer delete(String id) {
        return customerDao.delete(id);
    }

    @Override
    public Customer get(String id) {
        return customerDao.get(id);
    }

    @Override
    public Integer update(Customer customer) {
        return customerDao.update(customer);
    }

    @Override
    public List<Customer> search(Customer customer) {
        return customerDao.search(customer);
    }
}
