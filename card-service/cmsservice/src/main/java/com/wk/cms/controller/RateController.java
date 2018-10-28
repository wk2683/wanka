package com.wk.cms.controller;

import com.wk.bean.BaseResponse;
import com.wk.cms.service.RateService;
import com.wk.entity.Rate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 费率信息控制类
 */
@RestController
@RequestMapping("/rate")
public class RateController  extends  BaseController{
    @Autowired
    private RateService rateService;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse add(Rate rate ){
        String id = rateService .add(rate );
        return responseAdd(rate,id,this.getClass());
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse delete(String id){
        Integer affectRow = rateService .delete(id);
        return responseDelete(affectRow,id,this.getClass());
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse update(Rate rate ){
        Integer affectRow = rateService .update(rate );
        return responseUpdate(affectRow,rate,this.getClass());
    }

    @RequestMapping(value = "/get",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse  get(String id){
        Rate rate  = rateService .get(id);
        return responseGet(rate,this.getClass());
    }

    @RequestMapping(value = "/search",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse search(Rate rate ){
        List<Rate> rates = rateService .search(rate );
        Integer total = 0;
        if(rate.getPage()==1){
            total = rateService.searchCount(rate);
        }
        return responseSearch(rates,total,rate, this.getClass());
    }
}
