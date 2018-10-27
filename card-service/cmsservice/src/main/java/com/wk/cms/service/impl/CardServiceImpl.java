package com.wk.cms.service.impl;

import com.wk.cms.dao.CardDao;
import com.wk.cms.service.CardService;
import com.wk.entity.Card;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
        return cardDao.update(card);
    }

    @Override
    public List<Card> search(Card card) {
        return cardDao.search(card);
    }
}
