package com.wk.cms.controller;

import com.wk.bean.BaseResponse;
import com.wk.cms.service.RoleService;
import com.wk.entity.Role;
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

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse add(Role role ){
        String id = roleService.add(role);
        return responseAdd(role,id,this.getClass());
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse delete(String id){
        Integer affectRow = roleService .delete(id);
        return responseDelete(affectRow,id,this.getClass());
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse update(Role role ){
        Integer affectRow = roleService .update(role);
        return responseUpdate(affectRow,role,this.getClass());
    }

    @RequestMapping(value = "/get",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse get(String id){
        Role role  = roleService .get(id);
        return responseGet(role,this.getClass());
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
        return responseSearch(roles,total,role, this.getClass());
    }
}
