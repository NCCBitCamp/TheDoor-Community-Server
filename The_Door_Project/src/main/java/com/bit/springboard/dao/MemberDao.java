package com.bit.springboard.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {
    private SqlSessionTemplate mybatis;

    public int userIdCheck(String userId) {
        return mybatis.selectOne("MemberDaoMapper.userIdCheck", userId);
    }

}
