package com.bit.springboard.controller;

import com.bit.springboard.dto.*;
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

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/community")
public class CommunityController {
    private ApplicationContext applicationContext;
    private BoardService boardService;

    @Autowired
    public CommunityController(ApplicationContext applicationContext) {
        this.applicationContext = applicationContext;
    }

    @GetMapping("/communityWrite.do")
    public String communityWriteView(HttpSession session) {
        MemberDto loginMember = (MemberDto) session.getAttribute("loginMember");

        if(loginMember == null) {
            return "redirect:/member/login.do";
        }

        return "/community/communityWrite";
    }

    @PostMapping("/communityWrite.do")
    public String communityWrite(BoardDto boardDto, MultipartFile[] uploadFiles) {
        // 의존성주입
        boardService = applicationContext.getBean("communityServiceImpl", BoardService.class);

        boardService.post(boardDto, uploadFiles);

        return "redirect:/community/community.do";
    }

    @PostMapping("/communityModify.do")
    public String communityModify(BoardDto boardDto, MultipartFile[] uploadFiles, MultipartFile[] changeFiles,
                                      @RequestParam(name = "originFiles", required = false) String originFiles) {
        boardService = applicationContext.getBean("communityServiceImpl", BoardService.class);

        boardService.modify(boardDto, uploadFiles, changeFiles, originFiles);

        return "redirect:/community/communityDetail.do?id=" + boardDto.getId();
    }

    @RequestMapping("/community.do")
    public String communityListView(Model model, @RequestParam Map<String, String> searchMap, Criteria cri) {
        boardService = applicationContext.getBean("communityServiceImpl", BoardService.class);

        model.addAttribute("communityList", boardService.getBoardList(searchMap, cri));
        model.addAttribute("searchMap", searchMap);

        // 게시글의 총 개수
        int total = boardService.getBoardTotalCnt(searchMap);

        // 화면에서 페이지 표시를 하기 위해 PageDto객체 화면에 전달
        model.addAttribute("page", new PageDto(cri, total));

        return "/community/community";
    }

    @GetMapping("/communityDetail.do")
    public String communityDetailView(@RequestParam("id") int id, Model model) {
        BoardDto board = boardService.getBoard(id);
        List<BoardFileDto> fileList = boardService.getBoardFileList(id);

        model.addAttribute("community", board);
        model.addAttribute("fileList", fileList);

        return "/community/communityDetail";
    }

    @GetMapping("/delete.do")
    public String communityDelete(BoardDto boardDto) {
        boardService = applicationContext.getBean("communityServiceImpl", BoardService.class);

        boardService.delete(boardDto.getId());

        return "redirect:/community/community.do";
    }

    @GetMapping("/updateCnt.do")
    public String updateCnt(BoardDto boardDto) {
        boardService = applicationContext.getBean("communityServiceImpl", BoardService.class);

        boardService.updateCnt(boardDto.getId());

        return "redirect:/community/communityDetail.do?id=" + boardDto.getId();
    }

}
