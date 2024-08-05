<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/member/passwordChange.css">
    <link rel="icon" href="${pageContext.request.contextPath}/static/images/favicon.ico" type="image/x-icon">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/header.jsp" />
<form id="passwordChange-form" action="${pageContext.request.contextPath}member/passwordChange.do" method="post">
    <input type="hidden" id="user_id" name="user_id">
    <div class="content">
        <div class="login-container">
            <h2>비밀번호 변경</h2>
            <div class="inputBox">
                <label id="passwordLabel" for="password">비밀번호</label>
                <input type="password" class="password" id="password" name="password" required maxlength="30" autocomplete="off">
            </div>
            <div class="inputBox">
                <label id="passwordchkLabel" for="password">비밀번호 확인</label>
                <input type="password" class="passwordchk" id="passwordchk" name="passwordchk" required maxlength="30" autocomplete="off">
            </div>
            <div class="search">
                <input type="submit" class="searchBtn" value="변경하기">
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
<jsp:include page="${pageContext.request.contextPath}/footer.jsp" />
<script>
    $(document).ready(function() {
        var userId = new URLSearchParams(window.location.search).get('user_id');
        $('#user_id').val(userId);

        $('#passwordChange-form').on('submit', function(e) {
            var password = $('#password').val();
            var passwordchk = $('#passwordchk').val();
            if (password !== passwordchk) {
                e.preventDefault();
                alert('Passwords do not match.');
            }
        });
    });
</script>

</body>
</html>