package com.bit.springboard.service.impl;

import com.bit.springboard.dao.FreeBoardDao;
import com.bit.springboard.dto.BoardDto;
import com.bit.springboard.dto.BoardFileDto;
import com.bit.springboard.dto.Criteria;
import com.bit.springboard.service.BoardService;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

public class FreeBoardServiceImpl implements BoardService {
    private FreeBoardDao freeBoardDao;

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
        return List.of();
    }

    @Override
    public BoardDto getBoard(int id) {
        return null;
    }

    @Override
    public int getBoardTotalCnt(Map<String, String> searchMap) {
        return 0;
    }

    @Override
    public List<BoardFileDto> getBoardFileList(int id) {
        return List.of();
    }
}
