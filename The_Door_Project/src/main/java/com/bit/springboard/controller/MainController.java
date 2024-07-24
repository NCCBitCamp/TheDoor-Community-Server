package com.bit.springboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class MainController {
    @RequestMapping("ranking.do")
    public String rankingView() {
        return "ranking";
    }

    @RequestMapping("guide.do")
    public String guideView() {
        return "guide";
    }
}
