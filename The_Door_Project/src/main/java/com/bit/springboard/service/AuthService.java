package com.bit.springboard.service;

import com.bit.springboard.dto.MemberDto;

public interface AuthService {
    public void save(MemberDto memberDto);

    public void expire(MemberDto memberDto);

    public boolean find(MemberDto memberDto);
}
