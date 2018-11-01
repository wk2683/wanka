package com.wk.cms.controller;

import com.wk.bean.BaseResponse;
import com.wk.cms.service.BankService;
import com.wk.entity.Bank;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 银行信息控制类
 */
@RestController
@RequestMapping("/bank")
public class BankController extends  BaseController{
    @Autowired
    private BankService bankService;

    /**
     * 加载所有银行信息
     * @return
     */
    @RequestMapping(value = "/load")
    @ResponseBody
    @CrossOrigin
    public BaseResponse load(){
        List<Bank> banks = bankService.load();
        return responseSearch(banks,0,null, this.getClass());
    }
}
