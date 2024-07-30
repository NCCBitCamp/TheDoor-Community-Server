package com.bit.springboard.dto;

import java.time.LocalDateTime;

public class CommentDto {
    private int id; // 댓글 아이디
    private int board_id; // 게시판 아이디
    private String WRITER_ID; // 회원 아이디
    private LocalDateTime date; // 작성 시간
    private String content; // 댓글 내용

    private String title; // 마이페이지 알람으로 가져갈 변수

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBoard_id() {
        return board_id;
    }

    public void setBoard_id(int board_id) {
        this.board_id = board_id;
    }

    public String getWRITER_ID() {
        return WRITER_ID;
    }

    public void setWRITER_ID(String WRITER_ID) {
        this.WRITER_ID = WRITER_ID;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTitle() { return title; }

    public void setTitle(String title) { this.title = title; }

    @Override
    public String toString() {
        return "CommentDto{" +
                "id=" + id +
                ", board_id=" + board_id +
                ", WRITER_ID='" + WRITER_ID + '\'' +
                ", date=" + date +
                ", content='" + content + '\'' +
                ", title='" + title + '\'' +
                '}';
    }
}
