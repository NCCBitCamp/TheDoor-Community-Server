package com.bit.springboard.service;

import com.bit.springboard.dto.BoardDto;
import com.bit.springboard.dto.BoardFileDto;
import com.bit.springboard.dto.CommentDto;
import com.bit.springboard.dto.Criteria;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

public interface BoardService {
    void post(BoardDto boardDto, MultipartFile[] uploadFiles);

    void modify(BoardDto boardDto, MultipartFile[] uploadFiles, MultipartFile[] changeFiles, String originFiles);

    void plusCnt(int id);

    void delete(int id);

    void updateCnt(int id);

    List<BoardDto> getBoardList(Map<String, String> searchMap, Criteria cri);

    BoardDto getBoard(int id);

    int getBoardTotalCnt(Map<String, String> searchMap);

    List<BoardFileDto> getBoardFileList(int id);

    void addComment(CommentDto commentDto);

    List<Map<String, Object>> getComments(int boardId);

    List<BoardDto> getFaqListBySubject(String subject, int minCnt);

//    List<BoardFileDto> getCommenterImages(int boardId);

}
