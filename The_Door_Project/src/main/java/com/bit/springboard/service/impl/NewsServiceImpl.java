package com.bit.springboard.service.impl;

import com.bit.springboard.common.FileUtils;
import com.bit.springboard.dao.NewsDao;
import com.bit.springboard.dto.*;
import com.bit.springboard.service.BoardService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.*;

@Service
public class NewsServiceImpl implements BoardService {
    private NewsDao newsDao;

    @Autowired
    public NewsServiceImpl(NewsDao newsDao) {
        this.newsDao = newsDao;
    }

    @Override
    public void post(BoardDto boardDto, MultipartFile[] uploadFiles) {
        List<BoardFileDto> boardFileDtoList = new ArrayList<>();

        if(uploadFiles != null && uploadFiles.length > 0) {
            String attachPath = "C:/tmp/upload/";

            File directory = new File(attachPath);

            if (!directory.exists()) {
                directory.mkdirs();
            }

            Arrays.stream(uploadFiles).forEach(file -> {
                if(file.getOriginalFilename() != null && !file.getOriginalFilename().equals("")) {
                    BoardFileDto boardFileDto = FileUtils.parserFileInfo(file, attachPath);
                    boardFileDtoList.add(boardFileDto);
                }
            });
        }

        newsDao.write(boardDto, boardFileDtoList);
    }

    @Override
    public void modify(BoardDto boardDto, MultipartFile[] uploadFiles, MultipartFile[] changeFiles, String originFiles) {
        List<BoardFileDto> originFileList = new ArrayList<>();

        try {
            originFileList = new ObjectMapper().readValue(originFiles, new TypeReference<List<BoardFileDto>>() {
            });
        } catch (IOException ie) {
            System.out.println(ie.getMessage());
        }

        String attachPath = "C:/tmp/upload/";

        File directory = new File(attachPath);

        if(!directory.exists()) {
            directory.mkdirs();
        }

        // 추가, 수정, 삭제 되는 파일들의 목록을 담아줄 리스트
        List<BoardFileDto> uFileList = new ArrayList<>();

        // 수정, 삭제되는 파일들을 uFileList에 담기
        if(originFileList.size() > 0) {
            originFileList.forEach(boardFileDto -> {
                if (boardFileDto.getFilestatus().equals("U") && changeFiles != null) {
                    Arrays.stream(changeFiles).forEach(file -> {
                        if (boardFileDto.getNewfilename().equals(file.getOriginalFilename())) {
                            BoardFileDto updateBoardFileDto = FileUtils.parserFileInfo(file, attachPath);

                            updateBoardFileDto.setBoard_id(boardFileDto.getBoard_id());
                            updateBoardFileDto.setId(boardFileDto.getId());
                            updateBoardFileDto.setFilestatus("U");

                            uFileList.add(updateBoardFileDto);
                        }
                    });
                } else if (boardFileDto.getFilestatus().equals("D")) {
                    BoardFileDto deletBoardFileDto = new BoardFileDto();

                    deletBoardFileDto.setBoard_id(boardFileDto.getBoard_id());
                    deletBoardFileDto.setId(boardFileDto.getId());
                    deletBoardFileDto.setFilestatus("D");

                    uFileList.add(deletBoardFileDto);

                    // 실제 서버에서 파일 삭제
                    File deleteFile = new File(attachPath + boardFileDto.getFilename());

                    deleteFile.delete();
                }
            });
        }

        // 추가된 파일들 uFileList에 담기
        if(uploadFiles != null && uploadFiles.length > 0) {
            Arrays.stream(uploadFiles).forEach(file -> {
                if(!file.getOriginalFilename().equals("") && file.getOriginalFilename() != null) {
                    BoardFileDto postBoardFileDto = FileUtils.parserFileInfo(file, attachPath);

                    postBoardFileDto.setBoard_id(boardDto.getId());
                    postBoardFileDto.setFilestatus("I");

                    uFileList.add(postBoardFileDto);
                }
            });
        }
        newsDao.modify(boardDto, uFileList);
    }

    @Override
    public void plusCnt(int id) {

    }

    @Override
    public void delete(int id) {
        newsDao.delete(id);
    }

    @Override
    public void updateCnt(int id) {
        newsDao.updateCnt(id);
    }

    @Override
    public List<BoardDto> getBoardList(Map<String, String> searchMap, Criteria cri) {
        cri.setStartNum((cri.getPageNum() - 1) * cri.getAmount());

        // mybatis에서 parameter를 하나만 받을 수 있다.
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("search", searchMap);
        paramMap.put("cri", cri);

        return newsDao.getBoardList(paramMap);
    }

    @Override
    public BoardDto getBoard(int id) {
        BoardDto boardDto = newsDao.getBoard(id);
        List<BoardFileDto> files = newsDao.getBoardFileList(id);
        return boardDto; // 파일 리스트는 따로 전달
    }

    @Override
    public int getBoardTotalCnt(Map<String, String> searchMap) {
        return newsDao.getBoardTotalCnt(searchMap);
    }

    @Override
    public List<BoardFileDto> getBoardFileList(int id) {
        return newsDao.getBoardFileList(id);
    }

    @Override
    public void addComment(CommentDto commentDto) {

    }

    @Override
    public List<CommentDto> getComments(int boardId) {
        return List.of();
    }

    @Override
    public List<BoardDto> getFaqListBySubject(String subject, int minCnt) {
        return List.of();
    }
}

