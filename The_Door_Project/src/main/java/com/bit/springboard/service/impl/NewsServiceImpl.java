package com.bit.springboard.service.impl;

import com.bit.springboard.common.FileUtils;
import com.bit.springboard.dao.NewsDao;
import com.bit.springboard.dto.BoardDto;
import com.bit.springboard.dto.BoardFileDto;
import com.bit.springboard.dto.Criteria;
import com.bit.springboard.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

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

    @Override
    public void updateCnt(int id) {

    }
}
