package com.wk.cms.service.impl;

import cn.afterturn.easypoi.excel.ExcelImportUtil;
import cn.afterturn.easypoi.excel.entity.ImportParams;
import com.wk.cms.dao.CardDao;
import com.wk.cms.service.CardService;
import com.wk.entity.Card;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * 信用卡服务实现类
 */
@Service
public class CardServiceImpl implements CardService {
    @Autowired
    private CardDao cardDao;

    @Override
    public String add(Card card) {
        card.addInit();
        Integer addRow = cardDao.add(card);
        if(addRow>0){
            return card.getId();
        }else {
            return "";
        }
    }

    @Override
    public Integer delete(String id) {
        return cardDao.delete(id);
    }

    @Override
    public Card get(String id) {
        return cardDao.get(id);
    }

    @Override
    public Integer update(Card card) {
        card.addInit();
        return cardDao.update(card);
    }

    @Override
    public List<Card> search(Card card) {
        return cardDao.search(card);
    }

    @Override
    public Integer searchCount(Card card) {
        return cardDao.searchCount(card);
    }

    /**
     * 导入信用卡信息
     * @param file excel 文件
     * @param userId 导入操作的用户ID
     * @return
     */
    @Override
    public List<Card> importExcel(MultipartFile file, String userId) {

        ImportParams params = new ImportParams();
        params.setTitleRows(1);
        params.setHeadRows(1);//设置为2就读不到数据，设置为1则多一行头条。目前处理处理是读集合的第二条开始。
        params.setStartRows(0);
        List<Card> cards = null;//Excel中读出的集合
        List<Card> cardList = null;//检查不通过和保存失败的集合
        try {
            cards = ExcelImportUtil.importExcel(file.getInputStream(), Card.class, params);
        } catch (Exception e) {
//            logger.error("通过Excel文件批量上传文档信息时Excel转集合时出错。");
            e.printStackTrace();
        }
//        if(dqList==null || dqList.size()<1){
//            logger.error("没有读取到excel信息");
//        }else {
//            logger.error("记录数量："+dqList.size());
////				System.out.println(JSONUtil.object2Json(list));
//            errList = checkAndInitDqList(dqList,userId);
//        }
        return  cards;

    }

    @Override
    public Integer lock(Card card) {
        return cardDao.lock(card);
    }
}
