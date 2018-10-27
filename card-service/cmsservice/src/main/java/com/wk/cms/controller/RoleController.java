package com.wk.cms.controller;

import com.alibaba.fastjson.JSONObject;
import com.wk.bean.BaseResponse;
import com.wk.bean.Globel;
import com.wk.cms.service.RoleService;
import com.wk.entity.Role;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 角色控制类
 */
@RequestMapping("/role")
@RestController
public class RoleController extends BaseController{

    @Autowired
    private RoleService roleService;

    @RequestMapping(value = "/add",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse add(Role role ){
        String id = roleService.add(role);
        return responseAdd(role,id,RoleController.class);
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse delete(String id){
        Integer affectRow = roleService .delete(id);
        return responseDelete(affectRow,id,RoleController.class);
    }

    @RequestMapping(value = "/update",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse update(Role role ){

        Integer affectRow = roleService .update(role);
        return responseUpdate(affectRow,role,RoleController.class);
    }

    @RequestMapping(value = "/get",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse get(String id){
        Role role  = roleService .get(id);
        return responseGet(role,RoleController.class);
    }

    @RequestMapping(value = "/search",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse search(Role role ){
        List<Role> roles = roleService .search(role);
        Integer total = 0;
        if(role.getPage()==1){
            total = roleService.searchCount(role);
        }
        return responseSearch(roles,total,role, RoleController.class);
    }
}
