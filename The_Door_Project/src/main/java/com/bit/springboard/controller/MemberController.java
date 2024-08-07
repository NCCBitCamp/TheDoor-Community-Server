package com.bit.springboard.controller;

import com.bit.springboard.dto.MemberDto;
import com.bit.springboard.service.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/member")
public class MemberController {
    private MemberService memberService;

    @Autowired
    public MemberController(MemberService memberService) {
        this.memberService = memberService;
    }

    @GetMapping("/join.do")
    public String joinView() {
        return "member/join";
    }

    @PostMapping("/join.do")
    public String join(MemberDto memberDto) {
        memberService.join(memberDto);
        return "member/joinComplete";
    }

    @GetMapping("/login.do")
    public String loginView() {
        return "member/login";
    }

    @RequestMapping("/joinComplete.do")
    public String joinComplete() {
        return "member/joinComplete";
    }

    @PostMapping("/userIdCheck.do")
    @ResponseBody
    public Map<String, Integer> userIdCheck(MemberDto memberDto) {
        return memberService.userIdCheck(memberDto.getUser_id());
    }

    @PostMapping("/nicknameCheck.do")
    @ResponseBody
    public Map<String, Integer> nicknameCheck(MemberDto memberDto) {
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
//            return "redirect:/member/login.do";
            return "member/login";
        }
    }

    @GetMapping("/logout.do")
    public String logout(HttpSession session) {
        session.invalidate();

        return "redirect:/member/login.do";
    }

    @GetMapping("/idSearch.do")
    public String idSearchView() {
        return "member/idSearch";
    }

    @PostMapping("/idSearched.do")
    @ResponseBody
    public Map<String, Object> idSearchedView(@ModelAttribute MemberDto memberDto) {
        Map<String, Object> response = new HashMap<>();
        String userId = memberService.idSearch(memberDto);

        if (userId != null) {
            response.put("status", "success");
            response.put("user_id", userId);
        } else {
            response.put("status", "error");
            response.put("message", "일치하는 아이디가 없습니다.");
        }

        return response;
    }

    @GetMapping("/idSearched")
    public String idSearchedResult(@RequestParam("user_id") String userId, Model model) {
        model.addAttribute("user_id", userId);
        return "member/idSearched"; // JSP 경로 설정 (예: WEB-INF/views/member/idSearched.jsp)
    }

    @GetMapping("/passwordSearch.do")
    public String passwordSearchView() {
        return "member/passwordSearch";
    }

    @GetMapping("/passwordChange.do")
    public String passwordChangeView() { return "member/passwordChange"; }

    @PostMapping("/member/passwordChange.do")
    public String changePassword(@RequestParam("password") String password, @RequestParam("user_id") String userId, Model model) {
        if (userId == null) {
            model.addAttribute("errorMessage", "ID가 없습니다.");
            return "member/passwordChange";
        }
        memberService.changePassword(userId, password);
        model.addAttribute("successMessage", "비밀번호가 성공적으로 변경되었습니다.");
        return "member/passwordChange";
    }

    @RequestMapping("/login-help.do")
    public String loginHelpView() {
        return "/member/loginHelp";
    }

    @GetMapping("/emailChange.do")
    public String emailChangeView() { return "member/emailChange"; }

    @PostMapping("/emailChange.do")
    public String changeEmail(MemberDto memberDto, Model model) {
        try {
            if(!memberService.validateUser(memberDto)){
                model.addAttribute("errorMessage", "존재하는 회원정보가 아닙니다.");
                return "member/emailChange";
            }
            memberService.changeEmail(memberDto);
            model.addAttribute("successMessage", "이메일이 성공적으로 변경되었습니다.");
            return "member/emailChange";
        } catch (Exception e) {
            System.out.println("An unknown error occurred: " + e);
            e.printStackTrace();
            return "member/emailChange";
        }
    }


}
