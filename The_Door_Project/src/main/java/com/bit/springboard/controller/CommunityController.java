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
@RequestMapping("/community")
public class CommunityController {
    private BoardService boardService;
    private ApplicationContext applicationContext;

    @Autowired
    public CommunityController(ApplicationContext applicationContext) {
        this.applicationContext = applicationContext;
    }
    @GetMapping("/community-write.do")
    public String communityWriteView(HttpSession session) {
        MemberDto loginMember = (MemberDto) session.getAttribute("loginMember");

        if(loginMember == null) {
            return "redirect:/member/login.do";
        }

        return "community/communityWrite";
    }

    @PostMapping("/communityWrite.do")
    public String communityWrite(BoardDto boardDto, MultipartFile[] uploadFiles) {
        boardService = applicationContext.getBean("communityServiceImpl", BoardService.class);

        boardService.write(boardDto, uploadFiles);

        return "redirect:/community/community-list.do";
    }

    @PostMapping("/community-modify.do")
    public String communityModify(BoardDto boardDto, MultipartFile[] uploadFiles, MultipartFile[] changeFiles,
                                      @RequestParam(name = "originFiles", required = false) String originFiles) {
        boardService = applicationContext.getBean("communityServiceImpl", BoardService.class);

        boardService.modify(boardDto, uploadFiles, changeFiles, originFiles);

        return "redirect:/community/community-list.do";
    }

    @RequestMapping("/community-list.do")
    public String communityListView() {
        return "community/community";
    }

    @RequestMapping("/community-detail.do")
    public String communityDetailView() {
        return "community/communityDetail";
    }

    @GetMapping("/delete.do")
    public String communityDelete(BoardDto boardDto) {
        boardService = applicationContext.getBean("communityServiceImpl", BoardService.class);

        boardService.delete(boardDto.getId());

        return "redirect:/community/community-list.do";
    }

}
