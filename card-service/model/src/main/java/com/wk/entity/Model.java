package com.wk.entity;

import java.io.Serializable;

/**
 * 操作模块表
 */
public class Model extends BaseEntity implements Serializable {
    private String name;
    private Integer seg;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }



    public Integer getSeg() {
        return seg;
    }

    public void setSeg(Integer seg) {
        this.seg = seg;
    }
}
