package com.bit.springboard.dao;

import com.bit.springboard.dto.BoardDto;
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
        System.out.println("MyPageDao myInfo:");

        return mybatis.selectOne("MyPageDao.myInfo",userId);
    }

    public void modifyInfo(MemberDto memberDto){

        mybatis.update("MyPageDao.modifyInfo",memberDto);
        System.out.println("modifyInfo 완료");
    }

    public List<BoardDto> myWrite(String userId){
        System.out.println(userId);
        List<BoardDto> myWrites = new ArrayList<>();
        myWrites = mybatis.selectList("MyPageDao.myWrite", userId);

        return myWrites;
    }



}
