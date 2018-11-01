package com.wk.entity;

import java.io.Serializable;

/**
 * 银行实体，基础信息
 */
public class Bank extends BaseEntity implements Serializable {
    private String id;
    private String name;
    private String nickName;
    private Integer seg;
    private String  remark;

    @Override
    public String getId() {
        return id;
    }

    @Override
    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public Integer getSeg() {
        return seg;
    }

    public void setSeg(Integer seg) {
        this.seg = seg;
    }

    @Override
    public String getRemark() {
        return remark;
    }

    @Override
    public void setRemark(String remark) {
        this.remark = remark;
    }
}
