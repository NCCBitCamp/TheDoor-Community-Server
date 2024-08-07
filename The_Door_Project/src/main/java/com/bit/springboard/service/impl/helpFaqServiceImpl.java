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

@Service("helpFaqServiceImpl")
public class helpFaqServiceImpl implements BoardService {
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

    @Override // 컨트롤러, 매퍼에 이 이름 쓰임
    public List<BoardDto> getBoardList(Map<String, String> searchMap, Criteria cri) {
        cri.setStartNum((cri.getPageNum() - 1) * cri.getAmount());

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("search", searchMap);
        paramMap.put("cri", cri);

        return helpFaqDao.getFaqBoardList(paramMap);
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
        return helpFaqDao.getBoardFileList(id);
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
    public List<BoardDto> getFaqListBySubject(String subject, int minCnt) {
        minCnt = 0; // 지금은 실험이니까 0으로 해놓음
        Map<String, Object> params = new HashMap<>();
        params.put("subject", subject);
        params.put("minCnt", minCnt);
        return helpFaqDao.getFaqListBySubject(params);
    }


}