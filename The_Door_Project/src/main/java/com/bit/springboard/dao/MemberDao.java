package com.bit.springboard.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {
    private SqlSessionTemplate mybatis;

    public MemberDao(SqlSessionTemplate sqlSessionTemplate) {
        this.mybatis = sqlSessionTemplate;
    }

    public int userIdCheck(String userId) {
        return mybatis.selectOne("MemberDaoMapper.userIdCheck", userId);
    }


    public int nicknameCheck(String nickname) {
        return mybatis.selectOne("MemberDaoMapper.nicknameCheck", nickname); // <= 오른쪽 매개변수가 mapper.xml #{변수명}과 일치해야한다.
    }
}
