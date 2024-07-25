package com.bit.springboard.controller;

import com.bit.springboard.dto.Criteria;
import com.bit.springboard.dto.PageDto;
import com.bit.springboard.service.BoardService;
import com.bit.springboard.service.RankService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping("/main")
public class MainController {
    private RankService rankService;

    @Autowired
    public MainController(RankService rankService) {
        this.rankService = rankService;
    }

    @RequestMapping("ranking.do")
    public String rankingView(Model model, Criteria cri) {
        model.addAttribute("rankList", rankService.getRankList(cri));

        int total = rankService.getRankTotalCnt();

        model.addAttribute("page", new PageDto(cri, total));

        return "ranking";
    }

    @RequestMapping("guide.do")
    public String guideView() {
        return "guide";
    }
}
