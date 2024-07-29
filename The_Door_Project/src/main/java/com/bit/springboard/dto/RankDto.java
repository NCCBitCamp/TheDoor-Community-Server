package com.bit.springboard.dto;

import java.time.LocalDateTime;

public class RankDto {
    private int id; // 기록 아이디
    private String RANK_ID; // 회원 아이디
    private LocalDateTime date; // 기록 날짜
    private int time; // 기록 시간
    private String gametype; // 기록 게임
    private String comment; // 한마디
    private String nickname;
    private int rank;

//****************************************************** + 인게임 랭크
    private String username; // 닉네임

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRANK_ID() {
        return RANK_ID;
    }

    public void setRANK_ID(String RANK_ID) {
        this.RANK_ID = RANK_ID;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setdate(LocalDateTime date) {
        this.date = date;
    }

    public int gettime() {
        return time;
    }

    public void settime(int time) {
        this.time = time;
    }

    public String getGametype() {
        return gametype;
    }

    public void setGametype(String gametype) {
        this.gametype = gametype;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getRank() {
        return rank;
    }

    public void setRank(int rank) {
        this.rank = rank;
    }

    @Override
    public String toString() {
        return "RankDto{" +
                "id=" + id +
                ", RANK_ID=" + RANK_ID +
                ", date=" + date +
                ", time=" + time +
                ", gametype='" + gametype + '\'' +
                ", comment='" + comment + '\'' +
                ", nickname='" + nickname + '\'' +
                ", username='" + username + '\'' +
                '}';
    }
}
