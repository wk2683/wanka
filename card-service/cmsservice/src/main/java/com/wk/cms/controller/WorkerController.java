package com.wk.cms.controller;

import com.wk.cms.service.WorkerService;
import com.wk.entity.Worker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 员工信息控制类
 */
@RestController
@RequestMapping("/worker")
public class WorkerController {
    @Autowired
    private WorkerService workerService;

    @RequestMapping(value = "/add",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public String add(Worker worker){
        String id = workerService.add(worker);
        return id;
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public Boolean delete(String id){
        Integer affectRow = workerService.delete(id);
        if (affectRow>0) {
            return true;
        }
        return false;
    }

    @RequestMapping(value = "/update",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public Boolean update(Worker worker){
        Integer affectRow = workerService.update(worker);
        if (affectRow>0) {
            return true;
        }
        return false;
    }

    @RequestMapping(value = "/get",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public Worker add(String id){
        Worker worker = workerService.get(id);
        return worker;
    }

    @RequestMapping(value = "/search",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public List<Worker> search(Worker worker){
        List<Worker> workers = workerService.search(worker);
        return workers;
    }
}
