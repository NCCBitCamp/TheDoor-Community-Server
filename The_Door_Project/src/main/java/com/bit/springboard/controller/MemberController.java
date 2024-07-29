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
import java.util.Map;

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

    @PostMapping("/userIdCheck.do")
    @ResponseBody
    public Map<String, Integer> userIdCheck(MemberDto memberDto) {
        System.out.println(memberDto);
        return memberService.userIdCheck(memberDto.getUser_id());
    }

    @PostMapping("/nicknameCheck.do")
    @ResponseBody
    public Map<String, Integer> nicknameCheck(MemberDto memberDto) {
        System.out.println(memberDto);
        return memberService.nicknameCheck(memberDto.getNickname());
    }

    @PostMapping("/login.do")
    public String login(MemberDto memberDto, Model model, HttpSession session) {
        try {
            MemberDto loginMember = memberService.login(memberDto);
            loginMember.setPassword("");
            session.setAttribute("loginMember", loginMember);
            return "redirect:/";
        } catch (Exception e) {
            model.addAttribute("loginFailMsg", e.getMessage());
            return "redirect:/";
        }
    }

    @GetMapping("/logout.do")
    public String logout(HttpSession session) {
        session.invalidate();

        return "redirect:/member/login.do";
    }
}
