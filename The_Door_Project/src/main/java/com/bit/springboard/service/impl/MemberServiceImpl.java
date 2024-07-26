package com.bit.springboard.service.impl;

import com.bit.springboard.dao.MemberDao;
import com.bit.springboard.dto.MemberDto;
import com.bit.springboard.service.MemberService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MemberServiceImpl implements MemberService {
    private MemberDao memberDao;

    @Override
    public Map<String, Integer> userIdCheck(String userId) {
        int userIdCheck = memberDao.userIdCheck(userId);
        System.out.println(userIdCheck);

        Map<String, Integer> forJsonMap = new HashMap<>();

        if(userIdCheck == 0) {
            forJsonMap.put("userIdCheckNum", 0);
        } else {
            forJsonMap.put("userIdCheckNum", 5);
        }

        return forJsonMap;
    }

    @Override
    public void join(MemberDto memberDto) {

    }

    @Override
    public String nicknameCheck(String nickname) {
        return "";
    }

    @Override
    public List<MemberDto> getMembers() {
        return List.of();
    }

    @Override
    public MemberDto getMemberByUsername(String username) {
        return null;
    }


    @Override
    public MemberDto login(MemberDto memberDto) {
        return null;
    }
}
