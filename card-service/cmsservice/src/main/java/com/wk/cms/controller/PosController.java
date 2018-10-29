package com.wk.cms.controller;

import com.wk.bean.BaseResponse;
import com.wk.cms.service.PosService;
import com.wk.entity.Pos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * POS机信息控制类
 */
@RestController
@RequestMapping("/pos")
public class PosController extends  BaseController {
    @Autowired
    private PosService posService;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse  add(@RequestBody Pos pos ){
        String id = posService .add(pos );
        return responseAdd(pos,id,this.getClass());
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse delete(String id){
        Integer affectRow = posService .delete(id);
        return responseDelete(affectRow,id,this.getClass());
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse update(@RequestBody Pos pos ){
        Integer affectRow = posService .update(pos );
        return responseUpdate(affectRow,pos,this.getClass());
    }

    @RequestMapping(value = "/get",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse  get(String id){
        Pos pos  = posService .get(id);
        return responseGet(pos,this.getClass());
    }

    @RequestMapping(value = "/search",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse search(Pos pos ){
        List<Pos > poss = posService .search(pos );
        Integer total = 0;
        if(pos.getPage()==1){
            total = posService.searchCount(pos);
        }
        return responseSearch(poss,total,pos, this.getClass());
    }
}
