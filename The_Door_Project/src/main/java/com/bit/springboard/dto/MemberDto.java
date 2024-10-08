package com.bit.springboard.dto;

// DTO(Data Transfer Object): 데이터를 전송하는 객체
//                            화면에서 넘어오는 데이터를 받아서 DB 까지 전달하거나
//                            컨트롤러에서 화면으로 데이터를 전송할 때 사용하는 객체
//                            VO(Value Object)랑 쓰임새가 비슷하다.
public class MemberDto {
    private int id;
    private String user_id; //
    private String password;
    private String nickname;
    private String email;
    private String username;
    private String birth;
    private String role;
    private String code;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Override
    public String toString() {
        return "MemberDto{" +
                "id=" + id +
                ", user_id='" + user_id + '\'' +
                ", password='" + password + '\'' +
                ", nickname='" + nickname + '\'' +
                ", email='" + email + '\'' +
                ", username='" + username + '\'' +
                ", birth='" + birth + '\'' +
                ", role='" + role + '\'' +
                ", code='" + code + '\'' +
                '}';
    }
}
