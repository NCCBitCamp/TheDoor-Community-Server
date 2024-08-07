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

    public void post(BoardDto boardDto, List<BoardFileDto> boardFileDtoList) {

        mybatis.insert(/*쿼리문의 호출은 Mapper.xml 파일의 namespace값.쿼리문의 id*/"HelpQnaDao.post", boardDto);



        if(boardFileDtoList.size() > 0) {
            boardFileDtoList.forEach(boardFileDto -> boardFileDto.setBoard_id(boardDto.getId()));

            mybatis.insert("HelpQnaDao.uploadFiles", boardFileDtoList);
        }


    }

    public void modify(BoardDto boardDto, List<BoardFileDto> uFileList) {


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


    }

    public List<BoardDto> getBoardList(Map<String, Object> paramMap) {


        List<BoardDto> boardDtoList = new ArrayList<>();

        // SqlSessionTemplate의 selectList메소드 사용
        boardDtoList = mybatis.selectList("HelpQnaDao.getBoardList", paramMap);
        System.out.println(boardDtoList);

        return boardDtoList;
    }

    public void delete(int id) {


        mybatis.delete("HelpQnaDao.deleteFiles", id);

        mybatis.delete("HelpQnaDao.delete", id);


    }

    public BoardDto getBoard(int id) {


        BoardDto boardDto = new BoardDto();

        // SqlSessionTemplate의 selectOne메소드 사용
        boardDto = mybatis.selectOne("HelpQnaDao.getBoard", id);


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

    public List<BoardDto> getFaqListBySubject(Map<String, Object> paramMap) {
        return mybatis.selectList("HelpQnaDao.getFaqListBySubject", paramMap);
    }

}
