package com.bit.springboard.service.impl;

import com.bit.springboard.dao.MyPageDao;
import com.bit.springboard.dto.BoardDto;
import com.bit.springboard.dto.CommentDto;
import com.bit.springboard.dto.Criteria;
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
    public List<BoardDto> getMyWrite(Criteria cri) {
        cri.setStartNum((cri.getPageNum() - 1) * cri.getAmount());
        return myPageDao.myWrite(cri);
    }

    @Override
    public List<CommentDto> getComment(MemberDto memberDto) {
        return myPageDao.getComment(memberDto.getUser_id());
    }

    @Override
    public int getTotalMyPage(MemberDto memberDto){
        return myPageDao.getTotalMyPage(memberDto.getUser_id());
    }

}
