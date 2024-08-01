package com.bit.springboard.dao;

import com.bit.springboard.dto.BoardDto;
import com.bit.springboard.dto.BoardFileDto;
import com.bit.springboard.dto.CommentDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Repository
public class CommunityDao {
    private SqlSessionTemplate mybatis;

    @Autowired
    public CommunityDao(SqlSessionTemplate sqlSessionTemplate) {
        this.mybatis = sqlSessionTemplate;
    }

    // 자유게시글 등록
    public void write(BoardDto boardDto, List<BoardFileDto> boardFileDtoList) {
        /*쿼리문의 호출은 Mapper.xml 파일의 namespace값.쿼리문의 id*/
        mybatis.insert("CommunityDao.write", boardDto);
        if(boardFileDtoList.size() > 0) {
            boardFileDtoList.forEach(boardFileDto -> boardFileDto.setBoard_id(boardDto.getId()));

            mybatis.insert("CommunityDao.uploadFiles", boardFileDtoList);
        }
    }

    // 게시글 수정하기
    public void modify(BoardDto boardDto, List<BoardFileDto> uFileList) {
        mybatis.update("CommunityDao.modify", boardDto);
        if(uFileList.size() > 0) {
            uFileList.forEach(boardFileDto -> {
                if(boardFileDto.getFilestatus().equals("I")) {
                    mybatis.insert("CommunityDao.postBoardFileOne", boardFileDto);
                } else if(boardFileDto.getFilestatus().equals("U")) {
                    mybatis.update("CommunityDao.modifyBoardFileOne", boardFileDto);
                } else if(boardFileDto.getFilestatus().equals("D")) {
                    mybatis.delete("CommunityDao.deleteBoardFileOne", boardFileDto);
                }
            });
        }
    }

    public List<BoardDto> getBoardList(Map<String, Object> paramMap) {
        List<BoardDto> boardDtoList = new ArrayList<>();

        // SqlSessionTemplate의 selectList메소드 사용
        boardDtoList = mybatis.selectList("CommunityDao.getBoardList", paramMap);

        return boardDtoList;
    }

    public void delete(int id) {
        mybatis.delete("CommunityDao.deleteFiles", id);
        mybatis.delete("CommunityDao.delete", id);
    }

    public BoardDto getBoard(int id) {
        BoardDto boardDto = new BoardDto();

        // SqlSessionTemplate의 selectOne메소드 사용
        boardDto = mybatis.selectOne("CommunityDao.getBoard", id);

        return boardDto;
    }

    public void updateCnt(int id) {
        mybatis.update("CommunityDao.updateCnt", id);
    }

    public int getBoardTotalCnt(Map<String, String> searchMap) {
        return mybatis.selectOne("CommunityDao.getBoardTotalCnt", searchMap);
    }

    public List<BoardFileDto> getFreeBoardFileList(int id) {
        return mybatis.selectList("CommunityDao.getFreeBoardFileList", id);
    }


    public void addComment(CommentDto commentDto) {
        mybatis.insert("CommunityDao.addComment", commentDto);
    }

    public List<CommentDto> getComments(int boardId) {
        return mybatis.selectList("CommunityDao.getComments", boardId);
    }
}

