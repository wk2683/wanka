package com.wk.cms.service.impl;

import com.wk.cms.dao.RoleDao;
import com.wk.cms.service.RoleService;
import com.wk.entity.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 角色服务实现类
 */
@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleDao roleDao;
    @Override
    public String add(Role role) {
        role.addInit();
        Integer addRow = roleDao.add(role);
        if(addRow>0){
            return role.getId();
        }else {
            return "";
        }
    }

    @Override
    public Integer delete(String id) {
        return roleDao.delete(id);
    }

    @Override
    public Role get(String id) {
        return roleDao.get(id);
    }

    @Override
    public Integer update(Role role) {
        role.updateInit();
        return roleDao.update(role);
    }

    @Override
    public List<Role> search(Role role) {
        return roleDao.search(role);
    }

    @Override
    public Integer searchCount(Role role) {
        return roleDao.searchCount(role);
    }

    /**
     *
     * @param roleId
     * @return
     */
    @Override
    public List<String> getModelPermission(String roleId) {
        List<String> modelIds = roleDao.getModelIds(roleId);
        if(modelIds != null ){
            List<String > permissionIds = roleDao.getPermissionIds(roleId);
            modelIds.addAll(permissionIds);
        }
        return modelIds;
    }

    @Override
    public Integer selectPermission(String roleId, String permissionId) {
        return roleDao.selectPermission(roleId,permissionId);
    }

    @Override
    public Integer unselectPermission(String roleId, String permissionId) {
        return roleDao.unselectPermission(roleId,permissionId);
    }

    @Override
    public Integer selectModel(String roleId, String modeId) {
        return roleDao.selectModel(roleId,modeId);
    }

    @Override
    public Integer unselectModel(String roleId, String modeId) {
        return roleDao.unselectModel(roleId,modeId);
    }


}
