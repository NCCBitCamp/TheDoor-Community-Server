<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 24. 7. 24.
  Time: 오전 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The Door Games</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/index.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.7.1.min.js"></script>
</head>
<body>
    <div class="navbar">
        <div class="logo">
            <a href="/">
                <img src="${pageContext.request.contextPath}/static/images/logo.png" alt="Logo">
            </a>
        </div>
        <div class="nav-container">
            <div class="nav-links">
                <a href="/main/guide.do">Guide</a>
                <a href="/news/news.do">News</a>
                <a href="/community/community.do">Community</a>
                <a href="/main/ranking.do">Ranking</a>
                <a href="/helpboard/help-main.do">Help</a>
            </div>
            <div class="auth-links">

                <c:choose>
                    <c:when test="${loginMember eq null}">
                        <a href="/member/login.do">로그인</a> / <a href="/member/join.do">회원가입</a>
                    </c:when>
                    <c:otherwise>
                        <div class="profile-container">
                            <c:choose>
                                <c:when test="${not empty profileImg.id}">
                                    <img id="user_profile_imageHeader" src="/upload/${profileImg.filename}" alt="${profileImg.filename}" class="profileImgHeader">
                                </c:when>
                                <c:otherwise>
                                    <img id="user_profile_imageHeader" src="${pageContext.request.contextPath}/static/images/myPage/profileImg.png" alt="defaultImg" class="profileImgHeader">
                                </c:otherwise>
                            </c:choose>
                            <div class="auth-text">
                                <a href="/myPage/info.do">${loginMember.nickname}</a> / <a href="/member/logout.do">로그아웃</a>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</body>
</html>
