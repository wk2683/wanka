package com.wk.cms.service.impl;

import com.wk.cms.dao.OptTypeDao;
import com.wk.cms.service.OptTypeService;
import com.wk.entity.OptType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 操作类型服务实现类
 */
@Service
public class OptTypeServiceImpl implements OptTypeService {

   @Autowired
    private OptTypeDao optTypeDao;

    @Override
    public String add(OptType optType) {
        optType.addInit();
        Integer addRow = optTypeDao.add(optType);
        if(addRow>0){
            return optType.getId();
        }else {
            return "";
        }
    }

    @Override
    public Integer delete(String id) {
        return optTypeDao.delete(id);
    }

    @Override
    public OptType get(String id) {
        return optTypeDao.get(id);
    }

    @Override
    public Integer update(OptType optType) {
        return optTypeDao.update(optType);
    }

    @Override
    public List<OptType> search(OptType optType) {
        return optTypeDao.search(optType);
    }
}
