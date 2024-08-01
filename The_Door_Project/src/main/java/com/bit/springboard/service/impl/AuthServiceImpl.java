package com.bit.springboard.service.impl;

import com.bit.springboard.dao.AuthCodeDao;
import com.bit.springboard.dto.MemberDto;
import com.bit.springboard.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthServiceImpl implements AuthService {
    private AuthCodeDao authCodeDao;

    @Autowired
    public AuthServiceImpl(AuthCodeDao authCodeDao) {this.authCodeDao = authCodeDao;}

    @Override
    public void save(MemberDto memberDto) {
        authCodeDao.save(memberDto);
    }

    @Override
    public boolean find(MemberDto memberDto) {
        return authCodeDao.find(memberDto) != null;
    }

    @Override
    public void expire(MemberDto memberDto) {
        authCodeDao.expire(memberDto);
    }
}
