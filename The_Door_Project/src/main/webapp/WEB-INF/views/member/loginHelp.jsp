<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 24. 7. 30.
  Time: 오후 2:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/member/loginHelp.css">
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
    <div class="content">

        <h1>무엇을 도와드릴까요?</h1>
        <div class="helpBox" onclick="location.href='/member/idSearch.do'">
            <div class="box-content d-flex align-items-center">
                    <span>
                        <img src="${pageContext.request.contextPath}/static/images/member/account.svg" alt="accountLogo" class="help-logo1">
                        아이디를 잊어버렸어요.
                    </span>
            </div>
        </div>
        <div class="helpBox" onclick="location.href='/member/passwordSearch.do'">
            <div class="box-content d-flex align-items-center">
                    <span>
                        <img src="${pageContext.request.contextPath}/static/images/member/password.svg" alt="passwordLogo" class="help-logo2">
                        비밀번호가 기억나지 않아요.
                    </span>
            </div>
        </div>
        <div class="helpBox" onclick="location.href='#'">
            <div class="box-content d-flex align-items-center">
                    <span>
                        <img src="${pageContext.request.contextPath}/static/images/member/email.svg" alt="emailLogo" class="help-logo3">
                        등록된 이메일을 바꾸고 싶어요.
                    </span>
            </div>
        </div>



    </div>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>