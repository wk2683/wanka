package com.wk.cms.controller;

import com.wk.bean.BaseResponse;
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
public class OrderController  extends  BaseController{
    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse  add(@RequestBody Order order){
        String id = orderService.add(order);
        return responseAdd(order,id,this.getClass());
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse delete(String id){
        Integer affectRow = orderService.delete(id);
        return responseDelete(affectRow,id,this.getClass());
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse update(@RequestBody Order order){
        Integer affectRow = orderService.update(order);
        return responseUpdate(affectRow,order,this.getClass());
    }

    @RequestMapping(value = "/get",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse get(String id){
        Order order = orderService.get(id);
        return responseGet(order,this.getClass());
    }

    @RequestMapping(value = "/search",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse search(Order order){
        List<Order> orders = orderService.search(order);
        Integer total = 0;
        if(order.getPage()==1){
            total = orderService.searchCount(order);
        }
        return responseSearch(orders,total,order, this.getClass());
    }
}
