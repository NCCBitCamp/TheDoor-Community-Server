package com.bit.springboard.dto;

import java.time.LocalDateTime;

public class BoardDto {
    private int board_id; // 게시판 아이디
    private String title; // 게시글 제목
    private String content; // 게시글 내용
    private int WRITER_ID; // 회원 아이디
    private LocalDateTime date; // 게시글 작성일
    private int cnt; // 게시글 조회수

//****************************************************** + 파일 관련
    private int file_id; // 파일 아이디
    private String filename; // 파일 이름
    private String fileoriginname; // 파일 명
    private String filepath; // 파일 경로
    private String filetype; // 파일 타입



//****************************************************** + 질문 FaQ 게시판

}
