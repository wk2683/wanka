package com.wk.cms.controller;

import com.alibaba.fastjson.JSONObject;
import com.wk.bean.BaseResponse;
import com.wk.bean.Globel;
import com.wk.entity.BaseEntity;
import org.apache.poi.ss.formula.functions.T;
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

    /**
     * 删除和更新操作的返回处理
     * @param affectRows
     * @param optName
     * @return 返回响应对象{code,msg}
     */
    protected BaseResponse responseDeleteOrUpdate(Integer affectRows,String optName){
        BaseResponse response = new BaseResponse();

        if (affectRows>0) {
            response.setCode(Globel.RESPONSE_CODE_SUCCESS);
            response.setMsg(optName+Globel.RESPONSE_MSG_SUCCESS);
        }else{
            response.setCode(Globel.RESPONSE_CODE_FAILE);
            response.setMsg(optName+Globel.RESPONSE_MSG_FAILE);
        }
        return response;
    }

    /**
     * 新增返回处理
     * @param entity  新增的实体
     * @param id 新增生成的ID
     * @return 返回响应对象
     */
    protected BaseResponse responseAdd(BaseEntity entity,String id){
        BaseResponse response = new BaseResponse();
        if(id != null && id.length()>0) {
            response.setCode(Globel.RESPONSE_CODE_SUCCESS);
            response.setMsg(Globel.CONTROLLER_OPT_ADD + Globel.RESPONSE_MSG_SUCCESS);
            entity.setId(id);
        }else{
            response.setCode(Globel.RESPONSE_CODE_FAILE);
            response.setMsg(Globel.CONTROLLER_OPT_ADD + Globel.RESPONSE_MSG_FAILE);
        }
        response.setData(JSONObject.toJSONString(entity));
        return response;
    }
}
