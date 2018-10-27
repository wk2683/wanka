package com.wk.cms.controller;

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
public class RateController {
    @Autowired
    private RateService rateService;

    @RequestMapping(value = "/add",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public String add(Rate rate ){
        String id = rateService .add(rate );
        return id;
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public Boolean delete(String id){
        Integer affectRow = rateService .delete(id);
        if (affectRow>0) {
            return true;
        }
        return false;
    }

    @RequestMapping(value = "/update",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public Boolean update(Rate rate ){
        Integer affectRow = rateService .update(rate );
        if (affectRow>0) {
            return true;
        }
        return false;
    }

    @RequestMapping(value = "/get",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public Rate  add(String id){
        Rate rate  = rateService .get(id);
        return rate ;
    }

    @RequestMapping(value = "/search",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public List<Rate > search(Rate rate ){
        List<Rate> rates = rateService .search(rate );
        return rates;
    }
}
