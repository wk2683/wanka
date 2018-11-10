package com.wk.cms.controller;

import com.wk.bean.BaseResponse;
import com.wk.cms.service.BankService;
import com.wk.cms.service.MallService;
import com.wk.entity.Bank;
import com.wk.entity.Mall;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 商户信息控制类
 */
@RestController
@RequestMapping("/mall")
public class MallController extends  BaseController{
    @Autowired
    private MallService mallService;


    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse  add(@RequestBody Mall mall){
        String id = mallService.add(mall);
        return responseAdd(mall,id,this.getClass());
    }

    /**
     * 加载所有商户信息
     * @return
     */
    @RequestMapping(value = "/load")
    @ResponseBody
    @CrossOrigin
    public BaseResponse load(){
        List<Mall> malls = mallService.load();
        return responseSearch(malls,0,null, this.getClass());
    }
}
