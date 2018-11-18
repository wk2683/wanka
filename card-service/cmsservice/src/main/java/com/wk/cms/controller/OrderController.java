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
    public BaseResponse delete(@RequestParam("id")String id,@RequestParam("optId")String optId){
        Integer affectRow = orderService.delete(id,optId);
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

    @RequestMapping(value = "/search",method = RequestMethod.GET)
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


    //----------------以上是基础操作--------------------

    /**
     * 订单修改为完成
     * @param order
     * @return
     */
    @RequestMapping(value = "/updateStatus2",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse updateStatus2(@RequestBody Order order){
        Integer affectRow = orderService.update(order);
        return responseUpdate(affectRow,order,this.getClass());
    }
    /**
     * 订单修改为业务中
     * @param order
     * @return
     */
    @RequestMapping(value = "/updateStatus3",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse updateStatus3(@RequestBody Order order){
        Integer affectRow = orderService.update(order);
        return responseUpdate(affectRow,order,this.getClass());
    }
    /**
     * 订单修改为操作完成
     * @param order
     * @return
     */
    @RequestMapping(value = "/updateStatus4",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse updateStatus4(@RequestBody Order order){
        Integer affectRow = orderService.update(order);
        return responseUpdate(affectRow,order,this.getClass());
    }


    /**
     * 查询等待还款订单
     * @param order
     * @return
     */
    @RequestMapping(value = "/repayment",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse repayment(Order order){
        List<Order> orders = orderService.search(order);
        Integer total = 0;
        if(order.getPage()==1){
            total = orderService.searchCount(order);
        }
        return responseSearch(orders,total,order, this.getClass());
    }
}
