package com.wk.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * 实体信息查询条件类
 */
public class SearchConditionEntity implements Serializable{
    /**
     * 当前页码
     */
    private Integer page;
    private Integer pageStart;
    /**
     * 一页显示记录数
     */
    private Integer pageSize;
    /**
     * 查询关键字
     */
    private String searchKey;
    /**
     * 创建时间范围开始点
     */
    private Date startCreateTime;
    /**
     * 创建时间范围结束点
     */
    private Date endCreateTime;
    /**
     * 更新时间范围开始点
     */
    private Date startUpdateTime;
    /**
     * 更新时间范围结束点
     */
    private Date endUpdateTime;

    public SearchConditionEntity() {
        this.page = 1;
        this.pageSize = 30;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPageStart() {
        if(this.pageStart==null){
            this.pageStart = (this.page-1)*this.pageSize;
        }
        return pageStart;
    }

    public void setPageStart(Integer pageStart) {
        this.pageStart = pageStart;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public String getSearchKey() {
        return searchKey;
    }

    public void setSearchKey(String searchKey) {
        this.searchKey = searchKey;
    }

    public Date getStartCreateTime() {
        return startCreateTime;
    }

    public void setStartCreateTime(Date startCreateTime) {
        this.startCreateTime = startCreateTime;
    }

    public Date getEndCreateTime() {
        return endCreateTime;
    }

    public void setEndCreateTime(Date endCreateTime) {
        this.endCreateTime = endCreateTime;
    }

    public Date getStartUpdateTime() {
        return startUpdateTime;
    }

    public void setStartUpdateTime(Date startUpdateTime) {
        this.startUpdateTime = startUpdateTime;
    }

    public Date getEndUpdateTime() {
        return endUpdateTime;
    }

    public void setEndUpdateTime(Date endUpdateTime) {
        this.endUpdateTime = endUpdateTime;
    }
}
