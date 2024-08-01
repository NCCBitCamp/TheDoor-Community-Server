package com.bit.springboard.controller;

import com.bit.springboard.dto.MemberDto;
import com.bit.springboard.service.AuthService;
import com.bit.springboard.service.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/mail")
public class MailController {
    private final MailService registerMail;
    private final AuthService authService;

    @Autowired
    public MailController(MailService registerMail, AuthService authService) {
        this.registerMail = registerMail;
        this.authService = authService;
    }

    // 이메일 보내고 인증코드 db에 저장하기
    @RequestMapping("/confirm.do")
    public void mailConfirm(MemberDto memberDto) throws Exception{
        registerMail.sendSimpleMessage(memberDto.getEmail());

        // 인증코드를 DB에 저장
        authService.save(memberDto);
    }

    // 인증코드가 db에 있는지 검증
    @PostMapping("/verify")
    public boolean verifyCode(MemberDto memberDto) {
        return authService.find(memberDto);
    }

    // 인증코드를 폐기(jsp 단에서 제한시간 지나면 실행되도록 구현하기)
    @PostMapping("/expire")
    public void expire(MemberDto memberDto) {
        authService.expire(memberDto);
    }

}
