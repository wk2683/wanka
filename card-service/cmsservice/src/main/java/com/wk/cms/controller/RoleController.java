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
    public BaseResponse  add(@RequestBody  Role role ){
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
    public BaseResponse update(@RequestBody Role role ){
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


    /**
     * 根据角色id查询其下所有模块id和权限id
     * @param roleId 角色id
     * @return 返回响应对象，包含模块id和权限id数组字符串
     */
    @RequestMapping(value = "/getModelPermission",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse getModelPermission(@RequestParam("roleId")String roleId ){
        List<String> modelPermissionIds = roleService .getModelPermission(roleId);

        return responseModelPermissionOfRole(modelPermissionIds,roleId, this.getClass());
    }


    /**
     * 选择权限
     * @param roleId
     * @param permissionId
     * @return
     */
    @RequestMapping(value = "/selectPermission",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse selectPermission(@RequestParam("roleId")String roleId,@RequestParam("permissionId")String permissionId ){
        Integer affectRows = roleService .selectPermission(roleId,permissionId);

        return responseUpdate(affectRows,null,this.getClass());
    }

    /**
     * 取消选择权限
     * @param roleId
     * @param permissionId
     * @return
     */
    @RequestMapping(value = "/unselectPermission",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse unselectPermission(@RequestParam("roleId")String roleId ,@RequestParam("permissionId")String permissionId){
        Integer affectRows = roleService .unselectPermission(roleId,permissionId);

        return responseUpdate(affectRows,null,this.getClass());
    }

    /**
     * 选择模块
     * @param roleId
     * @param modelId
     * @return
     */
    @RequestMapping(value = "/selectModel",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse selectModel(@RequestParam("roleId")String roleId ,@RequestParam("modelId")String modelId){
        Integer affectRows = roleService .selectModel(roleId,modelId);

        return responseUpdate(affectRows,null,this.getClass());
    }

    /**
     * 取消选择模块
     * @param roleId
     * @param modelId
     * @return
     */
    @RequestMapping(value = "/unselectModel",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse unselectModel(@RequestParam("roleId")String roleId  ,@RequestParam("modelId")String modelId){
        Integer affectRows = roleService .unselectModel(roleId,modelId);

        return responseUpdate(affectRows,null,this.getClass());
    }


}
