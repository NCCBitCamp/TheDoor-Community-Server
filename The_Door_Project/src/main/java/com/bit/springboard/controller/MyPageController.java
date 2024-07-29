package com.bit.springboard.controller;

import com.bit.springboard.dao.MyPageDao;
import com.bit.springboard.dto.MemberDto;
import com.bit.springboard.service.MemberService;
import com.bit.springboard.service.MyPageService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/myPage")
public class MyPageController {

    private MyPageService mypageService;

    @Autowired
    public MyPageController(MyPageService myPageService) {
        this.mypageService = myPageService;
    }

    @RequestMapping("/info.do")
    public String myPageInfoView(MemberDto memberDto, HttpSession session, Model model) {
        MemberDto personalInfo = mypageService.getInfo(memberDto);
        model.addAttribute("personalInfo", personalInfo);


        return "myPage/myPageInfo";
    }

    @RequestMapping("/altMyInfo.do")
    public String myPageInfoAlt(){return "myPage/myPageInfo";}



    @RequestMapping("rank.do")
    public String myPageRankView() {
        return "myPage/myPageRank";
    }

    @RequestMapping("post.do")
    public String myPagePostView() {
        return "myPage/myPagePost";
    }

    @RequestMapping("alert.do")
    public String myPageAlertView() {
        return "myPage/myPageAlert";
    }
}