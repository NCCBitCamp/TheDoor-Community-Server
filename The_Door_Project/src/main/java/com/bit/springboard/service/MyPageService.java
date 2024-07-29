package com.bit.springboard.service;

import com.bit.springboard.dto.MemberDto;

public interface MyPageService {

    // 기본으로 표현될 유저 정보
    MemberDto getInfo(MemberDto memberDto);

    // 변경할 유저 정보 (password, email, nickname) 빈칸이면 기존유지? 빈칸불가?
    void modifyInfo(MemberDto memberDto);


}
