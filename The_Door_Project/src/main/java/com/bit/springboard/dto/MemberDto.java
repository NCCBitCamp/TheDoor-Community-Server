package com.bit.springboard.dto;

import java.time.LocalDateTime;

// DTO(Data Transfer Object): 데이터를 전송하는 객체
//                            화면에서 넘어오는 데이터를 받아서 DB 까지 전달하거나
//                            컨트롤러에서 화면으로 데이터를 전송할 때 사용하는 객체
//                            VO(Value Object)랑 쓰임새가 비슷하다.
public class MemberDto {
    private int id; // 회원아이디
    private String username; // 아이디
    private String password; // 회원 비밀번호
    private String nickname; // 닉네임
    private String email; // 이메일
    private LocalDateTime birth; // 생년월일
    private String role; // 어드민 인지아닌지

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public LocalDateTime getBirth() {
        return birth;
    }

    public void setBirth(LocalDateTime birth) {
        this.birth = birth;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "MemberDto{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", nickname='" + nickname + '\'' +
                ", email='" + email + '\'' +
                ", birth=" + birth +
                ", role='" + role + '\'' +
                '}';
    }
}
