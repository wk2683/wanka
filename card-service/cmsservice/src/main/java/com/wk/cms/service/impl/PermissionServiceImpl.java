package com.wk.cms.service.impl;

import com.wk.cms.dao.PermissionDao;
import com.wk.cms.service.PermissionService;
import com.wk.entity.Permission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 权限服务实现类
 */
@Service
public class PermissionServiceImpl implements PermissionService {
    @Autowired
    private PermissionDao permissionDao;
    @Override
    public String add(Permission permission) {
        permission.addInit();
        Integer addRow = permissionDao.add(permission);
        if(addRow>0){
            return permission.getId();
        }else {
            return "";
        }
    }

    @Override
    public Integer delete(String id) {
        return permissionDao.delete(id);
    }

    @Override
    public Permission get(String id) {
        return permissionDao.get(id);
    }

    @Override
    public Integer update(Permission permission) {
        permission.updateInit();
        return permissionDao.update(permission);
    }

    @Override
    public List<Permission> search(Permission permission) {
        return permissionDao.search(permission);
    }

    @Override
    public Integer searchCount(Permission permission) {
        return permissionDao.searchCount(permission);
    }
}
