package com.bit.springboard.service.impl;

import com.bit.springboard.dao.MyPageDao;
import com.bit.springboard.dto.MemberDto;
import com.bit.springboard.service.MyPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyPageServiceImpl implements MyPageService {
    private MyPageDao myPageDao;

    @Autowired
    public MyPageServiceImpl(MyPageDao myPageDao) { this.myPageDao = myPageDao;}

    @Override
    public MemberDto getInfo(MemberDto memberDto) {
        System.out.println(myPageDao.myInfo("testuser"));
        return myPageDao.myInfo("testuser");
//        return myPageDao.myInfo(memberDto.getNickname());
    }

    @Override
    public MemberDto altInfo(MemberDto memberDto) {
        return null;
    }
}
