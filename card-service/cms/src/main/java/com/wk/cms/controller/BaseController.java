package com.wk.cms.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BaseController {

    @RequestMapping("/getVersion")
    @ResponseBody
    @CrossOrigin
    public String getVersion(){

        return "version 1.0.0";
    }


}
