package com.bit.springboard.dao;

import com.bit.springboard.dto.MemberDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDao {

    private SqlSessionTemplate mybatis;

    @Autowired
    public MyPageDao(SqlSessionTemplate sqlSessionTemplate){this.mybatis = sqlSessionTemplate;}

    public MemberDto myInfo(String userId){
        System.out.println("MyPageDao myInfo:");

        return mybatis.selectOne("MyPageDao.myInfo",userId);
    }

}
