package com.wk.cms.service.impl;

import com.wk.cms.dao.OrgDao;
import com.wk.cms.service.OrgService;
import com.wk.entity.Org;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 组织服务实现类
 */
@Service
public class OrgServiceImpl implements OrgService   {
    @Autowired
    private OrgDao orgDao;

    @Override
    public String add(Org org) {
        org.addInit();
        Integer addRow = orgDao.add(org);
        if(addRow>0){
            return org.getId();
        }else {
            return "";
        }
    }

    @Override
    public Integer delete(String id) {
        return orgDao.delete(id);
    }

    @Override
    public Org get(String id) {
        return orgDao.get(id);
    }

    @Override
    public Integer update(Org org) {
        return orgDao.update(org);
    }

    @Override
    public List<Org> search(Org org) {
        return orgDao.search(org);
    }

    @Override
    public Integer searchCount(Org org) {
        return orgDao.searchCount(org);
    }


}
