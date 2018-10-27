package com.wk.cms.controller;

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
public class OptTypeController {
    @Autowired
    private OptTypeService optTypeService;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public String add(OptType optType){
        String id = optTypeService.add(optType);
        return id;
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public Boolean delete(String id){
        Integer affectRow = optTypeService.delete(id);
        if (affectRow>0) {
            return true;
        }
        return false;
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public Boolean update(OptType optType){
        Integer affectRow = optTypeService.update(optType);
        if (affectRow>0) {
            return true;
        }
        return false;
    }

    @RequestMapping(value = "/get",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public OptType add(String id){
        OptType optType = optTypeService.get(id);
        return optType;
    }

    @RequestMapping(value = "/search",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public List<OptType> search(OptType optType){
        List<OptType> optTypes = optTypeService.search(optType);
        return optTypes;
    }
}
