package com.bit.springboard.service;

import com.bit.springboard.dto.MemberDto;

import java.lang.reflect.Member;
import java.util.List;
import java.util.Map;

public interface MemberService {
    void join(MemberDto memberDto);

    Map<String, Integer> userIdCheck(String userId);

    Map<String, Integer> nicknameCheck(String nickname);

    String idSearch(MemberDto memberDto);

    List<MemberDto> getMembers();

    MemberDto getMemberByUsername(String username);

    MemberDto login(MemberDto memberDto);

    String usernameCheck(String username);
}
