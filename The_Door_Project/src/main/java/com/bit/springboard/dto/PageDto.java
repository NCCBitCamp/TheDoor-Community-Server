package com.bit.springboard.dto;

public class PageDto {
    // 표출되는 첫 페이지 번호
    private int startPage;
    // 표출되는 끝 페이지 번호
    private int endPage;
    // 총 게시글의 갯수
    private int total;
    // Creteria 객체
    private Criteria cri;

    public PageDto(Criteria cri, int total) {
        this.cri = cri;
        this.total = total;
        
        // 끝 페이지 계산
        this.endPage = (int)(Math.ceil(cri.getPageNum() / 10.0)) * 10;

        // 시작 페이지 계산
        this.startPage = this.endPage - 9;
        
        // 실제 마지막 게시글이 있는 페이지 계산
        int realEndPage = (int)(Math.ceil((total * 1.0) / cri.getAmount()));
        
        // endPage가 realEndPage보다 커지면
        // endPage에 realEndPage를 주입
        if(endPage > realEndPage) {
            this.endPage = realEndPage;
        }
        
    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public Criteria getCri() {
        return cri;
    }

    public void setCri(Criteria cri) {
        this.cri = cri;
    }

    @Override
    public String toString() {
        return "PageDto{" +
                "startPage=" + startPage +
                ", endPage=" + endPage +
                ", total=" + total +
                ", cri=" + cri +
                '}';
    }
}
