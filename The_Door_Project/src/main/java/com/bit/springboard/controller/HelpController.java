package com.bit.springboard.controller;

import com.bit.springboard.dto.BoardDto;
import com.bit.springboard.dto.Criteria;
import com.bit.springboard.dto.MemberDto;
import com.bit.springboard.dto.PageDto;
import com.bit.springboard.service.BoardService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

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
    public String helpQnAView(Model model, @RequestParam Map<String, String> searchMap, Criteria cri) {
        boardService = applicationContext.getBean("helpQnaServiceImpl", BoardService.class);
        System.out.println(boardService.getBoardList(searchMap, cri));
        model.addAttribute("qnaBoardList", boardService.getBoardList(searchMap, cri));
        int total = boardService.getBoardTotalCnt(searchMap);
        model.addAttribute("page", new PageDto(cri, total));
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

//    @RequestMapping("/qna-list.do")
//    public String qnaListView(Model model, @RequestParam Map<String, String> searchMap, Criteria cri) {
//        System.out.println(cri);
//        // System.out.println(searchMap);
//        boardService = applicationContext.getBean("helpQnaServiceImpl", BoardService.class);
//
//        model.addAttribute("qnaBoardList", boardService.getBoardList(searchMap, cri));
//        model.addAttribute("searchMap", searchMap);
//
//        // 게시글의 총 개수
//        int total = boardService.getBoardTotalCnt(searchMap);
//
//        // 화면에서 페이지 표시를 하기 위해 PageDto객체 화면에 전달
//        model.addAttribute("page", new PageDto(cri, total));
//
//        return "/help/helpQnA";
//    }

    @GetMapping("/update-cnt.do")
    public String updateCnt(BoardDto boardDto) {

        boardService = applicationContext.getBean("helpQnaServiceImpl", BoardService.class);

        boardService.updateCnt(boardDto.getId());

        return "redirect:/helpboard/help-qna-display.do?id=" + boardDto.getId();

    }

    @GetMapping("/help-qna-display.do")
    public String qnaDetailView(BoardDto boardDto, Model model) {
        boardService = applicationContext.getBean("helpQnaServiceImpl", BoardService.class);
        model.addAttribute("qnaboard", boardService.getBoard(boardDto.getId()));
        model.addAttribute("fileList", boardService.getBoardFileList(boardDto.getId()));
        System.out.println("qnaDetailView 동작함");
        return "help/helpQnADisplay";
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


        return "redirect:/helpboard/help-qna.do";


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
