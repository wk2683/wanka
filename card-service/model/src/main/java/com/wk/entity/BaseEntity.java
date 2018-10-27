package com.wk.entity;

import com.wk.bean.SearchConditionEntity;

import java.io.Serializable;
import java.util.Date;
import java.util.UUID;

/**
 * 基础实体类，每个实体类都会拥有的属性
 */
public class BaseEntity extends SearchConditionEntity implements Serializable {

    private String id;
    private String remark;
    private Date createTime;
    private Date updateTime;
    private String optId;

    public void addInit(){
        this.setId(UUID.randomUUID().toString());
        this.setCreateTime(new Date());

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getOptId() {
        return optId;
    }

    public void setOptId(String optId) {
        this.optId = optId;
    }


}
