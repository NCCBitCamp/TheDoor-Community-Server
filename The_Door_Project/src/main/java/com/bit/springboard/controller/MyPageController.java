package com.bit.springboard.controller;

import com.bit.springboard.dto.RankDto;
import com.bit.springboard.service.RankService;
import com.bit.springboard.dto.MemberDto;
import com.bit.springboard.service.MyPageService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/myPage")
public class MyPageController {
    @Autowired
    private RankService rankService;
    @Autowired
    private MyPageService mypageService;

    @Autowired
    public MyPageController(RankService rankService) {
        this.rankService = rankService;
    }


    @RequestMapping("/info.do")
    public String myPageInfoView(HttpSession session, Model model) {
        MemberDto loginMember = (MemberDto)session.getAttribute("loginMember");
        
        if(loginMember == null) {
            return "redirect:/member/login.do";
        }

        MemberDto personalInfo = mypageService.getInfo(loginMember);
        model.addAttribute("personalInfo", personalInfo);

        return "myPage/myPageInfo";
    }

    @RequestMapping("/modifyMyInfo.do")
    public String myPageInfoModify(@ModelAttribute("user") MemberDto newMemberDto, HttpSession session){
//        MemberDto loginMember = (MemberDto) session.getAttribute("loginMember");
        System.out.println(newMemberDto);
        mypageService.modifyInfo(newMemberDto);
        return "myPage/myPageRank";
    }

  
    @RequestMapping("rank.do")
    public String myPageRankView(Model model, RankDto rankDto, HttpSession session) {
        MemberDto loginMember = (MemberDto) session.getAttribute("loginMember");

        if(loginMember == null) {
            return "redirect:/member/login.do";
        }

        model.addAttribute("myTopRanktheHostel", rankService.getMyTopRanktheHostel(loginMember.getUser_id()));
        model.addAttribute("myTopRankbitCamp", rankService.getMyTopRankbitCamp(loginMember.getUser_id()));
        model.addAttribute("myTopRankrozerStone", rankService.getMyTopRankrozerStone(loginMember.getUser_id()));

        List<RankDto> myTopRanks = rankService.getMyTopRank(loginMember.getUser_id());
        System.out.println("Query result: " + myTopRanks);
        model.addAttribute("myTopRanks", myTopRanks);
        return "myPage/myPageRank";
    }

    @RequestMapping("post.do")
    public String myPagePostView(HttpSession session) {
        MemberDto loginMember = (MemberDto) session.getAttribute("loginMember");

        if(loginMember == null) {
            return "redirect:/member/login.do";
        }

        return "myPage/myPagePost";
    }


    @RequestMapping("alert.do")
    public String myPageAlertView(HttpSession session) {
        MemberDto loginMember = (MemberDto) session.getAttribute("loginMember");

        if(loginMember == null) {
            return "redirect:/member/login.do";
        }

        return "myPage/myPageAlert";
    }
}