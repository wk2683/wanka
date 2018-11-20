package com.wk.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 订单出账实体类，对应表 wk_order_export
 */
public class OrderExport extends  BaseEntity implements Serializable {

    /**
     * 所属订单ID
     * 出账日期
     * 操作类型-订单类型
     * 转出账户
     * 转入账户
     * 卡密码
     * 姓名
     * 卡号
     * 还入金额
     * 手续费率
     * 手续费
     */
    private String orderId;
    private Date exportDate;
    private Integer type;
    private String exportAccountId;
    private String exportAccountName;
    private String exportAccountNumber;//转出账户的卡号
    private String importAccountId;
    private String importAccountName;
    private String cardPassword;
    private String name;
    private String cardNumber;
    private BigDecimal importBill;
    private BigDecimal rate;
    private BigDecimal fee;
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

    public String getExportAccountId() {
        return exportAccountId;
    }

    public void setExportAccountId(String exportAccountId) {
        this.exportAccountId = exportAccountId;
    }

    public String getImportAccountId() {
        return importAccountId;
    }

    public void setImportAccountId(String importAccountId) {
        this.importAccountId = importAccountId;
    }

    public String getExportAccountName() {
        return exportAccountName;
    }

    public void setExportAccountName(String exportAccountName) {
        this.exportAccountName = exportAccountName;
    }

    public String getImportAccountName() {
        return importAccountName;
    }

    public String getExportAccountNumber() {
        return exportAccountNumber;
    }

    public void setExportAccountNumber(String exportAccountNumber) {
        this.exportAccountNumber = exportAccountNumber;
    }

    public void setImportAccountName(String importAccountName) {
        this.importAccountName = importAccountName;
    }

    public String getCardPassword() {
        return cardPassword;
    }

    public void setCardPassword(String cardPassword) {
        this.cardPassword = cardPassword;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public BigDecimal getImportBill() {
        return importBill;
    }

    public void setImportBill(BigDecimal importBill) {
        this.importBill = importBill;
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

    public Integer getSeg() {
        return seg;
    }

    public void setSeg(Integer seg) {
        this.seg = seg;
    }
}
