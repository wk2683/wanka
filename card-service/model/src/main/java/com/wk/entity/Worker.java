package com.wk.entity;

import java.io.Serializable;

/**
 * 员工表
 */
public class Worker extends BaseEntity implements Serializable {
    private String orgId    ;
    private String roleId   ;
    private String userName ;
    private String password  ;
    private String name      ;
    private String idNumber ;
    private String phone     ;
    private String weixin    ;
    private String fontImg  ;
    private String afterImg ;
    private String homeImg  ;
    private Integer seg;

    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIdNumber() {
        return idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getWeixin() {
        return weixin;
    }

    public void setWeixin(String weixin) {
        this.weixin = weixin;
    }

    public String getFontImg() {
        return fontImg;
    }

    public void setFontImg(String fontImg) {
        this.fontImg = fontImg;
    }

    public String getAfterImg() {
        return afterImg;
    }

    public void setAfterImg(String afterImg) {
        this.afterImg = afterImg;
    }

    public String getHomeImg() {
        return homeImg;
    }

    public void setHomeImg(String homeImg) {
        this.homeImg = homeImg;
    }

    public Integer getSeg() {
        return seg;
    }

    public void setSeg(Integer seg) {
        this.seg = seg;
    }
}
