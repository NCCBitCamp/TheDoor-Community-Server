<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/member/idSearched.css">
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
<form id="idSearched-form" action="/member/idSearched.do" method="post">
    <div class="content">

        <h1>아이디 찾기</h1>
        <div id="searchBox">
            <div id="guideBox">
                <li id="guide">회원님의 아이디를 확인해 주세요.</li>
                <h2 class="showId">${user_id}</h2>
            </div>

            <div class="loginBox">
                <button type="button" class=loginBtn onclick="location.href='/member/login.do'">로그인</button>
            </div>

            <div class="pwSearchBox">
                <button type="button" class="pwSearchBtn" onclick="location.href='#'">비밀번호 찾기</button>
            </div>
        </div>

    </div>
</form>
<jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
</body>
</html>
