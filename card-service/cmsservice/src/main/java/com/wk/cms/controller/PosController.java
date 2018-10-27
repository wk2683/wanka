package com.wk.cms.controller;

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
public class PosController {
    @Autowired
    private PosService posService;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public String add(Pos pos ){
        String id = posService .add(pos );
        return id;
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public Boolean delete(String id){
        Integer affectRow = posService .delete(id);
        if (affectRow>0) {
            return true;
        }
        return false;
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public Boolean update(Pos pos ){
        Integer affectRow = posService .update(pos );
        if (affectRow>0) {
            return true;
        }
        return false;
    }

    @RequestMapping(value = "/get",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public Pos  add(String id){
        Pos pos  = posService .get(id);
        return pos ;
    }

    @RequestMapping(value = "/search",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public List<Pos > search(Pos pos ){
        List<Pos > poss = posService .search(pos );
        return poss;
    }
}
