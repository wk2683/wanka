package com.wk.entity;

import java.io.Serializable;

/**
 * 操作表(权限表)
 */
public class Permission extends BaseEntity implements Serializable {
    private String name;
    private String modelId;
    private String action;
    private Integer seg;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getModelId() {
        return modelId;
    }

    public void setModelId(String modelId) {
        this.modelId = modelId;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public Integer getSeg() {
        return seg;
    }

    public void setSeg(Integer seg) {
        this.seg = seg;
    }
}
