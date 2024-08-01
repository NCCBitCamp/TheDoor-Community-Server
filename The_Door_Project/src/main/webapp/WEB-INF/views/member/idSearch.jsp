<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/member/idSearch.css">
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/header.jsp" />
<form id="idSearch-form" action="${pageContext.request.contextPath}/member/idSearched.do" method="post">
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
                <input type="submit" class="searchbtn" value="확인" onclick="searchId(event)">
            </div>
            <div class="error-message" style="color: red;"></div>
        </div>
    </div>
</form>
<jsp:include page="${pageContext.request.contextPath}/footer.jsp" />

<script>
    function searchId(e) {
        e.preventDefault(); // 폼 제출 방지
        const formData = {
            username: $("#username").val(),
            email: $("#email").val()
        };

        $.ajax({
            url: '${pageContext.request.contextPath}/member/idSearched.do',
            type: 'POST',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            data: $.param(formData),
            success: function(response) {
                if (response.status === 'success') {
                    // Redirect to the result page with the user_id using GET
                    window.location.href = '${pageContext.request.contextPath}/member/idSearched?user_id=' + response.user_id;
                } else {
                    // Show error message in the page
                    $(".error-message").text(response.message).show();
                }
            },
            error: function() {
                $(".error-message").text('오류가 발생했습니다. 다시 시도해 주세요.').show();
            }
        });
    }
</script>
</body>
</html>