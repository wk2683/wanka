package com.wk.cms.controller;

import com.wk.bean.BaseResponse;
import com.wk.cms.service.OrderImportService;
import com.wk.entity.OrderImport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 订单出账信息控制类
 */
@RestController
@RequestMapping("/orderImport")
public class OrderImportController extends  BaseController{
    @Autowired
    private OrderImportService orderImportService;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse  add(@RequestBody OrderImport orderImport){
        String id = orderImportService.add(orderImport);
        return responseAdd(orderImport,id,this.getClass());
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse delete(@RequestParam("id")String id,@RequestParam("optId")String optId){
        Integer affectRow = orderImportService.delete(id,optId);
        return responseDelete(affectRow,id,this.getClass());
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse update(@RequestBody OrderImport orderImport){
        Integer affectRow = orderImportService.update(orderImport);
        return responseUpdate(affectRow,orderImport,this.getClass());
    }

    @RequestMapping(value = "/get",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse get(String id){
        OrderImport order = orderImportService.get(id);
        return responseGet(order,this.getClass());
    }

    @RequestMapping(value = "/search",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse search(OrderImport orderImport){
        List<OrderImport> orderImports = orderImportService.search(orderImport);
        Integer total = 0;
        if(orderImport.getPage()==1){
            total = orderImportService.searchCount(orderImport);
        }
        return responseSearch(orderImports,total,orderImport, this.getClass());
    }
}
