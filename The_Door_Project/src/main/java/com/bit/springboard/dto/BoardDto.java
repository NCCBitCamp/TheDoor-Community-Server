package com.bit.springboard.dto;

import java.time.LocalDateTime;

public class BoardDto {
    private int id;
    private String title;
    private String content;
    private String writer_id;
    private String nickname;
    private LocalDateTime date;
    private int cnt;
    private LocalDateTime fdate;
    private String subject;
    private boolean answer;

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

    public LocalDateTime getFdate() {
        return fdate;
    }

    public void setFdate(LocalDateTime fdate) {
        this.fdate = fdate;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public boolean isAnswer() {
        return answer;
    }

    public void setAnswer(boolean answer) {
        this.answer = answer;
    }

    @Override
    public String toString() {
        return "BoardDto{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", writer_id='" + writer_id + '\'' +
                ", nickname='" + nickname + '\'' +
                ", date=" + date +
                ", cnt=" + cnt +
                ", fdate=" + fdate +
                ", subject='" + subject + '\'' +
                ", answer=" + answer +
                '}';
    }
}
