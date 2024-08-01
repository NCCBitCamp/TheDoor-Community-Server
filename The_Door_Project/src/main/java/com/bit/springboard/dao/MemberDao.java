package com.bit.springboard.dao;

import com.bit.springboard.dto.MemberDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Member;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@Repository
public class MemberDao {
    private SqlSessionTemplate sqlSessionTemplate;

    @Autowired
    public MemberDao(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public MemberDto login(MemberDto memberDto) {
        MemberDto result = sqlSessionTemplate.selectOne("MemberDaoMapper.login", memberDto);
        return result;
    }

    public int userIdCheck(String userId) {
        return sqlSessionTemplate.selectOne("MemberDaoMapper.userIdCheck", userId);
    }

    public boolean usernameCheck(String username) {
        Integer count = sqlSessionTemplate.selectOne("MemberDaoMapper.usernameCheck", username);
        return count != null && count > 0;
    }

    public int nicknameCheck(String nickname) {
        return sqlSessionTemplate.selectOne("MemberDaoMapper.nicknameCheck", nickname); // <= 오른쪽 매개변수가 mapper.xml #{변수명}과 일치해야한다.
    }

    public void join(MemberDto memberDto) {
        sqlSessionTemplate.insert("MemberDaoMapper.join", memberDto);
    }

    public String idSearchDao(MemberDto memberDto) {
        return sqlSessionTemplate.selectOne("MemberDaoMapper.idSearch", memberDto);
    }

    public void updateEmail(MemberDto memberDto) {
        sqlSessionTemplate.update("MemberDaoMapper.emailChange", memberDto);
    }

    public MemberDto validateUser(MemberDto memberDto){
        return sqlSessionTemplate.selectOne("MemberDaoMapper.validateUser", memberDto);
    }
}
