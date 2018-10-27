package com.wk.cms.controller;

import com.wk.cms.service.OrderTypeService;
import com.wk.entity.OrderType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 订单类型信息控制类
 */
@RestController
@RequestMapping("/orderType")
public class OrderTypeController {
    @Autowired
    private OrderTypeService orderTypeService;

    @RequestMapping(value = "/add",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public String add(OrderType orderType){
        String id = orderTypeService.add(orderType);
        return id;
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public Boolean delete(String id){
        Integer affectRow = orderTypeService.delete(id);
        if (affectRow>0) {
            return true;
        }
        return false;
    }

    @RequestMapping(value = "/update",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public Boolean update(OrderType orderType){
        Integer affectRow = orderTypeService.update(orderType);
        if (affectRow>0) {
            return true;
        }
        return false;
    }

    @RequestMapping(value = "/get",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public OrderType add(String id){
        OrderType orderType = orderTypeService.get(id);
        return orderType;
    }

    @RequestMapping(value = "/search",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public List<OrderType> search(OrderType orderType){
        List<OrderType> orderTypes = orderTypeService.search(orderType);
        return orderTypes;
    }
}
