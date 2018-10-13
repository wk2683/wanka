package com.wk.entity;

import java.io.Serializable;

/**
 * 角色表
 */
public class Role extends BaseEntity implements Serializable {
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
