package com.wk.cms.controller;

import com.wk.bean.BaseResponse;
import com.wk.bean.Globel;
import com.wk.cms.service.CustomerService;
import com.wk.cms.util.FileUtil;
import com.wk.entity.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 客户信息控制类
 */
@RestController
@RequestMapping("/customer")
public class CustomerController  extends  BaseController{
    @Autowired
    private CustomerService customerService;

    /**
     * 客户图片文件总路径
     */
    @Value("${config.upload.customer}")
    private String customerSourcePath;

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse  add(@RequestBody  Customer customer){
        String id = customerService.add(customer);
        return responseAdd(customer,id,this.getClass());
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse delete(String id){
        Integer affectRow = customerService.delete(id);
        return responseDelete(affectRow,id,this.getClass());
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse update(@RequestBody Customer customer){
        Integer affectRow = customerService.update(customer);
        return responseUpdate(affectRow,customer,this.getClass());
    }

    @RequestMapping(value = "/get",method = RequestMethod.GET)
    @ResponseBody
    @CrossOrigin
    public BaseResponse get(String id){
        Customer customer = customerService.get(id);
        return responseGet(customer,this.getClass());
    }

    @RequestMapping(value = "/search",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse search(Customer customer){
        List<Customer> customers = customerService.search(customer);
        Integer total = 0;
        if(customer.getPage()==1){
            total = customerService.searchCount(customer);
        }
        return responseSearch(customers,total,customer, this.getClass());
    }

    //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<以上是 增删改查 基本操作<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

    @RequestMapping(value = "/uploadImg",method = RequestMethod.POST)
    @ResponseBody
    @CrossOrigin
    public BaseResponse uploadImg(@RequestParam(value = "file") MultipartFile file,
                                  @RequestParam("userId") String userId,
                                  @RequestParam(value = "id",required = false) String id ){
        String path = customerService.uploadImg(file,userId,id);
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
        FileUtil.readImg(customerSourcePath,path,response);
    }

}
