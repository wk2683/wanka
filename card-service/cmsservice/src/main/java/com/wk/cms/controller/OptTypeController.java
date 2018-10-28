package com.wk.cms.controller;

import com.wk.bean.BaseResponse;
import com.wk.cms.service.OptTypeService;
import com.wk.entity.OptType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 操作类型信息控制类
 */
@RestController
@RequestMapping("/optType")
public class OptTypeController  extends  BaseController{
    @Autowired
    private OptTypeService optTypeService;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse add(OptType optType){
        String id = optTypeService.add(optType);
        return responseAdd(optType,id,this.getClass());
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse delete(String id){
        Integer affectRow = optTypeService.delete(id);
        return responseDelete(affectRow,id,this.getClass());
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse update(OptType optType){
        Integer affectRow = optTypeService.update(optType);
        return responseUpdate(affectRow,optType,this.getClass());
    }

    @RequestMapping(value = "/get",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse get(String id){
        OptType optType = optTypeService.get(id);
        return responseGet(optType,this.getClass());
    }

    @RequestMapping(value = "/search",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse search(OptType optType){
        List<OptType> optTypes = optTypeService.search(optType);
        Integer total = 0;
        if(optType.getPage()==1){
            total = optTypeService.searchCount(optType);
        }
        return responseSearch(optTypes,total,optType, this.getClass());
    }
}
