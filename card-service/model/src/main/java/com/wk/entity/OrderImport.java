package com.wk.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 订单入账实体类，对应表 wk_order_import
 */
public class OrderImport extends  BaseEntity implements Serializable {

    /**
     * 所属订单ID
     * 出账日期
     * 操作类型-订单类型
     * POS名称（保存POS的ID）
     * 商户名称
     * 消费账户
     * 消费金额
     * 消费方式，1-正常刷卡，2-双免闪付
     * 操作结果，1-成功，2-失败
     * 手续费率
     * 成本手续费=消费金额*费率
     * 到账金额=消费金额-手续费
     * 应该刷余额（=还入金额总和-消费金额总和）
     */
    private String orderId;
    private Date exportDate;
    private Integer type;
    private String posId;
    private String mallName;
    private String consumeAccountId;
    private BigDecimal bill;
    private Integer consumeType;
    private Integer result;
    private BigDecimal rate;
    private BigDecimal fee;
    private BigDecimal importBill;
    private BigDecimal shouldBill;
    private Integer seg;

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public Date getExportDate() {
        return exportDate;
    }

    public void setExportDate(Date exportDate) {
        this.exportDate = exportDate;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getPosId() {
        return posId;
    }

    public void setPosId(String posId) {
        this.posId = posId;
    }

    public String getMallName() {
        return mallName;
    }

    public void setMallName(String mallName) {
        this.mallName = mallName;
    }

    public String getConsumeAccountId() {
        return consumeAccountId;
    }

    public void setConsumeAccountId(String consumeAccountId) {
        this.consumeAccountId = consumeAccountId;
    }

    public BigDecimal getBill() {
        return bill;
    }

    public void setBill(BigDecimal bill) {
        this.bill = bill;
    }

    public Integer getConsumeType() {
        return consumeType;
    }

    public void setConsumeType(Integer consumeType) {
        this.consumeType = consumeType;
    }

    public Integer getResult() {
        return result;
    }

    public void setResult(Integer result) {
        this.result = result;
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

    public BigDecimal getImportBill() {
        return importBill;
    }

    public void setImportBill(BigDecimal importBill) {
        this.importBill = importBill;
    }

    public BigDecimal getShouldBill() {
        return shouldBill;
    }

    public void setShouldBill(BigDecimal shouldBill) {
        this.shouldBill = shouldBill;
    }
    public Integer getSeg() {
        return seg;
    }

    public void setSeg(Integer seg) {
        this.seg = seg;
    }
}
