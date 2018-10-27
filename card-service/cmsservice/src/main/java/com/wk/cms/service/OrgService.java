package com.wk.cms.service;

import com.wk.entity.Org;

import java.util.List;

/**
 * 组织服务接口
 */
public interface OrgService  {

    /**
     * 增
     * @param org
     * @return
     */
    String add(Org org);

    /**
     * 删
     * @param id
     * @return
     */
    Integer delete(String id);

    /**
     * 查
     * @param id
     * @return
     */
    Org get(String id);

    /**
     * 改
     * @param org
     * @return
     */
    Integer update(Org org);

    /**
     * 搜索
     * @param org
     * @return
     */
    List<Org> search(Org org);



}
