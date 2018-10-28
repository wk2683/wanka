package com.wk.cms.controller;

import com.wk.bean.BaseResponse;
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
public class OrderTypeController extends  BaseController {
    @Autowired
    private OrderTypeService orderTypeService;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse add(OrderType orderType){
        String id = orderTypeService.add(orderType);
        return responseAdd(orderType,id,this.getClass());
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse delete(String id){
        Integer affectRow = orderTypeService.delete(id);
        return responseDelete(affectRow,id,this.getClass());
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse update(OrderType orderType){
        Integer affectRow = orderTypeService.update(orderType);
        return responseUpdate(affectRow,orderType,this.getClass());
    }

    @RequestMapping(value = "/get",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse get(String id){
        OrderType orderType = orderTypeService.get(id);
        return responseGet(orderType,this.getClass());
    }

    @RequestMapping(value = "/search",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse search(OrderType orderType){
        List<OrderType> orderTypes = orderTypeService.search(orderType);
        Integer total = 0;
        if(orderType.getPage()==1){
            total = orderTypeService.searchCount(orderType);
        }
        return responseSearch(orderTypes,total,orderType, this.getClass());
    }
}
