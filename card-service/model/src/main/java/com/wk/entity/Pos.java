package com.wk.entity;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * POS信息
 */
public class Pos extends BaseEntity implements Serializable {
    private String name              ;
    private String importUserName  ;
    private String importUserId  ;
    private String bankName         ;
    private String cardNumber       ;
    private String rateId           ;
    private BigDecimal rate1           ;//正常费率
    private BigDecimal rate2           ;//双免费率
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

    public String getImportUserId() {
        return importUserId;
    }

    public void setImportUserId(String importUserId) {
        this.importUserId = importUserId;
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

    public BigDecimal getRate1() {
        return rate1;
    }

    public void setRate1(BigDecimal rate1) {
        this.rate1 = rate1;
    }

    public BigDecimal getRate2() {
        return rate2;
    }

    public void setRate2(BigDecimal rate2) {
        this.rate2 = rate2;
    }

    public Integer getSeg() {
        return seg;
    }

    public void setSeg(Integer seg) {
        this.seg = seg;
    }
}
