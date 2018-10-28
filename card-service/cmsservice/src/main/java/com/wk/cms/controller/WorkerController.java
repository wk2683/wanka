package com.wk.cms.controller;

import com.wk.bean.BaseResponse;
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
public class WorkerController extends  BaseController {
    @Autowired
    private WorkerService workerService;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse add(Worker worker){
        String id = workerService.add(worker);
        return responseAdd(worker,id,this.getClass());
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse delete(String id){
        Integer affectRow = workerService.delete(id);
        return responseDelete(affectRow,id,this.getClass());
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse update(Worker worker){
        Integer affectRow = workerService.update(worker);
        return responseUpdate(affectRow,worker,this.getClass());
    }

    @RequestMapping(value = "/get",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse get(String id){
        Worker worker = workerService.get(id);
        return responseGet(worker,this.getClass());
    }

    @RequestMapping(value = "/search",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse search(Worker worker){
        List<Worker> workers = workerService.search(worker);
        Integer total = 0;
        if(worker.getPage()==1){
                total = workerService.searchCount(worker);
        }
        return responseSearch(workers,total,worker, this.getClass());
    }
}
