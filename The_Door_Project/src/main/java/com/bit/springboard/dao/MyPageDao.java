package com.bit.springboard.dao;

import com.bit.springboard.dto.BoardDto;
import com.bit.springboard.dto.CommentDto;
import com.bit.springboard.dto.Criteria;
import com.bit.springboard.dto.MemberDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import java.util.List;

@Repository
public class MyPageDao {

    private SqlSessionTemplate mybatis;

    @Autowired
    public MyPageDao(SqlSessionTemplate sqlSessionTemplate){this.mybatis = sqlSessionTemplate;}

    public MemberDto myInfo(String userId){
        return mybatis.selectOne("MyPageDao.myInfo",userId);
    }

    public void modifyInfo(MemberDto memberDto){
        mybatis.update("MyPageDao.modifyInfo",memberDto);
    }

    public List<BoardDto> myWrite(Criteria cri){
        return mybatis.selectList("MyPageDao.myWrite", cri);
    }

    public List<CommentDto> getComment(Criteria cri){
        return mybatis.selectList("MyPageDao.getComments",cri);
    }

    public int getTotalMyPage(String userId){
        return mybatis.selectOne("MyPageDao.myWriteNum", userId);
    }

    public int getCommentsNum(String userId) {
        return mybatis.selectOne("MyPageDao.getCommentsNum", userId);
    }
}
