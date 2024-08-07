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
import java.util.*;

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

        BoardFileDto profileInfo = mypageService.getProfileImg(personalInfo.getId());
        model.addAttribute("profileImg",profileInfo);

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


        MemberDto personalInfo = mypageService.getInfo(loginMember);
        model.addAttribute("personalInfo", personalInfo);

        BoardFileDto profileInfo = mypageService.getProfileImg(personalInfo.getId());
        model.addAttribute("profileImg",profileInfo);

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

        MemberDto personalInfo = mypageService.getInfo(loginMember);
        model.addAttribute("personalInfo", personalInfo);

        BoardFileDto profileInfo = mypageService.getProfileImg(personalInfo.getId());
        model.addAttribute("profileImg",profileInfo);

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


        MemberDto personalInfo = mypageService.getInfo(loginMember);
        model.addAttribute("personalInfo", personalInfo);

        BoardFileDto profileInfo = mypageService.getProfileImg(personalInfo.getId());
        model.addAttribute("profileImg",profileInfo);

        return "myPage/myPageAlert";
    }


    @PostMapping("uploadProfileImage.do")
    @ResponseBody
    public String profileUpload(@RequestParam("uploadImg") MultipartFile uploadImg, HttpSession session) {
//        System.out.println("profileUpload Controller 실행");

//        String fileName = uploadImg.getOriginalFilename();
//        시간여유 되면 저장하는 값에 쓰레기값 추가해서 저장해주기
//        System.out.println(fileName);
        MemberDto memberDto = (MemberDto)session.getAttribute("loginMember");
        mypageService.uploadProfile(memberDto, uploadImg);
        return "myPage/myPageInfo";
    }



    private Date convertToDate(LocalDateTime localDateTime) {
        return Date.from(localDateTime.atZone(ZoneId.systemDefault()).toInstant());
    }

}