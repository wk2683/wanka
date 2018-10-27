package com.wk.cms.service;

import com.wk.bean.Page;
import com.wk.entity.BaseEntity;
import org.apache.poi.ss.formula.functions.T;

import java.util.List;

/**
 * 基础服务接口
 */
public interface BaseService<T> {
    /**
     * 通用添加接口
     * @param t
     * @return
     */
    Integer  add(T t);

    /**
     * 通用删除接口，根据ID删除
     * @param id
     * @return
     */
    Integer delete(String id);

    /**
     * 通用更新接口，根据ID更新
     * @param t
     * @return
     */
    Integer update(T t);

    /**
     * 通用读取接口，根据ID读取
     * @param id
     * @return
     */
    T getById(String id);

    /**
     * 通用查询接口
     * @param t
     * @return
     */
    Page<T> search(T t);
}
