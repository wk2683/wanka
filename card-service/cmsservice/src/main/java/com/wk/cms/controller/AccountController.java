package com.wk.cms.controller;

import com.wk.bean.BaseResponse;
import com.wk.cms.service.AccountService;
import com.wk.entity.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 资金账户信息控制类
 */
@RestController
@RequestMapping("/account")
public class AccountController extends  BaseController{
    @Autowired
    private AccountService accountService;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse  add(@RequestBody  Account account){
        String id = accountService.add(account);
        return responseAdd(account,id,this.getClass());
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse delete(String id){
        Integer affectRow = accountService.delete(id);
        return responseDelete(affectRow,id,this.getClass());
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse update(@RequestBody Account account){
        Integer affectRow = accountService.update(account);
        return responseUpdate(affectRow,account,this.getClass());
    }

    @RequestMapping(value = "/get",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse get(String id){
        Account account = accountService.get(id);
        return responseGet(account,this.getClass());
    }

    @RequestMapping(value = "/search",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse search(Account account){
        List<Account> accounts = accountService.search(account);
        Integer total = 0;
        if(account.getPage()==1){
            total = accountService.searchCount(account);
        }
        return responseSearch(accounts,total,account, this.getClass());
    }
}
