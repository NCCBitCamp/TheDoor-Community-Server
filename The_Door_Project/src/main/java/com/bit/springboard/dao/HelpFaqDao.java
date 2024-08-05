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
public class HelpFaqDao {
    private static SqlSessionTemplate mybatis;
    // 이거 static일까 final일까

    @Autowired
    public HelpFaqDao(SqlSessionTemplate sqlSessionTemplate) {
        this.mybatis = sqlSessionTemplate;
    }

    private final String GET_BOARD_LIST = "SELECT Q.ID" +
            "                                   , Q.TITLE" +
            "                                   , Q.CONTENT" +
            "                                   , Q.WRITER_ID" +
            "                                   , U.NICKNAME" +
            "                                   , Q.DATE" +
            "                                   , Q.FDATE" +
            "                                   , Q.SUBJECT" +
            "                                   , Q.CNT" +
            "                                  FROM QA Q" +
            "                                  JOIN USER U" +
            "                                    ON Q.WRITER_ID = U.USER_ID";


    // 특정 id의 게시글 하나만 조회
    private final String GET_BOARD = "SELECT Q.ID" +
            "                                   , Q.TITLE" +
            "                                   , Q.CONTENT" +
            "                                   , Q.WRITER_ID" +
            "                                   , U.NICKNAME" +
            "                                   , Q.DATE" +
            "                                   , Q.FDATE" +
            "                                   , Q.SUBJECT" +
            "                                   , Q.CNT" +
            "                                  FROM QA Q" +
            "                                  JOIN USER U" +
            "                                    ON Q.WRITER_ID = U.USER_ID" +
            "                                  WHERE Q.ID = ?";


    // FAQ 전용
    public List<BoardDto> getFaQABoardList(Map<String, Object> paramMap) {
        return mybatis.selectList("HelpFaQDao.getFaQABoardList", paramMap);
    }
    public BoardDto getBoard(int id) {
        return mybatis.selectOne("HelpFaQDao.getBoard", id);
    }
    public void updateCnt(int id) {
        mybatis.update("HelpFaQDao.updateCnt", id);
    }
    public int getBoardTotalCnt(Map<String, String> searchMap) {
        return mybatis.selectOne("HelpFaQDao.getBoardTotalCnt", searchMap);
    }
    public List<BoardFileDto> getFaQBoardFileList(int id) {
        return mybatis.selectList("HelpFaQDao.getBoardFileList", id);
    }
    public List<BoardDto> getFaqListBySubject(Map<String, Object> paramMap) {
        System.out.println("dao도 작동함");
        return mybatis.selectList("HelpFaQDao.getFaqListBySubject", paramMap);
    }
}
