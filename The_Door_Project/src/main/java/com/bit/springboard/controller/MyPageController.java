package com.bit.springboard.controller;

import com.bit.springboard.dto.Criteria;
import com.bit.springboard.dto.RankDto;
import com.bit.springboard.service.RankService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/myPage")
public class MyPageController {
    @Autowired
    private RankService rankService;

    @Autowired
    public MyPageController(RankService rankService) {
        this.rankService = rankService;
    }

    @RequestMapping("info.do")
    public String myPageInfoView() {
        return "myPage/myPageInfo";
    }
  
    @RequestMapping("rank.do")
    public String myPageRankView(Model model, RankDto rankDto) {
        model.addAttribute("myTopRanktheHostel", rankService.getMyTopRanktheHostel(rankDto));
        model.addAttribute("myTopRankbitCamp", rankService.getMyTopRankbitCamp(rankDto));
        model.addAttribute("myTopRankrozerStone", rankService.getMyTopRankrozerStone(rankDto));
        return "myPage/myPageRank";
    }


    @RequestMapping("/post.do")
    public String myPagePostView() {
        return "myPage/myPagePost";
    }

    @RequestMapping("/alert.do")
    public String myPageAlertView() {
        return "myPage/myPageAlert";
    }
}