package com.bit.springboard.controller;

import com.bit.springboard.dto.*;
import com.bit.springboard.service.RankService;
import com.bit.springboard.service.MyPageService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    public String myPagePostView(HttpSession session, Model model, Criteria cri) {
        MemberDto loginMember = (MemberDto) session.getAttribute("loginMember");

        if(loginMember == null) {
            return "redirect:/member/login.do";
        }

        model.addAttribute("personalInfo", loginMember);
        cri.setUserId(loginMember.getUser_id());

        List<BoardDto> myWrite = mypageService.getMyWrite(cri);

        int total = mypageService.getTotalMyPage(loginMember);

        model.addAttribute("page", new PageDto(cri, total));
        model.addAttribute("myWrite", myWrite);


        return "myPage/myPagePost";
    }


    @RequestMapping("alert.do")
    public String myPageAlertView(
            HttpSession session,
            @RequestParam(value = "lastDate", required = false) LocalDateTime lastDate,
            @RequestParam(value = "lastId", required = false) Integer lastId,
            @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
            Model model, Criteria cri) {

        MemberDto loginMember = (MemberDto) session.getAttribute("loginMember");

        if(loginMember == null) {
            return "redirect:/member/login.do";
        }

        model.addAttribute("personalInfo", loginMember);
        cri.setUserId(loginMember.getUser_id());
        cri.setLastDate(lastDate);
        cri.setLastId(lastId);
        cri.setPageNum(pageNum);


        List<CommentDto> getCommentList = mypageService.getComment(cri);

        List<Date> dateList = new ArrayList<>();
        getCommentList.forEach(comment -> {
            dateList.add(convertToDate(comment.getDate()));
        });
        model.addAttribute("convertedTime", dateList);

        model.addAttribute("getComments", getCommentList);

        int total = mypageService.getCommentsNum(loginMember);
        model.addAttribute("page", new PageDto(cri, total));

        return "myPage/myPageAlert";
    }


    private Date convertToDate(LocalDateTime localDateTime) {
        return Date.from(localDateTime.atZone(ZoneId.systemDefault()).toInstant());
    }

}