<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/member/emailChange.css">
    <link rel="icon" href="${pageContext.request.contextPath}/static/images/favicon.ico" type="image/x-icon">
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
<form id="emailChange-form" action="/member/emailChange.do" method="post">
    <div class="content">
        <div class="login-container">
            <h2>이메일 변경하기</h2>
            <div class="inputBox">
                <label id="userLabel" for="username">이름</label>
                <input type="text" class="username" id="username" required maxlength="30" name="username" autocomplete="off">
            </div>
            <div class="inputBox">
                <label id="birthLabel" for="birth">생년월일</label>
                <input type="text" class="birth" id="birth" required maxlength="10" name="birth" autocomplete="off">
            </div>
            <div class="inputBox">
                <label id="emailLabel" for="email">변경할 이메일</label>
                <input type="email" class="email" id="email" name="email" required maxlength="30" autocomplete="off">
            </div>
            <div class="search">
                <input type="submit" class="searchbtn" value="확인">
            </div>
            <c:if test="${not empty errorMessage}">
                <div class="error-message">${errorMessage}</div>
            </c:if>
            <c:if test="${not empty successMessage}">
                <div class="success-message">${successMessage}</div>
            </c:if>
        </div>
    </div>
</form>
<jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
</body>
</html>