package com.wk.entity;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 费率表
 */
public class Rate extends BaseEntity implements Serializable {
    private BigDecimal rate;
    private Integer seg;

    public BigDecimal getRate() {
        return rate;
    }

    public void setRate(BigDecimal rate) {
        this.rate = rate;
    }

    public Integer getSeg() {
        return seg;
    }

    public void setSeg(Integer seg) {
        this.seg = seg;
    }
}
