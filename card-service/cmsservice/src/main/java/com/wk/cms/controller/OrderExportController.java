package com.wk.cms.controller;

import com.wk.bean.BaseResponse;
import com.wk.cms.service.OrderExportService;
import com.wk.entity.OrderExport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 订单出账信息控制类
 */
@RestController
@RequestMapping("/orderExport")
public class OrderExportController extends  BaseController{
    @Autowired
    private OrderExportService orderExportService;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse  add(@RequestBody OrderExport orderExport){
        String id = orderExportService.add(orderExport);
        return responseAdd(orderExport,id,this.getClass());
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse delete(@RequestParam("id")String id,@RequestParam("optId")String optId){
        Integer affectRow = orderExportService.delete(id,optId);
        return responseDelete(affectRow,id,this.getClass());
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse update(@RequestBody OrderExport orderExport){
        Integer affectRow = orderExportService.update(orderExport);
        return responseUpdate(affectRow,orderExport,this.getClass());
    }

    @RequestMapping(value = "/get",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse get(String id){
        OrderExport order = orderExportService.get(id);
        return responseGet(order,this.getClass());
    }

    @RequestMapping(value = "/search",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse search(OrderExport orderExport){
        List<OrderExport> orderExports = orderExportService.search(orderExport);
        Integer total = 0;
        if(orderExport.getPage()==1){
            total = orderExportService.searchCount(orderExport);
        }
        return responseSearch(orderExports,total,orderExport, this.getClass());
    }
}
