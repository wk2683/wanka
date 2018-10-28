package com.wk.cms.controller;

import com.wk.bean.BaseResponse;
import com.wk.cms.service.CustomerService;
import com.wk.entity.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 客户信息控制类
 */
@RestController
@RequestMapping("/customer")
public class CustomerController  extends  BaseController{
    @Autowired
    private CustomerService customerService;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse add(Customer customer){
        String id = customerService.add(customer);
        return responseAdd(customer,id,this.getClass());
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse delete(String id){
        Integer affectRow = customerService.delete(id);
        return responseDelete(affectRow,id,this.getClass());
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse update(Customer customer){
        Integer affectRow = customerService.update(customer);
        return responseUpdate(affectRow,customer,this.getClass());
    }

    @RequestMapping(value = "/get",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse add(String id){
        Customer customer = customerService.get(id);
        return responseGet(customer,this.getClass());
    }

    @RequestMapping(value = "/search",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse search(Customer customer){
        List<Customer> customers = customerService.search(customer);
        Integer total = 0;
        if(customer.getPage()==1){
            total = customerService.searchCount(customer);
        }
        return responseSearch(customers,total,customer, this.getClass());
    }
}
