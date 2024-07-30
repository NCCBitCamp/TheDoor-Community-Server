package com.bit.springboard.dao;

import com.bit.springboard.dto.BoardDto;
import com.bit.springboard.dto.CommentDto;
import com.bit.springboard.dto.MemberDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
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

    public List<BoardDto> myWrite(String userId){
        return mybatis.selectList("MyPageDao.myWrite", userId);
    }

    public List<CommentDto> getComment(String userId){
        List<CommentDto> commentList = new ArrayList<>();
        commentList = mybatis.selectList("MyPageDao.getComments",userId);

        System.out.println(commentList);

        return commentList;
    }


}
