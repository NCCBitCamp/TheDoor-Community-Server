package com.bit.springboard.dto;

import java.time.LocalDateTime;
import java.util.Date;

public class Criteria {
    // 현재 페이지 번호
    private int pageNum;
    // 한 페이지에 표시할 게시물의 개수
    private int amount;
    // 시작 게시글 번호
    private int startNum;
    private String gametype;
    private String userId;
    private LocalDateTime lastDate;
    private Integer lastId;

    public LocalDateTime getLastDate() {
        return lastDate;
    }
    public void setLastDate(LocalDateTime lastDate) {
        this.lastDate = lastDate;
    }

    public Integer getLastId() {
        return lastId;
    }
    public void setLastId(Integer lastId) {
        this.lastId = lastId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getGameType() {
        return gametype;
    }

    public void setGameType(String gametype) {
        this.gametype = gametype;
    }

    public Criteria() {
        this(1, 10);
    }

    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getStartNum() {
        return startNum;
    }

    public void setStartNum(int startNum) {
        this.startNum = startNum;
    }

    @Override
    public String toString() {
        return "Creteria{" +
                "pageNum=" + pageNum +
                ", amount=" + amount +
                ", startNum=" + startNum +
                '}';
    }
}
