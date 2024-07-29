
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
<div class="content">
    <form id="login-form" action="/member/login.do" method="post">

        <h1>LOGIN</h1>
        <div id="loginBox">
            <div class="inputBox">
                <label id="idLabel" for="username">아이디</label>
                <input type="text" class="id" id="username" name="username" required maxlength="30" autocomplete="off">
            </div>

            <div class="inputBox">
                <label id="pwLabel" style="color:#FFF;">비밀번호</label>
                <input type="password" class="password" id="password" name="password" required maxlength="30">
                <div id="pwBtn">　</div>
                <label id=pwFind style="color: #898686;">로그인에 어려움이 있나요?</label>
            </div>

            <div class="login">
                <button type="submit" class="loginbtn">로그인</button>
            </div>
        </div>

        <div class="createAccBox">
            <button type="button" class="createBtn" onclick="location.href='/member/join.do'">회원가입</button>
        </div>
    </form>
</div>
<jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/static/js/login.js"></script>
</body>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/member/login.css">
</head>
</html>