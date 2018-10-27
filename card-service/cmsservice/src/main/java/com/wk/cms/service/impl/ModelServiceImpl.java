package com.wk.cms.service.impl;

import com.wk.cms.dao.ModelDao;
import com.wk.cms.service.ModelService;
import com.wk.entity.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 模块服务实现类
 */
@Service
public class ModelServiceImpl implements ModelService {
    @Autowired
    private ModelDao modelDao;

    @Override
    public String add(Model model) {
        model.addInit();
        Integer addRow = modelDao.add(model);
        if(addRow>0){
            return model.getId();
        }else {
            return "";
        }
    }

    @Override
    public Integer delete(String id) {
        return modelDao.delete(id);
    }

    @Override
    public Model get(String id) {
        return modelDao.get(id);
    }

    @Override
    public Integer update(Model model) {
        return modelDao.update( model);
    }

    @Override
    public List<Model> search(Model model) {
        return modelDao.search( model);
    }
}
