package com.wk.entity;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 客户信用卡信息
 */
public class Card extends BaseEntity implements Serializable {

    private Integer self     ;
    private String cardName   ;
    private String name        ;
    private String idNumber   ;
    private String phone       ;
    private String bankName   ;
    private String cardNumber ;
    private String password    ;
    private Integer billDate   ;
    private Integer replayDate ;
    private BigDecimal total       ;
    private BigDecimal bill        ;
    private BigDecimal replayRate ;
    private BigDecimal miniFee    ;
    private BigDecimal cashRate   ;
    private Integer income      ;
    private String remark      ;
    private Integer seg         ;

    public Integer getSelf() {
        return self;
    }

    public void setSelf(Integer self) {
        this.self = self;
    }

    public String getCardName() {
        return cardName;
    }

    public void setCardName(String cardName) {
        this.cardName = cardName;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getBillDate() {
        return billDate;
    }

    public void setBillDate(Integer billDate) {
        this.billDate = billDate;
    }

    public Integer getReplayDate() {
        return replayDate;
    }

    public void setReplayDate(Integer replayDate) {
        this.replayDate = replayDate;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public BigDecimal getBill() {
        return bill;
    }

    public void setBill(BigDecimal bill) {
        this.bill = bill;
    }

    public BigDecimal getReplayRate() {
        return replayRate;
    }

    public void setReplayRate(BigDecimal replayRate) {
        this.replayRate = replayRate;
    }

    public BigDecimal getMiniFee() {
        return miniFee;
    }

    public void setMiniFee(BigDecimal miniFee) {
        this.miniFee = miniFee;
    }

    public BigDecimal getCashRate() {
        return cashRate;
    }

    public void setCashRate(BigDecimal cashRate) {
        this.cashRate = cashRate;
    }

    public Integer getIncome() {
        return income;
    }

    public void setIncome(Integer income) {
        this.income = income;
    }

    @Override
    public String getRemark() {
        return remark;
    }

    @Override
    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getSeg() {
        return seg;
    }

    public void setSeg(Integer seg) {
        this.seg = seg;
    }
}
