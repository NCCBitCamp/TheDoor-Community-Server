package com.bit.springboard.dao;

import com.bit.springboard.dto.MemberDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public MemberDto login(MemberDto memberDto) {
        MemberDto result = sqlSessionTemplate.selectOne("MemberDaoMapper.login", memberDto);
        return result;
    }

    public boolean usernameCheck(String username) {
        Integer count = sqlSessionTemplate.selectOne("MemberDaoMapper.usernameCheck", username);
        return count != null && count > 0;
    }
}
