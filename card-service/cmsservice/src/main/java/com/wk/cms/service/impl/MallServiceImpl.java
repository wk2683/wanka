package com.wk.cms.service.impl;

import com.wk.cms.dao.MallDao;
import com.wk.cms.service.MallService;
import com.wk.entity.Mall;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 商户服务实现类
 */
@Service
public class MallServiceImpl implements MallService {

    @Autowired
    private MallDao mallDao;


    @Override
    public String add(Mall mall) {
        mall.addInit();
        Integer affectRow = mallDao.add(mall);
        if(affectRow>0){
            return  mall.getId();
        }else{
            return "";
        }
    }

    @Override
    public List<Mall> load() {
        return mallDao.load();
    }
}
