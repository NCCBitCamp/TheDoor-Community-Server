package com.bit.springboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/myPage")
public class MyPageController {
    @RequestMapping("info.do")
    public String myPageInfoView() {
        return "myPage/myPageInfo";
    }

    @RequestMapping("rank.do")
    public String myPageRankView() { return "myPage/myPageRank"; }

    @RequestMapping("post.do")
    public String myPagePostView() {
        return "myPage/myPagePost";
    }

    @RequestMapping("alert.do")
    public String myPageAlertView() {
        return "myPage/myPageAlert";
    }
}