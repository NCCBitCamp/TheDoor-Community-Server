package com.bit.springboard.dao;

import com.bit.springboard.dto.BoardDto;
import com.bit.springboard.dto.BoardFileDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
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

    // 게시글 삭제
    private final String DELETE = "DELETE FROM QA" +
            "                           WHERE ID = ?";

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





    public List<BoardDto> getFaqBoardList(Map<String, Object> paramMap) {

        List<BoardDto> boardDtoList = new ArrayList<>();

        boardDtoList = mybatis.selectList("HelpQnaDao.getBoardList", paramMap);

        return boardDtoList;
    }


    public void delete(int id) {


        mybatis.delete("HelpQnaDao.deleteFiles", id);

        mybatis.delete("HelpQnaDao.delete", id);


    }

    public BoardDto getBoard(int id) {

        BoardDto boardDto = new BoardDto();

        boardDto = mybatis.selectOne("HelpFaqDao.getBoard", id);

        return boardDto;
    }


    public void updateCnt(int id) {
        mybatis.update("HelpQnaDao.updateCnt", id);
    }

    public int getBoardTotalCnt(Map<String, String> searchMap) {

        return mybatis.selectOne("HelpQnaDao.getBoardTotalCnt", searchMap);
    }


    public List<BoardFileDto> getBoardFileList(int id) {

        return mybatis.selectList("HelpQnaDao.getBoardFileList", id);
    }

    // 조회수(cnt)가 10 이상이고 주제(subject)별로 필터링하는 메소드
    public List<BoardDto> getFaqListBySubject(Map<String, Object> subject, int minCnt) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("subject", subject);
        paramMap.put("minCnt", 10);
        return mybatis.selectList("HelpQnaDao.getFaqListBySubject", paramMap);
    }
}