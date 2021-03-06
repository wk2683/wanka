package com.wk.entity;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 订单表
 */
public class Order extends BaseEntity implements Serializable {
    private String customerId ;//下单客户ID
    private String customerName ;//下单客户姓名
    private String cardId ;//下单的信用卡
    private String cardName ;//下单的信用卡名称
    private String cardNumber;//下单信用卡号
    private Integer lock;//下单信用卡号锁状态
    private String lockWorkerId;//下单信用卡号锁卡人ID
    private String lockWorkerName;//下单信用卡号锁卡人名

    private Integer billDate   ;//账单日
    private Integer replayDate ;//还款日
    private BigDecimal total2   ;//信用卡总额度
    private Integer type    ;//订单类型
    private BigDecimal total   ;//订单总金额
    private BigDecimal rate    ;//手续 费率
    private BigDecimal fee     ;//手续费
    private BigDecimal discount;//优惠金额
    private BigDecimal sumBill;//已经刷出金额合计 import
    private BigDecimal sumBill2;//已经还入金额合计 export
    private BigDecimal realFee;//实收
    private Integer status  ;//订单状态
    private String remark  ;//备注
    private String seg     ;//排序值

    private Integer done;//1-已完成，2-未完成（订单完成区分）
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

    public String getCardId() {
        return cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

    public String getCardName() {
        return cardName;
    }

    public void setCardName(String cardName) {
        this.cardName = cardName;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
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

    public BigDecimal getTotal2() {
        return total2;
    }

    public void setTotal2(BigDecimal total2) {
        this.total2 = total2;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public BigDecimal getRate() {
        return rate;
    }

    public void setRate(BigDecimal rate) {
        this.rate = rate;
    }

    public BigDecimal getFee() {
        return fee;
    }

    public void setFee(BigDecimal fee) {
        this.fee = fee;
    }

    public BigDecimal getDiscount() {
        return discount;
    }

    public void setDiscount(BigDecimal discount) {
        this.discount = discount;
    }

    public BigDecimal getSumBill() {
        return sumBill;
    }

    public void setSumBill(BigDecimal sumBill) {
        this.sumBill = sumBill;
    }

    public BigDecimal getSumBill2() {
        return sumBill2;
    }

    public void setSumBill2(BigDecimal sumBill2) {
        this.sumBill2 = sumBill2;
    }

    public BigDecimal getRealFee() {
        return realFee;
    }

    public void setRealFee(BigDecimal realFee) {
        this.realFee = realFee;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String getRemark() {
        return remark;
    }

    @Override
    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getSeg() {
        return seg;
    }

    public void setSeg(String seg) {
        this.seg = seg;
    }

    public Integer getDone() {
        return done;
    }

    public void setDone(Integer done) {
        this.done = done;
    }
}
