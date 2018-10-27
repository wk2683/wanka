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


}
