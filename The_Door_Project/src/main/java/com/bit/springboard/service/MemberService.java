package com.bit.springboard.service;

import com.bit.springboard.dto.MemberDto;

import java.util.List;
import java.util.Map;

public interface MemberService {
    void join(MemberDto memberDto);

    Map<String, Integer> userIdCheck(String userId);

    String nicknameCheck(String nickname);

    List<MemberDto> getMembers();

    MemberDto getMemberByUsername(String username);

    MemberDto login(MemberDto memberDto);
}
