package com.wk.cms.service.impl;

import com.wk.cms.dao.PosDao;
import com.wk.cms.service.PosService;
import com.wk.entity.Pos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * POS机服务实现类
 */
@Service
public class PosServiceImpl implements PosService {
    @Autowired
    private PosDao posDao;
    @Override
    public String add(Pos pos) {
        pos.addInit();
        Integer addRow = posDao.add(pos);
        if(addRow>0){
            return pos.getId();
        }else {
            return "";
        }
    }

    @Override
    public Integer delete(String id) {
        return posDao.delete(id);
    }

    @Override
    public Pos get(String id) {
        return posDao.get(id);
    }

    @Override
    public Integer update(Pos pos) {
        pos.updateInit();
        return posDao.update(pos);
    }

    @Override
    public List<Pos> search(Pos pos) {
        return posDao.search(pos);
    }

    @Override
    public Integer searchCount(Pos pos) {
        return posDao.searchCount(pos);
    }
}
