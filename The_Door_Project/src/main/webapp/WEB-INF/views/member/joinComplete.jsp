<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/member/joinComplete.css">
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
    <div class="content">
        <div class="welcome">
            <img src="${pageContext.request.contextPath}/static/images/logo.png" alt="img">
            <p>회원이 되신 것을 축하드립니다.<br>
            앞으로 더도어 게임즈의 각종 소식들을 받아보실 수 있습니다.</p>
        </div>
    </div>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
</body>
</html>
