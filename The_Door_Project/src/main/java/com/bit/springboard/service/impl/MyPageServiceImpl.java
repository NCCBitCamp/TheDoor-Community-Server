package com.bit.springboard.service.impl;

import com.bit.springboard.dao.MyPageDao;
import com.bit.springboard.dto.BoardDto;
import com.bit.springboard.dto.MemberDto;
import com.bit.springboard.service.BoardService;
import com.bit.springboard.service.MyPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MyPageServiceImpl implements MyPageService {

    private MyPageDao myPageDao;

    @Autowired
    public MyPageServiceImpl(MyPageDao myPageDao) { this.myPageDao = myPageDao;}

    @Override
    public MemberDto getInfo(MemberDto memberDto) {
        return myPageDao.myInfo(memberDto.getUser_id());
    }

    @Override
    public void modifyInfo(MemberDto memberDto) {
        myPageDao.modifyInfo(memberDto);
    }

    @Override
    public List<BoardDto> getMyWrite(MemberDto memberDto) {
        System.out.println(myPageDao.myWrite(memberDto.getUser_id()));
        return myPageDao.myWrite(memberDto.getUser_id());
    }
}
