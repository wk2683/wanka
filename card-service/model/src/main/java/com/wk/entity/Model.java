package com.wk.entity;

import java.io.Serializable;
import java.util.List;

/**
 * 操作模块表
 */
public class Model extends BaseEntity implements Serializable {
    private String name;
    private String icon;
    private Integer seg;
    /**
     * 模块下的操作（权限）
     */
    private List<Permission> permissionList;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public Integer getSeg() {
        return seg;
    }

    public void setSeg(Integer seg) {
        this.seg = seg;
    }

    public List<Permission> getPermissionList() {
        return permissionList;
    }

    public void setPermissionList(List<Permission> permissionList) {
        this.permissionList = permissionList;
    }
}
