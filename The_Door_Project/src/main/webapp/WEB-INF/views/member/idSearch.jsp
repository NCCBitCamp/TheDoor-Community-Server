<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/member/idSearch.css">
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
<form id="idSearch-form" action="/member/idSearched.do" method="post">
    <div class="content">
        <div class="login-container">
            <h2>아이디 찾기</h2>
            <div class="inputBox">
                <label id="nameLabel" for="username">Username</label>
                <input type="text" class="username" id="username" name="username" required maxlength="30" autocomplete="off">
            </div>
            <div class="inputBox">
                <label id="emailLabel" for="email">Email</label>
                <input type="email" class="email" id="email" name="email" required maxlength="30" autocomplete="off">
            </div>
            <div class="search">
                <input type="submit" class="searchbtn" value="확인">
            </div>
            <c:if test="${not empty errorMessage}">
                <div class="error-message">${errorMessage}</div>
            </c:if>
        </div>
    </div>
</form>
<jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
</body>
</html>