package com.wk.cms.controller;

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
public class RoleController {
    @Autowired
    private RoleService roleService;

    @RequestMapping(value = "/add",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public String add(Role role ){
        String id = roleService.add(role);
        return id;
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public Boolean delete(String id){
        Integer affectRow = roleService .delete(id);
        if (affectRow>0) {
            return true;
        }
        return false;
    }

    @RequestMapping(value = "/update",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public Boolean update(Role role ){
        Integer affectRow = roleService .update(role);
        if (affectRow>0) {
            return true;
        }
        return false;
    }

    @RequestMapping(value = "/get",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public Role add(String id){
        Role role  = roleService .get(id);
        return role;
    }

    @RequestMapping(value = "/search",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public List<Role> search(Role role ){
        List<Role> roles = roleService .search(role);
        return roles;
    }
}
