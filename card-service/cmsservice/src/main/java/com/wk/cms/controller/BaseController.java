package com.wk.cms.controller;

import com.alibaba.fastjson.JSONObject;
import com.wk.bean.BaseResponse;
import com.wk.bean.Globel;
import com.wk.entity.BaseEntity;
import org.apache.poi.ss.formula.functions.T;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class  BaseController {

    private static final Logger logger = LoggerFactory.getLogger(BaseController.class);

    @RequestMapping("/getVersion")
    @ResponseBody
    @CrossOrigin
    public String getVersion(){
        //测试
        return "version 1.0.0";
    }

    /**
     * 新增返回处理
     * @param entity  新增的实体
     * @param id 新增生成的ID
     * @param t 真实调用的controller
     * @return 返回响应对象
     */
    protected BaseResponse responseAdd(BaseEntity entity,String id,Class t){
        entity.setId(id);
        String entityJson = JSONObject.toJSONString(entity);
        logger.info("\n" + t.getName() + "  " + Globel.CONTROLLER_OPT_ADD +"  info : "+entityJson);
        BaseResponse response = new BaseResponse();
        if(id != null && id.length()>0) {
            response.setCode(Globel.RESPONSE_CODE_SUCCESS);
            response.setMsg(Globel.CONTROLLER_OPT_ADD + Globel.RESPONSE_MSG_SUCCESS);
        }else{
            response.setCode(Globel.RESPONSE_CODE_FAILE);
            response.setMsg(Globel.CONTROLLER_OPT_ADD + Globel.RESPONSE_MSG_FAILE);
        }
        response.setData(entityJson);
        return response;
    }

    /**
     * 删除操作的返回处理
     * @param affectRows 删除操作影响的行数
     * @param id 要删除对象的ID
     * @param t 真实调用的controller
     * @return 返回响应对象{code,msg}
     */
    protected BaseResponse responseDelete(Integer affectRows,String id,Class t){
        logger.info("\n" + t.getName() + " "+ Globel.CONTROLLER_OPT_DELETE + " id = "+id+" , affectRows="+affectRows);
        BaseResponse response = new BaseResponse();

        if (affectRows>0) {
            response.setCode(Globel.RESPONSE_CODE_SUCCESS);
            response.setMsg(Globel.CONTROLLER_OPT_DELETE+Globel.RESPONSE_MSG_SUCCESS);
        }else{
            response.setCode(Globel.RESPONSE_CODE_FAILE);
            response.setMsg(Globel.CONTROLLER_OPT_DELETE+Globel.RESPONSE_MSG_FAILE);
        }
        return response;
    }

    /**
     * 更新操作的返回处理
     * @param affectRows 更新操作影响的行数
     * @param entity 更新的对象
     * @param t 真实调用的controller
     * @return 返回响应对象{code,msg}
     */
    protected BaseResponse responseUpdate(Integer affectRows,BaseEntity entity,Class t){
        logger.info("\n" + t.getName() + " "+ Globel.CONTROLLER_OPT_UPDATE + " affectRows="+affectRows + "  info : " + JSONObject.toJSONString(entity));
        BaseResponse response = new BaseResponse();
        if (affectRows>0) {
            response.setCode(Globel.RESPONSE_CODE_SUCCESS);
            response.setMsg(Globel.CONTROLLER_OPT_UPDATE+Globel.RESPONSE_MSG_SUCCESS);
        }else{
            response.setCode(Globel.RESPONSE_CODE_FAILE);
            response.setMsg(Globel.CONTROLLER_OPT_UPDATE+Globel.RESPONSE_MSG_FAILE);
        }
        return response;
    }



    /**
     *  根据ID获取数据的返回
     * @param entity 查询到的实体信息
     * @return 返回响应对象
     */
    protected BaseResponse responseGet(BaseEntity entity,Class t){
        String entityJson = JSONObject.toJSONString(entity);
        logger.info("\n" + t.getName() + "  " + Globel.CONTROLLER_OPT_GET +"  info : "+entityJson);
        BaseResponse response = new BaseResponse();
        if(entity != null){
            response.setCode(Globel.RESPONSE_CODE_SUCCESS);
            response.setMsg(Globel.CONTROLLER_OPT_GET + Globel.RESPONSE_MSG_SUCCESS);
            response.setData(entityJson);
        }else{
            response.setCode(Globel.RESPONSE_CODE_FAILE);
            response.setMsg(Globel.CONTROLLER_OPT_GET + Globel.RESPONSE_MSG_FAILE);
        }
        return response;
    }



    /**
     * 搜索返回通用方法
     * @param entityList 搜索到的结果-集合
     * @param total 搜索条件下的总数
     * @return 返回响应对象
     */
    protected BaseResponse responseSearch(List<? extends BaseEntity> entityList,Integer total,BaseEntity entity, Class t){
        BaseResponse response = new BaseResponse();
        String loggerInfo = "\n"+ t.getName() + " " + Globel.CONTROLLER_OPT_SEARCH + "  "+ JSONObject.toJSONString(entity) + "  total="+total+ "\n";
        if(entityList != null && entityList.size()>0){
            response.setCode(Globel.RESPONSE_CODE_SUCCESS);
            response.setMsg(Globel.CONTROLLER_OPT_SEARCH + Globel.RESPONSE_MSG_SUCCESS);
            String entityListJson = JSONObject.toJSONString(entityList);
            response.setData(entityListJson);
            if(total != null && total != 0){
                response.setTotal(total);
            }
            loggerInfo += " info : " +entityListJson;
        }else{
            response.setCode(Globel.RESPONSE_CODE_FAILE);
            response.setMsg(Globel.CONTROLLER_OPT_SEARCH + Globel.RESPONSE_MSG_FAILE);
            loggerInfo += " info : null " ;
        }
        logger.info(loggerInfo);
        return response;
    }

    /**
     * 上传图片完成通用返回
     * @param path 上传完成要返回的路径
     * @return
     */
    protected BaseResponse responseUploadImg(String path){
        BaseResponse response = new BaseResponse();
        if(path == null || path.equals("")){
            response.setCode(Globel.RESPONSE_CODE_FAILE);
            response.setMsg( "上传图片" + Globel.RESPONSE_MSG_FAILE);
        }else {
            response.setCode(Globel.RESPONSE_CODE_SUCCESS);
            response.setMsg( "上传图片" + Globel.RESPONSE_MSG_SUCCESS);
            response.setData(path);
        }
        return response;
    }
}
