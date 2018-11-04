package com.wk.entity;

import java.io.Serializable;

/**
 * 资金账户信息表对应实体类
 */
public class Account extends BaseEntity  implements Serializable{

    private String name;//资金账户名称
    private String userName;//姓名
    private String userId;//姓名
    private String bankName;// 银行名称
    private String cardNumber;//卡号
    private String webUserName;//网银登录名
    private String webPassword;//网银登录密码
    private Integer seg;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getWebUserName() {
        return webUserName;
    }

    public void setWebUserName(String webUserName) {
        this.webUserName = webUserName;
    }

    public String getWebPassword() {
        return webPassword;
    }

    public void setWebPassword(String webPassword) {
        this.webPassword = webPassword;
    }

    public Integer getSeg() {
        return seg;
    }

    public void setSeg(Integer seg) {
        this.seg = seg;
    }
}
