package com.wk.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 基础实体类，每个实体类都会拥有的属性
 */
public class BaseEntity implements Serializable {

    private String id;
    private String remark;
    private Date createTime;
    private Date updateTime;
    private String optId;

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
