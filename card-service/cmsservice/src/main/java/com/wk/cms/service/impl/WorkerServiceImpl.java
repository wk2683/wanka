package com.wk.cms.service.impl;

import com.wk.cms.dao.WorkerDao;
import com.wk.cms.service.WorkerService;
import com.wk.entity.Worker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 员工服务实现类
 */
@Service
public class WorkerServiceImpl implements WorkerService {
    @Autowired
    private WorkerDao workerDao;
    @Override
    public String  add(Worker worker) {
        worker.addInit();
        Integer addRow = workerDao.add(worker);
        if(addRow>0){
            return worker.getId();
        }else {
            return "";
        }
    }

    @Override
    public Integer delete(String id) {
        return workerDao.delete(id);
    }

    @Override
    public Worker get(String id) {
        return workerDao.get(id);
    }

    @Override
    public Integer update(Worker worker) {
        return workerDao.update(worker);
    }

    @Override
    public List<Worker> search(Worker worker) {
        return workerDao.search(worker);
    }

    @Override
    public Integer searchCount(Worker worker) {
        return workerDao.searchCount(worker);
    }
}
