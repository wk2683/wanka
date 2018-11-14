package com.wk.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 客户信用卡信息
 */
public class Card extends BaseEntity implements Serializable {

    private Integer self     ;
    private String customerId   ;
    private String customerName   ;
    private String cardName   ;
    private String name        ;
    private String idNumber   ;
    private String phone       ;
    private String bankName   ;
    private String cardNumber ;
    private String password    ;
    private Integer billDate   ;
    private Integer replayDate ;
    private String validDate ;//有效期
    private BigDecimal total       ;//总额
    private BigDecimal bill        ;//账单金额
    private BigDecimal replayRate ;//还款费率
    private BigDecimal miniFee    ;//最低还款费用
    private BigDecimal cashRate   ;//取现费率
    private Integer income      ;//
    private String remark      ;
    private Integer seg         ;
    private Integer lock;       //信用卡是否正在被操作
    private String lockWorkerId;//操作信用卡的员工ID
    private String lockWorkerName;//操作信用卡的员工ID

    public Integer getSelf() {
        return self;
    }

    public void setSelf(Integer self) {
        this.self = self;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
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

    public String getValidDate() {
        return validDate;
    }

    public void setValidDate(String validDate) {
        this.validDate = validDate;
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

    public Integer getLock() {
        return lock;
    }

    public void setLock(Integer lock) {
        this.lock = lock;
    }

    public String getLockWorkerId() {
        return lockWorkerId;
    }

    public void setLockWorkerId(String lockWorkerId) {
        this.lockWorkerId = lockWorkerId;
    }

    public String getLockWorkerName() {
        return lockWorkerName;
    }

    public void setLockWorkerName(String lockWorkerName) {
        this.lockWorkerName = lockWorkerName;
    }
}
