package com.wk.cms.controller;

import com.wk.bean.BaseResponse;
import com.wk.bean.Globel;
import com.wk.cms.service.WorkerService;
import com.wk.cms.util.FileUtil;
import com.wk.entity.Worker;
import org.bouncycastle.cert.ocsp.Req;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;

/**
 * 员工信息控制类
 */
@RestController
@RequestMapping("/worker")
public class WorkerController extends  BaseController {
    @Autowired
    private WorkerService workerService;

    /**
     * 员工上传文件总路径
     */
    @Value("${config.upload.worker}")
    private String workerSourcePath;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse  add(@RequestBody  Worker worker){
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
    public BaseResponse update(@RequestBody Worker worker){
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

    @RequestMapping(value = "/search",method = RequestMethod.GET)
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

    //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    @RequestMapping(value = "/uploadImg",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse uploadImg(@RequestParam(value = "file") MultipartFile file,
                                  @RequestParam("userId") String userId,
                                  @RequestParam(value = "id",required = false) String id ){
        String path = workerService.uploadImg(file,userId,id);
        return responseUploadImg(path);
    }

    /**
     * 读图片显示到img标签
     * @param path  图片路径（不包含配置的固定路径，数据库中保存的）
     * @param response
     */
    @RequestMapping(value = "/readImg",method = RequestMethod.GET  )
    @ResponseBody
    @CrossOrigin
    public void readImg(@RequestParam(value = "path") String path ,HttpServletResponse response){
        FileUtil.readImg(workerSourcePath,path,response);
    }

    /**
     * 登录
     * @param userName
     * @param password
     * @return
     */
    @RequestMapping(value = "/login",method = RequestMethod.GET  )
    @ResponseBody
    @CrossOrigin
    public BaseResponse login(@RequestParam(value = "userName") String userName , @RequestParam(value = "password") String password ){
        Worker worker = workerService.login(userName,password);
        return  responseGet(worker,this.getClass());
    }

}
