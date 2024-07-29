package com.bit.springboard.controller;

import com.bit.springboard.dto.MemberDto;
import com.bit.springboard.service.MemberService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/member")
public class MemberController {
    private MemberService memberService;

    @Autowired
    public MemberController(MemberService memberService) {
        this.memberService = memberService;
    }

    @RequestMapping("join.do")
    public String joinView() { return "member/join"; }

    @GetMapping("/login.do")
    public String loginView() { return "member/login"; }

    @RequestMapping("/joinComplete.do")
    public String joinComplete() { return "member/joinComplete";}

    @PostMapping("/usernameCheck.do")
    @ResponseBody
    public String usernameCheck(MemberDto memberDto) {
        return memberService.usernameCheck(memberDto.getUser_id());
    }

    @PostMapping("/login.do")
    public String login(MemberDto memberDto, Model model, HttpSession session) {
        try {
            MemberDto loginMember = memberService.login(memberDto);

            loginMember.setPassword("");
            session.setAttribute("loginMember", loginMember);
            return "/myPage/myPageInfo";
        } catch (Exception e) {
            model.addAttribute("loginFailMsg", e.getMessage());
            return "redirect:/";
        }
    }
}
