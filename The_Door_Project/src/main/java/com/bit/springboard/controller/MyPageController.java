package com.bit.springboard.controller;

import com.bit.springboard.dto.BoardDto;
import com.bit.springboard.dto.CommentDto;
import com.bit.springboard.dto.RankDto;
import com.bit.springboard.service.RankService;
import com.bit.springboard.dto.MemberDto;
import com.bit.springboard.service.MyPageService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
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
    public String myPageInfoModify(MemberDto newMemberDto){
        mypageService.modifyInfo(newMemberDto);
        return "redirect:/myPage/info.do";
    }

  
    @RequestMapping("rank.do")
    public String myPageRankView(Model model, RankDto rankDto, HttpSession session) {
        MemberDto loginMember = (MemberDto) session.getAttribute("loginMember");

        if(loginMember == null) {
            return "redirect:/member/login.do";
        }

        List<RankDto> myTopRanks = rankService.getMyTopRank(loginMember.getUser_id());
        model.addAttribute("myTopRanks", myTopRanks);
        return "myPage/myPageRank";
    }

    @RequestMapping("post.do")
    public String myPagePostView(HttpSession session, Model model) {
        MemberDto loginMember = (MemberDto) session.getAttribute("loginMember");
        model.addAttribute("personalInfo", loginMember);

        List<BoardDto> myWrite = mypageService.getMyWrite(loginMember);

        model.addAttribute("myWrite", myWrite);

        if(loginMember == null) {
            return "redirect:/member/login.do";
        }

        return "myPage/myPagePost";
    }


    @RequestMapping("alert.do")
    public String myPageAlertView(HttpSession session, Model model) {
        MemberDto loginMember = (MemberDto) session.getAttribute("loginMember");
        model.addAttribute("personalInfo", loginMember);

        List<CommentDto> getCommentList = mypageService.getComment(loginMember);

        List<Date> dateList = new ArrayList<>();
        getCommentList.forEach(comment -> {
            dateList.add(convertToDate(comment.getDate()));
        });
        model.addAttribute("convertedTime", dateList);

        model.addAttribute("getComments", getCommentList);

        if(loginMember == null) {
            return "redirect:/member/login.do";
        }

        return "myPage/myPageAlert";
    }


    private Date convertToDate(LocalDateTime localDateTime) {
        return Date.from(localDateTime.atZone(ZoneId.systemDefault()).toInstant());
    }

}