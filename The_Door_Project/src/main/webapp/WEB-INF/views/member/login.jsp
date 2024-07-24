<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/member/login.css">
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
    <div class="content">
        <h1>LOGIN</h1>
        <div id="loginBox">
            <div class="inputBox">
                <label id="idLabel" for="username" style="color:#FFF;">아이디</label>
                <input type="text" class="id" id="username" name="username" required maxlength="30">
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
            <button type="submit" class="createBtn" style="color: white;">회원가입</button>
        </div>
    </div>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
</body>
</html>