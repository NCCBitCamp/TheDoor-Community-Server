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
@RequestMapping("/helpboard")
public class HelpController {
    private BoardService boardService;
    private ApplicationContext applicationContext;

    @Autowired
    public HelpController(ApplicationContext applicationContext) {

        this.applicationContext = applicationContext;
    }

    @RequestMapping("/help-main.do")
    public String helpMainView() {
        return "help/help";
    }

    @RequestMapping("/help-faq.do")
    public String helpFaQView() {
        return "help/helpFaQ";
    }

    @RequestMapping("/help-qna.do")
    public String helpQnAView() {
        return "help/helpQnA";
    }

    @RequestMapping("/help-faq-purchase.do")
    public String helpFaQPurchaseView() {
        return "help/helpFaQ_purchase";
    }

    @RequestMapping("/help-faq-account.do")
    public String helpFaQAccountView() {
        return "help/helpFaQ_account";
    }

    @RequestMapping("/help-faq-etc.do")
    public String helpFaQEtcView() {
        return "help/helpFaQ_etc";
    }

    @RequestMapping("/help-qna-write.do")
    public String helpQnAWriteView() {
        return "help/helpQnAwrite";
    }

    @GetMapping("/post.do")
    public String postView(HttpSession session) {
        MemberDto loginMember = (MemberDto) session.getAttribute("loginMember");

        if(loginMember == null) {
            return "redirect:/member/login.do";
        }

        return "helpboard/post";
    }

    @PostMapping("/post.do")
    public String post(BoardDto boardDto, MultipartFile[] uploadFiles) {

        boardService = applicationContext.getBean("helpQnaServiceImpl", BoardService.class);


        boardService.post(boardDto, uploadFiles);


        return "redirect:/help/help-qna.do";


    }

    @PostMapping("/modify.do")
    public String modify(BoardDto boardDto, MultipartFile[] uploadFiles, MultipartFile[] changeFiles,
                         @RequestParam(name = "originFiles", required = false) String originFiles) {
        System.out.println(originFiles);

        boardService = applicationContext.getBean("helpFaqServiceImpl", BoardService.class);

        boardService.modify(boardDto, uploadFiles, changeFiles, originFiles);

        return "redirect:/help/help-qna.do";


    }

    @GetMapping("/delete.do")
    public String delete(BoardDto boardDto) {

        boardService = applicationContext.getBean("helpQnaServiceImpl", BoardService.class);


        boardService.delete(boardDto.getId());


        return "redirect:/help/help-qna.do";

    }
}
