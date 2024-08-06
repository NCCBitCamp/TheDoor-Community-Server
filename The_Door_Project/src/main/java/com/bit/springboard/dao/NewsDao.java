package com.bit.springboard.dao;

import com.bit.springboard.dto.BoardDto;
import com.bit.springboard.dto.BoardFileDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Repository
public class NewsDao {
    private SqlSessionTemplate mybatis;

    @Autowired
    public NewsDao(SqlSessionTemplate sqlSessionTemplate) {
        this.mybatis = sqlSessionTemplate;
    }

    // 자유게시글 등록
    public void write(BoardDto boardDto, List<BoardFileDto> boardFileDtoList) {
        /*쿼리문의 호출은 Mapper.xml 파일의 namespace값.쿼리문의 id*/
        mybatis.insert("NewsDao.write", boardDto);
        if(boardFileDtoList.size() > 0) {
            boardFileDtoList.forEach(boardFileDto -> boardFileDto.setBoard_id(boardDto.getId()));

            mybatis.insert("NewsDao.uploadFiles", boardFileDtoList);
        }
    }

    // 게시글 수정하기
    public void modify(BoardDto boardDto, List<BoardFileDto> uFileList) {
        mybatis.update("NewsDao.modify", boardDto);

        if(uFileList.size() > 0) {
            uFileList.forEach(boardFileDto -> {
                if(boardFileDto.getFilestatus().equals("I")) {
                    mybatis.insert("NewsDao.postBoardFileOne", boardFileDto);
                } else if(boardFileDto.getFilestatus().equals("U")) {
                    mybatis.update("NewsDao.modifyBoardFileOne", boardFileDto);
                } else if(boardFileDto.getFilestatus().equals("D")) {
                    mybatis.delete("NewsDao.deleteBoardFileOne", boardFileDto);
                }
            });
        }
    }

    public List<BoardDto> getBoardList(Map<String, Object> paramMap) {
        List<BoardDto> boardDtoList = new ArrayList<>();
        return mybatis.selectList("NewsDao.getBoardList", paramMap);
    }

    public void delete(int id) {
        mybatis.delete("NewsDao.deleteFiles", id);
        mybatis.delete("NewsDao.delete", id);
    }

    public BoardDto getBoard(int id) {
        BoardDto boardDto = new BoardDto();
        return mybatis.selectOne("NewsDao.getBoard", id);
    }

    public void updateCnt(int id) {
        mybatis.update("NewsDao.updateCnt", id);
    }

    public int getBoardTotalCnt(Map<String, String> searchMap) {
        return mybatis.selectOne("NewsDao.getBoardTotalCnt", searchMap);
    }

    public List<BoardFileDto> getBoardFileList(int id) {
        return mybatis.selectList("NewsDao.getBoardFileList", id);
    }

}
