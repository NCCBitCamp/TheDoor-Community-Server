package com.bit.springboard.dto;

import java.time.LocalDateTime;

public class NewsDto {
    private int id;
    private String title;
    private String content;
    private String writer_id;
    private String nickname;
    private LocalDateTime date;
    private int cnt;
    private BoardFileDto file; // 파일 정보를 추가

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getWriter_id() {
        return writer_id;
    }

    public void setWriter_id(String writer_id) {
        this.writer_id = writer_id;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public int getCnt() {
        return cnt;
    }

    public void setCnt(int cnt) {
        this.cnt = cnt;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public BoardFileDto getFile() {
        return file;
    }

    public void setFile(BoardFileDto file) {
        this.file = file;
    }

    @Override
    public String toString() {
        return "NewsDto{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", writer_id='" + writer_id + '\'' +
                ", nickname='" + nickname + '\'' +
                ", date=" + date +
                ", cnt=" + cnt +
                ", file=" + file +
                '}';
    }
}
