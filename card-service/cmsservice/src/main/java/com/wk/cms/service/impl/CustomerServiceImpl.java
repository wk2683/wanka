package com.wk.cms.service.impl;

import com.wk.cms.dao.CustomerDao;
import com.wk.cms.service.CustomerService;
import com.wk.cms.util.FileUtil;
import com.wk.entity.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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

    /**
     * 客户图片文件总路径
     */
    @Value("${config.upload.customer}")
    private String customerSourcePath;

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
        customer.updateInit();
        return customerDao.update(customer);
    }

    @Override
    public List<Customer> search(Customer customer) {
        return customerDao.search(customer);
    }

    @Override
    public Integer searchCount(Customer customer) {
        return customerDao.searchCount(customer);
    }

    @Override
    public String uploadImg(MultipartFile file, String userId, String id) {
        if(id == null || id.trim().length()==0 ) {
            id = UUID.randomUUID().toString();
        }
        return FileUtil.uploadImg(file,customerSourcePath,id);
    }
}
