package com.wk.entity;

import java.io.Serializable;

/**
 * POS信息
 */
public class Pos extends BaseEntity implements Serializable {
    private String name              ;
    private String importUserName  ;
    private String bankName         ;
    private String cardNumber       ;
    private String rateId           ;
    private Integer seg               ;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImportUserName() {
        return importUserName;
    }

    public void setImportUserName(String importUserName) {
        this.importUserName = importUserName;
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

    public String getRateId() {
        return rateId;
    }

    public void setRateId(String rateId) {
        this.rateId = rateId;
    }

    public Integer getSeg() {
        return seg;
    }

    public void setSeg(Integer seg) {
        this.seg = seg;
    }
}
