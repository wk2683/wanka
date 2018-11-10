package com.wk.cms.controller;

import com.wk.bean.BaseResponse;
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
public class PermissionController extends  BaseController {
    @Autowired
    private PermissionService permissionService;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse  add(@RequestBody  Permission permission){
        String id = permissionService.add(permission );
        return responseAdd(permission,id,this.getClass());
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse delete(String id){
        Integer affectRow = permissionService.delete(id);
        return responseDelete(affectRow,id,this.getClass());
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse update(@RequestBody Permission permission){
        Integer affectRow = permissionService.update(permission );
        return responseUpdate(affectRow,permission,this.getClass());
    }

    @RequestMapping(value = "/get",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse  get(String id){
        Permission permission = permissionService.get(id);
        return responseGet(permission,this.getClass());
    }

    @RequestMapping(value = "/search",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse search(Permission permission){
        List<Permission > permissions = permissionService.search(permission );
        Integer total = 0;
        if(permission.getPage()==1){
            total = permissionService.searchCount(permission);
        }
        return responseSearch(permissions,total,permission, this.getClass());
    }

    /**
     * 查询一个角色下的所有权限的action(仅仅返回权限的action值的数组)
     * @param roleId
     * @return
     */
    @RequestMapping(value = "/getUserActionInRole",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse getUserActionInRole(String roleId){
        List<String> actions = permissionService.getUserActionInRole(roleId);
        return responseModelPermissionOfRole(actions,roleId,this.getClass());
    }
}
