<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/member/idSearched.css">
    <link rel="icon" href="${pageContext.request.contextPath}/static/images/favicon.ico" type="image/x-icon">
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
<form id="idSearched-form" action="/member/idSearched.do" method="post">
    <div class="content">


        <div id="searchBox">
            <h2>아이디 찾기</h2>
            <div class="showBox">
                <h5>${user_id}</h5>
            </div>

            <div class="loginBox">
                <button type="button" class=loginBtn onclick="location.href='/member/login.do'">로그인</button>
            </div>

            <div class="pwSearchBox">
                <button type="button" class="pwSearchBtn" onclick="location.href='/member/passwordSearch.do'">비밀번호 찾기</button>
            </div>
        </div>

    </div>
</form>
<jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
</body>
</html>
