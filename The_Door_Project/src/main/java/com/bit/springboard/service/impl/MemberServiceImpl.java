package com.bit.springboard.service.impl;

import com.bit.springboard.dao.MemberDao;
import com.bit.springboard.dto.MemberDto;
import com.bit.springboard.service.MemberService;
import org.springframework.stereotype.Service;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Member;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MemberServiceImpl implements MemberService {
    private MemberDao memberDao;

    @Autowired
    public MemberServiceImpl(MemberDao memberDao) {
        this.memberDao = memberDao;
    }

    @Override
    public Map<String, Integer> userIdCheck(String userId) {
        int userIdCheck = memberDao.userIdCheck(userId);

        Map<String, Integer> forJsonMap = new HashMap<>();

        forJsonMap.put("userIdCheckNum", userIdCheck);

        return forJsonMap;
    }

    @Override
    public Map<String, Integer> nicknameCheck(String nickname) {
        int nicknameCheck = memberDao.nicknameCheck(nickname);

        Map<String, Integer> forJsonMap = new HashMap<>();

        forJsonMap.put("nicknameCheckNum", nicknameCheck);

        return forJsonMap;
    }

    @Override
    public void join(MemberDto memberDto) {
        memberDao.join(memberDto);
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
        boolean usernameCheck = memberDao.usernameCheck(memberDto.getUser_id());

        if(usernameCheck == false)
            throw new RuntimeException("idNotExist");

        MemberDto loginMember = memberDao.login(memberDto);

        if(loginMember == null)
            throw new RuntimeException("wrongPassword");

        return loginMember;
    }

    @Override
    public String usernameCheck(String username) {
        boolean usernameCheck = memberDao.usernameCheck(username);
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, String> jsonMap = new HashMap<>();

        if(usernameCheck == false) {
            jsonMap.put("usernameCheckMsg", "usernameOk");
        } else {
            jsonMap.put("usernameCheckMsg", "usernameFail");
        }

        String jsonString = "";

        try {
            jsonString = objectMapper.writerWithDefaultPrettyPrinter()
                    .writeValueAsString(jsonMap);
        } catch (JsonProcessingException je) {
            System.out.println(je.getMessage());
        }
        System.out.println(jsonString);
        return jsonString;
    }

    @Override
    public Map<String, String> idSearch(MemberDto memberDto) {
        String idSearch = memberDao.idSearchDao(memberDto);

        Map<String, String> forJsonMap = new HashMap<>();

        forJsonMap.put("idSearchMapKey", idSearch);

        return forJsonMap;
    }
}
