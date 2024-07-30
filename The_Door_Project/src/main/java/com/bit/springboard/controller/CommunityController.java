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

    @PostMapping("/community-write.do")
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
    public String communityListView(Model model, @RequestParam Map<String, String> searchMap, Criteria cri) {
        boardService = applicationContext.getBean("communitySeviceImpl", BoardService.class);

        model.addAttribute("communityList", boardService.getBoardList(searchMap, cri));
        model.addAttribute("searchMap", searchMap);

        // 게시글의 총 개수
        int total = boardService.getBoardTotalCnt(searchMap);

        // 화면에서 페이지 표시를 하기 위해 PageDto객체 화면에 전달
        model.addAttribute("page", new PageDto(cri, total));

        return "community/community-list.do";
    }

    @RequestMapping("/community-detail.do")
    public String communityDetailView(BoardDto boardDto, Model model) {
        boardService = applicationContext.getBean("communityServiceImpl", BoardService.class);

        model.addAttribute("community", boardService.getBoard(boardDto.getId()));
        model.addAttribute("fileList", boardService.getBoardFileList(boardDto.getId()));

        return "community/community-detail";
    }

    @GetMapping("/delete.do")
    public String communityDelete(BoardDto boardDto) {
        boardService = applicationContext.getBean("communityServiceImpl", BoardService.class);

        boardService.delete(boardDto.getId());

        return "redirect:/community/community-list.do";
    }

    @GetMapping("/update-cnt.do")
    public String updateCnt(BoardDto boardDto) {
        boardService = applicationContext.getBean("communityServiceImpl", BoardService.class);

        boardService.updateCnt(boardDto.getId());

        return "redirect:/community/community-detail.do?id=" + boardDto.getId();
    }

}
