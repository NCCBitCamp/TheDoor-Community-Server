package com.bit.springboard.dto;

public class FaqDto {
    private String subject;

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    @Override
    public String toString() {
        return "FaqDto{" +
                "subject='" + subject + '\'' +
                '}';
    }
}
