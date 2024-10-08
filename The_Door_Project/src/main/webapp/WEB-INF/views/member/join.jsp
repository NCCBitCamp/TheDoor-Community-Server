<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/member/join.css">
    <link rel="icon" href="${pageContext.request.contextPath}/static/images/favicon.ico" type="image/x-icon">
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
<div class="content">
    <div class="form-list">
        <form id="join-form" action="/member/join.do" method="post">
            <!-- 아이디 -->
            <div class="divError" id="divId">
                <input type="text" id="user_id" name="user_id" placeholder="아이디" class="input" maxlength="20"
                       autocapitalize="off" autocomplete='off'>
                <!-- <button type="button" class="check-btn">중복확인</button> -->
            </div>

            <!-- 비밀번호 -->
            <div class="divError" id="divPw1">
                <input type="password" id="password" name="password" placeholder="비밀번호" class="input" maxlength="16"
                       autocomplete="new-password" aria-autocomplete="list" autocomplete='off'>
                <div id="eyeBtn">　</div>
            </div>

            <!-- 비밀번호 확인 -->
            <div class="divError" id="divPw2">
                <input type="password" id="pw2" name="pw2" placeholder="비밀번호 확인" class="input" maxlength="16"
                       autocomplete="new-password" aria-autocomplete="list" autocomplete='off'>
            </div>

            <!-- 닉네임 -->
            <div class="divError" id="divNickname">
                <input type="text" id="nickname" name="nickname" placeholder="닉네임" class="input" maxlength="15"
                       autocomplete='off'>
            </div>

            <!-- 이메일 -->
            <div class="divError" id="divEmail">
                <input type="email" id="email" name="email" placeholder="이메일주소" class="input" maxlength="50"
                       autocomplete='off'>
            </div>

            <!-- 이름 -->
            <div class="divError" id="divUsername">
                <input type="text" id="username" name="username" placeholder="이름" class="input" maxlength="20"
                       autocomplete='off'>
            </div>

            <!-- 생년월일 -->
            <div class="divError" id="divBirthday">
                <input type="text" id="birth" name="birth" placeholder="생년월일 8자리" class="input" maxlength="10"
                       autocomplete='off'>
            </div>

            <div class="divMsg" id="divMsg1">
                <li id="liMsg1">사용할 수 없는 아이디입니다.</li>
            </div>
            <div class="divMsg" id="divMsg2">
                <li id="liMsg2">사용할 수 없는 닉네임입니다.</li>
            </div>

            <!-- 가입 완료 버튼 -->
            <div class="divError" id="divSubmit">
                <button type="submit" class="input" id="divSubmitBtn">가입 완료</button>
            </div>
        </form>
    </div>
</div>
<script>

</script>
<jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/static/js/join.js"></script>
</body>
</html>