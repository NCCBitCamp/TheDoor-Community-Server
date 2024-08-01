package com.bit.springboard.service;

import com.bit.springboard.dto.BoardDto;
import com.bit.springboard.dto.CommentDto;
import com.bit.springboard.dto.Criteria;
import com.bit.springboard.dto.MemberDto;

import java.util.List;
import java.util.Map;

public interface MyPageService {

    // 기본으로 표현될 유저 정보
    MemberDto getInfo(MemberDto memberDto);

    // 변경할 유저 정보
    void modifyInfo(MemberDto memberDto);

    // 내가 쓴 글 가져오기
    List<BoardDto> getMyWrite(Criteria cri);

    // 댓글 알림으로 가져오기
    List<CommentDto> getComment(Criteria cri);

    // 필요한 페이지 계산하기
    int getTotalMyPage(MemberDto memberDto);

    // 댓글 달린거 가져오기
    int getCommentsNum(MemberDto loginMember);
}
