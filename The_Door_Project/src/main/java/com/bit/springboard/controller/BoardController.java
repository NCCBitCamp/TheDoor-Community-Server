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

    @RequestMapping("/free-list.do")
    public String freeListView() {
        return "community/community";
    }

    @RequestMapping("/news-list.do")
    public String noticeListView() {
        return "news/news";
    }

    @GetMapping("/free-detail.do")
    public String freeDetailView() {
        return "community/communityDetail";
    }

    @GetMapping("/news-detail.do")
    public String newsDetailView() {
        return "news/newsDetail";
    }

    @GetMapping("/free-write.do")
    public String freeWriteView() {
        return "community/communityWrite";
    }

    @GetMapping("/news-write.do")
    public String newsWriteView() {
        return "news/newsWrite";
    }

    @GetMapping("/free-modify.do")
    public String freeModifyView() {
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
        return "help/helpQnAWrite";
    }

    @GetMapping("/post.do")
    public String postView(HttpSession session) {
        MemberDto loginMember = (MemberDto) session.getAttribute("loginMember");

        if(loginMember == null) {
            return "redirect:/member/login.do";
        }

        return "board/post";
    }

    @PostMapping("/post.do")
    public String post(BoardDto boardDto, MultipartFile[] uploadFiles) {
        if(boardDto.getType().equals("free")) {
            boardService = applicationContext.getBean("freeBoardServiceImpl", BoardService.class);
        } else if(boardDto.getType().equals("news")) {
            boardService = applicationContext.getBean("noticeServiceImpl", BoardService.class);
        } // FAQ 쪽 게시판 관련 코드 추가
        if(boardDto.getType().equals("qna")) {
            boardService = applicationContext.getBean("helpFaqServiceImpl", BoardService.class);
        } else if(boardDto.getType().equals("faq")) {
            boardService = applicationContext.getBean("helpFaqServiceImpl", BoardService.class);
        }

        boardService.post(boardDto, uploadFiles);

        if(boardDto.getType().equals("free")) {
            return "redirect:/community/free-list.do"; // 요청을 redirect로 보내지 않으면 post.do 라는 요청이 남아있어서 새로고침하면 post 요청이 다시감.
        } else if(boardDto.getType().equals("news")) {
            return "redirect:/news/news-list.do";
        }

        if (boardDto.getType().equals("faq")) {
            return "redirect:/help/help-faq.do";
        } else if (boardDto.getType().equals("qna")) {
            return "redirect:/help/help-qna.do";
        }

        return "0";
    }

    @PostMapping("/modify.do")
    public String modify(BoardDto boardDto, MultipartFile[] uploadFiles, MultipartFile[] changeFiles,
                         @RequestParam(name = "originFiles", required = false) String originFiles) {
        System.out.println(originFiles);
        if(boardDto.getType().equals("free")) {
            boardService = applicationContext.getBean("freeBoardServiceImpl", BoardService.class);
        } else if(boardDto.getType().equals("news")) {
            boardService = applicationContext.getBean("noticeServiceImpl", BoardService.class);
        } // FAQ 쪽 게시판 관련 코드 추가
        if(boardDto.getType().equals("qna")) {
            boardService = applicationContext.getBean("helpFaqServiceImpl", BoardService.class);
        } else if(boardDto.getType().equals("faq")) {
            boardService = applicationContext.getBean("helpFaqServiceImpl", BoardService.class);
        }

        boardService.modify(boardDto, uploadFiles, changeFiles, originFiles);

        if(boardDto.getType().equals("free")) {
            return "redirect:/community/free-list.do"; // 요청을 redirect로 보내지 않으면 post.do 라는 요청이 남아있어서 새로고침하면 post 요청이 다시감.
        } else if(boardDto.getType().equals("news")) {
            return "redirect:/news/news-list.do";
        }

        if(boardDto.getType().equals("faq")) {
            return "redirect:/help/help-faq.do";
        } else if (boardDto.getType().equals("qna")) {
            return "redirect:/help/help-qna.do";
        }

        return "0"; // FAQ 쪽 게시판 관련 조건문 추가해서 return 하기
    }

    @GetMapping("/delete.do")
    public String delete(BoardDto boardDto) {
        if(boardDto.getType().equals("free")) {
            boardService = applicationContext.getBean("freeBoardServiceImpl", BoardService.class);
        } else if(boardDto.getType().equals("news")) {
            boardService = applicationContext.getBean("noticeServiceImpl", BoardService.class);
        } // FAQ 쪽 게시판 관련 코드 추가

        if (boardDto.getType().equals("faq")) {
            boardService = applicationContext.getBean("helpFaqServiceImpl", BoardService.class);
        } else if (boardDto.getType().equals("qna")) {
            boardService = applicationContext.getBean("helpQnaServiceImpl", BoardService.class);
        }

        boardService.delete(boardDto.getId());

        if(boardDto.getType().equals("free")) {
            return "redirect:/community/free-list.do"; // 요청을 redirect로 보내지 않으면 post.do 라는 요청이 남아있어서 새로고침하면 post 요청이 다시감.
        } else if(boardDto.getType().equals("news")) {
            return "redirect:/news/news-list.do";
        }
        if(boardDto.getType().equals("faq")) {
            return "redirect:/help/help-faq.do";
        } else if (boardDto.getType().equals("qna")) {
            return "redirect:/help/help-qna.do";
        }

        return "0"; // FAQ 쪽 게시판 관련 조건문 추가해서 return 하기
    }
}