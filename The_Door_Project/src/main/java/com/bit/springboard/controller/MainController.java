package com.bit.springboard.controller;

import com.bit.springboard.dto.Criteria;
import com.bit.springboard.dto.PageDto;
import com.bit.springboard.dto.RankDto;
import com.bit.springboard.service.BoardService;
import com.bit.springboard.service.RankService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/main")
public class MainController {
    private RankService rankService;

    @Autowired
    public MainController(RankService rankService) {
        this.rankService = rankService;
    }

    @RequestMapping("/ranking.do")
    public String rankingView(@RequestParam(value = "gametype", defaultValue = "theHostel") String gametype, Model model, Criteria cri, HttpServletRequest request) {
        // gametype 파라미터에 따라 데이터를 필터링
        cri.setGameType(gametype);

        List<RankDto> rankList = rankService.getRankList(cri);
        model.addAttribute("rankList", rankList);

        int total = rankService.getRankTotalCnt(gametype); // 게임별 총 랭크 수를 계산
        model.addAttribute("page", new PageDto(cri, total));
        model.addAttribute("gametype", gametype);

        // 현재 페이지 번호와 페이지당 항목 수를 기반으로 시작 등수를 계산합니다.
        int startRank = (cri.getPageNum() - 1) * cri.getAmount() + 1;
        model.addAttribute("startRank", startRank);

        // 전체 페이지를 반환
        return "ranking";
    }

    @RequestMapping("/guide.do")
    public String guideView() {
        return "guide";
    }
}
