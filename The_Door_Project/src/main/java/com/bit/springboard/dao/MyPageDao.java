package com.bit.springboard.dao;

import com.bit.springboard.dto.*;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;


import java.util.List;

@Repository
public class MyPageDao {

    private SqlSessionTemplate mybatis;

    @Autowired
    public MyPageDao(SqlSessionTemplate sqlSessionTemplate){this.mybatis = sqlSessionTemplate;}

    public MemberDto myInfo(String userId){
        return mybatis.selectOne("MyPageDao.myInfo",userId);
    }

    public int newNicknameCheck(MemberDto memberDto){
       return mybatis.selectOne("MyPageDao.newNicknameCheck", memberDto);
    }

    public void modifyInfo(MemberDto memberDto){
        mybatis.update("MyPageDao.modifyInfo",memberDto);
    }

    public List<BoardDto> myWrite(Criteria cri){
        return mybatis.selectList("MyPageDao.myWrite", cri);
    }

    public List<CommentDto> comments(Criteria cri){
        return mybatis.selectList("MyPageDao.comments",cri);
    }

    public int getTotalMyPage(String userId){
        return mybatis.selectOne("MyPageDao.myWriteNum", userId);
    }

    public int getCommentsNum(String userId) {
        return mybatis.selectOne("MyPageDao.getCommentsNum", userId);
    }

    public void uploadProfile(BoardFileDto uploadImg){
        mybatis.insert("MyPageDao.updateProfileImg", uploadImg);
    }
    public BoardFileDto getProfileImg(int userId){
        return mybatis.selectOne("MyPageDao.getProfileImg",userId);
    }
}
