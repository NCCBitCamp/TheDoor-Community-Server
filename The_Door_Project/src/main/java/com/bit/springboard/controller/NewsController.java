package com.bit.springboard.controller;

import com.bit.springboard.dto.BoardDto;
import com.bit.springboard.dto.MemberDto;
import com.bit.springboard.service.BoardService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/news")
public class NewsController {
    private BoardService boardService;
    private ApplicationContext applicationContext;

    @Autowired
    public NewsController(ApplicationContext applicationContext) {
        this.applicationContext = applicationContext;
    }

    @GetMapping("/news-write.do")
    public String newsWriteView(HttpSession session) {
        MemberDto loginMember = (MemberDto) session.getAttribute("loginMember");

        if(loginMember == null) {
            return "redirect:/member/login.do";
        }

        return "news/newsWrite";
    }

    @PostMapping("/news-write.do")
    public String newsWrite(BoardDto boardDto, MultipartFile[] uploadFiles) {
        boardService = applicationContext.getBean("newsServiceImpl", BoardService.class);

        boardService.write(boardDto, uploadFiles);

        return "redirect:/news/news-list.do";
    }

    @PostMapping("/news-modify.do")
    public String newsModify(BoardDto boardDto, MultipartFile[] uploadFiles, MultipartFile[] changeFiles,
                             @RequestParam(name = "originFiles", required = false) String originFiles) {
        boardService = applicationContext.getBean("newsServiceImpl", BoardService.class);

        boardService.modify(boardDto, uploadFiles, changeFiles, originFiles);

        return "redirect:/news/news-list.do";
    }

    @RequestMapping("/news-list.do")
    public String newsListView() {
        return "news/news";
    }

    @RequestMapping("/news-detail.do")
    public String newsDetailView() {
        return "news/newsDetail";
    }

    @GetMapping("/delete.do")
    public String newsDelete(BoardDto boardDto) {
        boardService = applicationContext.getBean("newsServiceImpl", BoardService.class);

        boardService.delete(boardDto.getId());

        return "redirect:/news/news-list.do";
    }
}
