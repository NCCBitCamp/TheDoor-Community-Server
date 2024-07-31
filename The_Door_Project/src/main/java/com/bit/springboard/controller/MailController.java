package com.bit.springboard.controller;


import com.bit.springboard.service.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/mail")
public class MailController {
    private final MailService registerMail;

    @Autowired
    public MailController(MailService registerMail) {
        this.registerMail = registerMail;
    }

    @RequestMapping("/confirm.do")
    public String mailConfirm(@RequestParam(name = "email") String email) throws Exception{
        String code = registerMail.sendSimpleMessage(email);
        System.out.println("사용자에게 발송한 인증코드 ==> " + code);

        return code;
    }

}
