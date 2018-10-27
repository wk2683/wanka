package com.wk.bean;

import java.util.List;

/**
 * 数据集返回对象
 * @param <T>
 */
public class Page<T> {
    /**
     * 返回状态码
     */
    private Integer code;
    /**
     * 返回说明
     */
    private String msg;
    /**
     * 返回记录总数
     */
    private Integer count;
    /**
     * 返回数据，对应各个实体
     */
    private List<T> data;
}
