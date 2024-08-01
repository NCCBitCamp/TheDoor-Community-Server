package com.bit.springboard.controller;

import com.bit.springboard.dto.*;
import com.bit.springboard.service.BoardService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/news")
public class NewsController {
    private BoardService boardService;
    private ApplicationContext applicationContext;

    @Autowired
    public NewsController(ApplicationContext applicationContext) {
        this.applicationContext = applicationContext;
    }

    @GetMapping("/newsWrite.do")
    public String newsWriteView(HttpSession session) {
        MemberDto loginMember = (MemberDto)session.getAttribute("loginMember");

        if(loginMember == null) {
            return "redirect:/member/login.do";
        }

        return "news/newsWrite";
    }

    @PostMapping("/newsWrite.do")
    public String newsWrite(BoardDto boardDto, MultipartFile[] uploadFiles) {
        boardService = applicationContext.getBean("newsServiceImpl", BoardService.class);

        boardService.post(boardDto, uploadFiles);

        return "redirect:/news/news.do";
    }

    @GetMapping("/newsModify.do")
    public String newsModify(BoardDto boardDto, Model model) {
        boardService = applicationContext.getBean("newsServiceImpl", BoardService.class);

        model.addAttribute("news", boardService.getBoard(boardDto.getId()));
        model.addAttribute("fileList", boardService.getBoardFileList(boardDto.getId()));

        return "news/newsModify";
    }

    @PostMapping("/newsModify.do")
    public String newsModify(BoardDto boardDto, MultipartFile[] uploadFiles, MultipartFile[] changeFiles,
                             @RequestParam(name = "originFiles", required = false) String originFiles) {
        boardService = applicationContext.getBean("newsServiceImpl", BoardService.class);

        boardService.modify(boardDto, uploadFiles, changeFiles, originFiles);

        return "redirect:/news/newsDetail.do?id=" + boardDto.getId();
    }

    @RequestMapping("/news.do")
    public String newsListView(Model model, @RequestParam Map<String, String> searchMap, Criteria cri) {
        boardService = applicationContext.getBean("newsServiceImpl", BoardService.class);

        model.addAttribute("newsList", boardService.getBoardList(searchMap, cri));
        model.addAttribute("searchMap", searchMap);

        // 게시글의 총 개수
        int total = boardService.getBoardTotalCnt(searchMap);

        // 화면에서 페이지 표시를 하기 위해 PageDto객체 화면에 전달
        model.addAttribute("page", new PageDto(cri, total));

        return "news/news";
    }

    @RequestMapping("/newsDetail.do")
    public String newsDetailView(BoardDto boardDto, Model model) {
        boardService = applicationContext.getBean("newsServiceImpl", BoardService.class);

        model.addAttribute("news", boardService.getBoard(boardDto.getId()));
        model.addAttribute("fileList", boardService.getBoardFileList(boardDto.getId()));

        return "news/newsDetail";
    }

    @GetMapping("/delete.do")
    public String newsDelete(BoardDto boardDto) {
        boardService = applicationContext.getBean("newsServiceImpl", BoardService.class);

        boardService.delete(boardDto.getId());

        return "redirect:/news/news.do";
    }

    @GetMapping("/updateCnt.do")
    public String updateCnt(BoardDto boardDto) {
        boardService = applicationContext.getBean("newsServiceImpl", BoardService.class);

        boardService.updateCnt(boardDto.getId());

        return "redirect:/news/newsDetail.do?id=" + boardDto.getId();
    }

    @PostMapping("/news-ajax.do")
    @ResponseBody
    public Map<String, Object> newsListAjax(@RequestParam Map<String, String> searchMap, Criteria cri) {
        boardService = applicationContext.getBean("newsServiceImpl", BoardService.class);
        cri.setAmount(9); // 한 페이지에 보여줄 게시글 수
        List<Map<String, Object>> newsList = new ArrayList<>();

        boardService.getBoardList(searchMap, cri).forEach(boardDto -> {
            List<BoardFileDto> boardFileDtoList = boardService.getBoardFileList(boardDto.getId());

            Map<String, Object> map = new HashMap<>();

            map.put("boardDto", boardDto);

            if(boardFileDtoList.size() > 0)
                map.put("file", boardFileDtoList.get(0));

            newsList.add(map);
        });

        Map<String, Object> returnMap = new HashMap<>();

        returnMap.put("newsList", newsList);

        return returnMap;
    }
}
