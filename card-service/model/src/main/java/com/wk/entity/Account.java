package com.wk.entity;

import java.io.Serializable;

/**
 * 资金账户信息表对应实体类
 */
public class Account extends BaseEntity  implements Serializable{

    private String accountName;
    private String userName;
    private String password;
    private String cardNo;
    private String webUserName;
    private String webPassword;
    private int seg;

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
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

    public String getCardNo() {
        return cardNo;
    }

    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
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

    public int getSeg() {
        return seg;
    }

    public void setSeg(int seg) {
        this.seg = seg;
    }
}
