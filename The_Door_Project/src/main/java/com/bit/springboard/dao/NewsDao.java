package com.bit.springboard.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NewsDao {
    private SqlSessionTemplate mybatis;

    @Autowired
    public NewsDao(SqlSessionTemplate sqlSessionTemplate) {
        this.mybatis = sqlSessionTemplate;
    }

    public void updateCnt(int id) {
        mybatis.update("NewsDao.updateCnt", id);
    }

}
