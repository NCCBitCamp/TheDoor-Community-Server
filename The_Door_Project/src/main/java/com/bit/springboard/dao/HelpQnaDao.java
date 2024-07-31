package com.bit.springboard.dao;

import com.bit.springboard.dto.BoardDto;
import com.bit.springboard.dto.BoardFileDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

// JDBC Template 사용방식 2
// JdbcTemplate을 필드로 선언하고 의존성을 주입받아서 사용하는 방식
@Repository
public class HelpQnaDao {
    private static SqlSessionTemplate mybatis;

    @Autowired
    public HelpQnaDao(SqlSessionTemplate sqlSessionTemplate) {
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
            "                                    ON Q.WRITER_ID = U.ID";

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
            "                                    ON Q.WRITER_ID = U.ID" +
            "                                  WHERE Q.ID = ?";

    public void post(BoardDto boardDto, List<BoardFileDto> boardFileDtoList) {
        System.out.println("QA의 post 메소드 실행");

        mybatis.insert(/*쿼리문의 호출은 Mapper.xml 파일의 namespace값.쿼리문의 id*/"HelpQnaDao.post", boardDto);

        System.out.println("insert 실행 후 id값: " + boardDto.getId());

        if(boardFileDtoList.size() > 0) {
            boardFileDtoList.forEach(boardFileDto -> boardFileDto.setBoard_id(boardDto.getId()));

            mybatis.insert("HelpQnaDao.uploadFiles", boardFileDtoList);
        }

        System.out.println("HelpQnaDao post 메소드 실행 종료");
    }

    public void modify(BoardDto boardDto, List<BoardFileDto> uFileList) {
        System.out.println("HelpQnaDao의 modify 메소드 실행");

        mybatis.update("HelpQnaDao.modify", boardDto);

        if(uFileList.size() > 0) {
            uFileList.forEach(boardFileDto -> {
                if(boardFileDto.getFilestatus().equals("I")) {
                    mybatis.insert("HelpQnaDao.postBoardFileOne", boardFileDto);
                } else if(boardFileDto.getFilestatus().equals("U")) {
                    mybatis.update("HelpQnaDao.modifyBoardFileOne", boardFileDto);
                } else if(boardFileDto.getFilestatus().equals("D")) {
                    mybatis.delete("HelpQnaDao.deleteBoardFileOne", boardFileDto);
                }
            });
        }

        System.out.println("HelpQnaDao의 modify 메소드 실행 종료");
    }

    public List<BoardDto> getBoardList(Map<String, Object> paramMap) {
        System.out.println("HelpQnaDao의 getBoardList 메소드 실행");

        List<BoardDto> boardDtoList = new ArrayList<>();

        // SqlSessionTemplate의 selectList메소드 사용
        boardDtoList = mybatis.selectList("HelpQnaDao.getBoardList", paramMap);

        System.out.println("HelpQnaDao의 getBoardList 메소드 실행 종료");
        return boardDtoList;
    }

    public static void delete(int id) {
        System.out.println("HelpQnaDao의 delete 메소드 실행");

        mybatis.delete("HelpQnaDao.deleteFiles", id);

        mybatis.delete("HelpQnaDao.delete", id);

        System.out.println("HelpQnaDao의 delete 메소드 실행 종료");
    }

    public BoardDto getBoard(int id) {
        System.out.println("HelpQnaDao의 getBoard 메소드 실행");

        BoardDto boardDto = new BoardDto();

        // SqlSessionTemplate의 selectOne메소드 사용
        boardDto = mybatis.selectOne("HelpQnaDao.getBoard", id);

        System.out.println("HelpQnaDao의 getBoard 메소드 실행 종료");
        return boardDto;
    }

    public static void updateCnt(int id) {
        mybatis.update("HelpQnaDao.updateCnt", id);
    }

    public int getBoardTotalCnt(Map<String, String> searchMap) {
        return mybatis.selectOne("HelpQnaDao.getBoardTotalCnt", searchMap);
    }


    public List<BoardFileDto> getBoardFileList(int id) {
        return mybatis.selectList("HelpQnaDao.getBoardFileList", id);
    }
}
