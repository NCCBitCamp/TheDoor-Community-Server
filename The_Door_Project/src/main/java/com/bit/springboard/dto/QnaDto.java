package com.bit.springboard.dto;

import java.time.LocalDateTime;

public class QnaDto {
    private LocalDateTime fdate;
    private String subject;
    private boolean answer;
    
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
        return "QnaDto{" +
                "fdate=" + fdate +
                ", subject='" + subject + '\'' +
                ", answer=" + answer +
                '}';
    }
}
