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
                <a href="/board/news-list.do">News</a>
                <a href="/board/free-list.do">Community</a>
                <a href="/main/ranking.do">Ranking</a>
                <a href="/board/help-main.do">Help</a>
            </div>
            <div class="auth-links">
                <a href="">로그인</a> / <a href="">회원가입</a>
            </div>
        </div>
    </div>
</body>
</html>
