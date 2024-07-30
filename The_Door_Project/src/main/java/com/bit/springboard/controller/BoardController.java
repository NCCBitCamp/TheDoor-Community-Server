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
@RequestMapping("/board")
public class BoardController {
    private BoardService boardService;
    private ApplicationContext applicationContext;

    @Autowired
    public BoardController(ApplicationContext applicationContext) {
        this.applicationContext = applicationContext;
    }

    @RequestMapping("/community-list.do")
    public String communityListView() {
        return "community/community";
    }

    @RequestMapping("/news-list.do")
    public String newsListView() {
        return "news/news";
    }

    @GetMapping("/community-detail.do")
    public String communityDetailView() {
        return "community/communityDetail";
    }

    @GetMapping("/news-detail.do")
    public String newsDetailView() {
        return "news/newsDetail";
    }

    @GetMapping("/community-write.do")
    public String communityWriteView() {
        return "community/communityWrite";
    }

    @GetMapping("/news-write.do")
    public String newsWriteView() {
        return "news/newsWrite";
    }

    @GetMapping("/community-modify.do")
    public String communityModifyView() {
        return "community/communityModify";
    }

    @GetMapping("/news-modify.do")
    public String newsModifyView() {
        return "news/newsModify";
    }

    @RequestMapping("/help-main.do")
    public String helpMainView() {
        return "help/help";
    }

    @GetMapping("/community-write.do")
    public String communityWriteView(HttpSession session) {
        MemberDto loginMember = (MemberDto) session.getAttribute("loginMember");

        if(loginMember == null) {
            return "redirect:/member/login.do";
        }

        return "community/communityWrite";
    }

    @PostMapping("/community-write.do")
    public String communityWrite(BoardDto boardDto, MultipartFile[] uploadFiles) {
        if(boardDto.getType().equals("community"))
            boardService = applicationContext.getBean("CommunityServiceImpl", BoardService.class);

        boardService.post(boardDto, uploadFiles);

        return "redirect:/community/community-list.do";

    }

    @PostMapping("/modify.do")
    public String modify(BoardDto boardDto, MultipartFile[] uploadFiles, MultipartFile[] changeFiles,
                         @RequestParam(name = "originFiles", required = false) String originFiles) {
        System.out.println(originFiles);
        if(boardDto.getType().equals("community"))
            boardService = applicationContext.getBean("CommunityServiceImpl", BoardService.class);

        boardService.modify(boardDto, uploadFiles, changeFiles, originFiles);

        return "redirect:/community/community-list.do"; // 요청을 redirect로 보내지 않으면 post.do 라는 요청이 남아있어서 새로고침하면 post 요청이 다시감.
    }

    @GetMapping("/delete.do")
    public String delete(BoardDto boardDto) {
        if(boardDto.getType().equals("free"))
            boardService = applicationContext.getBean("CommunityServiceImpl", BoardService.class);

        boardService.delete(boardDto.getId());

        return "redirect:/community/community-list.do"; // 요청을 redirect로 보내지 않으면 post.do 라는 요청이 남아있어서 새로고침하면 post 요청이 다시감.

    }

    @GetMapping("update-cnt.do")
    public String updateCnt(BoardDto boardDto) {
        if (boardDto.getType().equals("community"))
            boardService = applicationContext.getBean("CommunityServiceImpl", BoardService.class);

        boardService.updateCnt(boardDto.getId());

        return "redirect:/community/community-list.do?id=" + boardDto.getId(); // 요청을 redirect로 보내지 않으면 post.do 라는 요청이 남아있어서 새로고침하면 post 요청이 다시감.
    }
}
