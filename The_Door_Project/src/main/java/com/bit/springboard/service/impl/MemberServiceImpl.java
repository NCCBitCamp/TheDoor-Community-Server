package com.bit.springboard.service.impl;

import com.bit.springboard.dao.MemberDao;
import com.bit.springboard.dto.MemberDto;
import com.bit.springboard.service.MemberService;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MemberServiceImpl implements MemberService {
    private MemberDao memberDao;

    public MemberServiceImpl(MemberDao memberDao) {
        this.memberDao = memberDao;
    }

    @Override
    public Map<String, Integer> userIdCheck(String userId) {
        int userIdCheck = memberDao.userIdCheck(userId);
        System.out.println(userIdCheck);

        Map<String, Integer> forJsonMap = new HashMap<>();

        forJsonMap.put("userIdCheckNum", userIdCheck);

        return forJsonMap;
    }
    @Override
    public Map<String, Integer> nicknameCheck(String nickname) {
        int nicknameCheck = memberDao.nicknameCheck(nickname);
        System.out.println("nicknameCheck = " + nicknameCheck);

        Map<String, Integer> forJsonMap = new HashMap<>();

        forJsonMap.put("nicknameCheckNum", nicknameCheck);

        return forJsonMap;
    }

    @Override
    public void join(MemberDto memberDto) {

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
