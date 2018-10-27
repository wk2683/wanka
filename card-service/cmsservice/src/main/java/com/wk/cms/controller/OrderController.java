package com.wk.cms.controller;

import com.wk.cms.service.OrderService;
import com.wk.entity.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 订单信息控制类
 */
@RestController
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public String add(Order order){
        String id = orderService.add(order);
        return id;
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public Boolean delete(String id){
        Integer affectRow = orderService.delete(id);
        if (affectRow>0) {
            return true;
        }
        return false;
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public Boolean update(Order order){
        Integer affectRow = orderService.update(order);
        if (affectRow>0) {
            return true;
        }
        return false;
    }

    @RequestMapping(value = "/get",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public Order add(String id){
        Order order = orderService.get(id);
        return order;
    }

    @RequestMapping(value = "/search",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public List<Order> search(Order order){
        List<Order> orders = orderService.search(order);
        return orders;
    }
}
