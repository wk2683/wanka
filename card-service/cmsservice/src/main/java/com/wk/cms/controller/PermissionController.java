package com.wk.cms.controller;

import com.wk.cms.service.PermissionService;
import com.wk.entity.Permission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 权限信息控制类
 */
@RestController
@RequestMapping("/permission")
public class PermissionController {
    @Autowired
    private PermissionService permissionService;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public String add(Permission permission){
        String id = permissionService.add(permission );
        return id;
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public Boolean delete(String id){
        Integer affectRow = permissionService.delete(id);
        if (affectRow>0) {
            return true;
        }
        return false;
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public Boolean update(Permission permission){
        Integer affectRow = permissionService.update(permission );
        if (affectRow>0) {
            return true;
        }
        return false;
    }

    @RequestMapping(value = "/get",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public Permission  add(String id){
        Permission permission = permissionService.get(id);
        return permission ;
    }

    @RequestMapping(value = "/search",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public List<Permission > search(Permission permission){
        List<Permission > permissions = permissionService.search(permission );
        return permissions;
    }
}
