package com.wk.cms.controller;

import com.wk.bean.BaseResponse;
import com.wk.cms.service.CardService;
import com.wk.entity.Card;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 信用卡信息控制类
 */
@RestController
@RequestMapping("/card")
public class CardController  extends  BaseController{
    @Autowired
    private CardService cardService;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse  add(@RequestBody  Card card){
        String id = cardService.add(card);
        return responseAdd(card,id,this.getClass());
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse delete(String id){
        Integer affectRow = cardService.delete(id);
        return responseDelete(affectRow,id,this.getClass());
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse update(@RequestBody Card card){
        Integer affectRow = cardService.update(card);
        return responseUpdate(affectRow,card,this.getClass());
    }

    @RequestMapping(value = "/get",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse get(String id){
        Card card = cardService.get(id);
        return responseGet(card,this.getClass());
    }

    @RequestMapping(value = "/search",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse search(Card card){
        List<Card> cards = cardService.search(card);
        Integer total = 0;
        if(card.getPage()==1){
            total = cardService.searchCount(card);
        }
        return responseSearch(cards,total,card, this.getClass());
    }

    /**
     * 锁与解锁卡操作
     * @param card {id,lock,lock_worker_id,update_time,opt_id}
     * @return
     */
    @RequestMapping(value = "/lock",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse lock(@RequestBody Card card){
        Integer affectRow = cardService.lock(card);
        return responseUpdate(affectRow,card,this.getClass());
    }

}
