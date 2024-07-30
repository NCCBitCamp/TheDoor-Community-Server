package com.bit.springboard.service.impl;


import com.bit.springboard.dao.HelpFaqDao;
import com.bit.springboard.dto.BoardDto;
import com.bit.springboard.dto.BoardFileDto;
import com.bit.springboard.dto.Criteria;
import com.bit.springboard.service.BoardService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class helpFaqServiceImpl implements BoardService{
    private HelpFaqDao helpFaqDao;

    @Override
    public void post(BoardDto boardDto, MultipartFile[] uploadFiles) {

    }

    @Override
    public void modify(BoardDto boardDto, MultipartFile[] uploadFiles, MultipartFile[] changeFiles, String originFiles) {

    }

    @Override
    public void plusCnt(int id) {

    }

    @Override
    public void delete(int id) {

    }

    @Override
    public List<BoardDto> getBoardList(Map<String, String> searchMap, Criteria cri) {
        cri.setStartNum((cri.getPageNum() - 1) * cri.getAmount());

        // mybatis에서 parameter를 하나만 받을 수 있다.
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("search", searchMap);
        paramMap.put("cri", cri);

        return HelpFaqDao.getBoardList(paramMap);
    }

    @Override
    public BoardDto getBoard(int id) {
        return HelpFaqDao.getBoard(id);
    }

    @Override
    public int getBoardTotalCnt(Map<String, String> searchMap) {
        return HelpFaqDao.getFaqBoardTotalCnt(searchMap);
    }

    @Override
    public List<BoardFileDto> getBoardFileList(int id) {
        return HelpFaqDao.getFaqBoardFileList(id);
    }


}
