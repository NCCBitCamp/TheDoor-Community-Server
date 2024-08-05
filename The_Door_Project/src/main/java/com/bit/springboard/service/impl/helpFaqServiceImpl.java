package com.bit.springboard.service.impl;


import com.bit.springboard.dao.HelpFaqDao;
import com.bit.springboard.dto.BoardDto;
import com.bit.springboard.dto.BoardFileDto;
import com.bit.springboard.dto.CommentDto;
import com.bit.springboard.dto.Criteria;
import com.bit.springboard.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class helpFaqServiceImpl implements BoardService{
    private HelpFaqDao helpFaqDao;

    @Autowired
    public helpFaqServiceImpl(HelpFaqDao helpFaqDao) {
        this.helpFaqDao = helpFaqDao;
    }
    @Override
    public void post(BoardDto boardDto, MultipartFile[] uploadFiles) {
        // Implement the post method for FAQ
    }

    @Override
    public void modify(BoardDto boardDto, MultipartFile[] uploadFiles, MultipartFile[] changeFiles, String originFiles) {
        // Implement the modify method for FAQ
    }

    @Override
    public void delete(int id) {
        // Implement the delete method for FAQ
    }

    @Override
    public void updateCnt(int id) {
        helpFaqDao.updateCnt(id);
    }



    @Override
    public void plusCnt(int id) {
        helpFaqDao.updateCnt(id);
    }

    @Override
    public List<BoardDto> getBoardList(Map<String, String> searchMap, Criteria cri) {
        cri.setStartNum((cri.getPageNum() - 1) * cri.getAmount());

        // mybatis에서 parameter를 하나만 받을 수 있다.
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("search", searchMap);
        paramMap.put("cri", cri);

        return helpFaqDao.getFaQABoardList(paramMap);
    }

    @Override
    public BoardDto getBoard(int id) {
        return helpFaqDao.getBoard(id);
    }

    @Override
    public int getBoardTotalCnt(Map<String, String> searchMap) {
        return helpFaqDao.getBoardTotalCnt(searchMap);
    }

    @Override
    public List<BoardFileDto> getBoardFileList(int id) {
        return helpFaqDao.getFaQBoardFileList(id);
    }

    @Override
    public void addComment(CommentDto commentDto) {
        // Implement the addComment method for FAQ
    }

    @Override
    public List<CommentDto> getComments(int boardId) {
        // Implement the getComments method for FAQ
        return null;
    }

    @Override
    public List<BoardDto> getFaqListBySubject(String subject) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("subject", subject);
        paramMap.put("minCnt", 1); // 예시로 기본값 1을 설정
        System.out.println("서비스도 문제 없음");
        return helpFaqDao.getFaqListBySubject(paramMap);
    }


}
