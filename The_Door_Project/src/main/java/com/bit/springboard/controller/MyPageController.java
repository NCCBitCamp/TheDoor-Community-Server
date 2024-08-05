package com.bit.springboard.controller;

import com.bit.springboard.dto.*;
import com.bit.springboard.service.MemberService;
import com.bit.springboard.service.RankService;
import com.bit.springboard.service.MyPageService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/myPage")
public class MyPageController {
    private RankService rankService;

    private MyPageService mypageService;


    @Autowired
    public MyPageController(MyPageService myPageService, RankService rankService){
        this.mypageService = myPageService;
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

    @RequestMapping("/alterNicknameCheck.do")
    @ResponseBody
    public Map<String, Integer> myPageInfoAlterNickname(MemberDto memberDto){
        return mypageService.newNicknameCheck(memberDto);
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
    public String myPageAlertView(HttpSession session, Model model, Criteria cri) {
        MemberDto loginMember = (MemberDto) session.getAttribute("loginMember");

        if(loginMember == null) {
            return "redirect:/member/login.do";
        }

        model.addAttribute("personalInfo", loginMember);
        cri.setUserId(loginMember.getUser_id());

        List<CommentDto> commentList = mypageService.getComment(cri);

        List<Date> dateList = new ArrayList<>();
        commentList.forEach(comment -> {
            dateList.add(convertToDate(comment.getDate()));
        });
        model.addAttribute("convertedTime", dateList);

        model.addAttribute("comments", commentList);

        int total = mypageService.getCommentsNum(loginMember);
        model.addAttribute("page", new PageDto(cri, total));

        return "myPage/myPageAlert";
    }


    @PostMapping("uploadProfileImage.do")
    public String profileUpload(MemberDto memberDto, @RequestParam("uploadImg") MultipartFile uploadImg) {
        System.out.println("profileUpload Controller 실행");
        mypageService.uploadProfile(memberDto, uploadImg);
        return "redirect:/myPage/info.do";
    }



    private Date convertToDate(LocalDateTime localDateTime) {
        return Date.from(localDateTime.atZone(ZoneId.systemDefault()).toInstant());
    }

}