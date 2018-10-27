package com.wk.cms.controller;

import com.alibaba.fastjson.JSONObject;
import com.wk.bean.BaseResponse;
import com.wk.bean.Globel;
import com.wk.cms.service.OrgService;
import com.wk.entity.Org;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
 * 组织控制类
 */
@RequestMapping("/org")
@RestController
public class OrgController extends BaseController{

    private static final Logger logger = LoggerFactory.getLogger(OrgController.class);


    @Autowired
    private OrgService orgService;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse add(Org org){
        logger.info("添加组织"+JSONObject.toJSONString(org));
        String id = orgService.add(org);
        return responseAdd(org,id);
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse delete(String id){
        Integer affectRow = orgService.delete(id);
        return responseDeleteOrUpdate(affectRow,Globel.CONTROLLER_OPT_DELETE);
    }

    @RequestMapping(value = "/update",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse update(Org org){
        Integer affectRow = orgService.update(org);
        return responseDeleteOrUpdate(affectRow,Globel.CONTROLLER_OPT_UPDATE);
    }

    @RequestMapping(value = "/get",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public Org add(String id){
        Org org = orgService.get(id);
        BaseResponse response = new BaseResponse();

        return org;
    }

    @RequestMapping(value = "/search",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public List<Org> search(Org org){
        List<Org> orgs = orgService.search(org);
        return orgs;
    }
}
