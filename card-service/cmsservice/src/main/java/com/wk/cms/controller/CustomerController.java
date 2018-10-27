package com.wk.cms.controller;

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
public class CustomerController {
    @Autowired
    private CustomerService customerService;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public String add(Customer customer){
        String id = customerService.add(customer);
        return id;
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public Boolean delete(String id){
        Integer affectRow = customerService.delete(id);
        if (affectRow>0) {
            return true;
        }
        return false;
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public Boolean update(Customer customer){
        Integer affectRow = customerService.update(customer);
        if (affectRow>0) {
            return true;
        }
        return false;
    }

    @RequestMapping(value = "/get",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public Customer add(String id){
        Customer account = customerService.get(id);
        return account;
    }

    @RequestMapping(value = "/search",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public List<Customer> search(Customer customer){
        List<Customer> customers = customerService.search(customer);
        return customers;
    }
}
