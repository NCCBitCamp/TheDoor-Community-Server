package com.bit.springboard.dao;

import com.bit.springboard.dto.MemberDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AuthCodeDao {
    private SqlSessionTemplate mybatis;

    @Autowired
    public AuthCodeDao(SqlSessionTemplate sqlSessionTemplate) {
        this.mybatis = sqlSessionTemplate;
    }

    public void save(MemberDto memberDto) {
        mybatis.insert("AuthCodeDao.save", memberDto);
    }

    public void expire(MemberDto memberDto) {
        mybatis.update("AuthCodeDao.expire", memberDto);
    }

    public MemberDto find(MemberDto memberDto) {
        return mybatis.selectOne("AuthCodeDao.find", memberDto);
    }
}
