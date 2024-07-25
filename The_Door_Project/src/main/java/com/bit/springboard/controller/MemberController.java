package com.bit.springboard.controller;

import com.bit.springboard.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {
    private MemberService memberService;

//    @Autowired
//    public MemberController(MemberService memberService) {this.memberService = memberService;}

    @RequestMapping("join.do")
    public String joinView() { return "member/join"; }

    @GetMapping("/login.do")
    public String loginView() { return "member/login"; }

    @RequestMapping("/joinComplete.do")
    public String joinComplete() { return "member/joinComplete";}










}
