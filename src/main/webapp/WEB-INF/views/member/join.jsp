<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/member/join.css">
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
    <div class="content">
        <div class="form-list">
            <form action="submit_form.php" method="post">
                <!-- 아이디 -->
                <div class="divError" id="divId">
                    <input type="text" id="id" name="id" placeholder="아이디" class="input" maxlength="20"
                           autocapitalize="off" autocomplete='off'>
                    <!-- <button type="button" class="check-btn">중복확인</button> -->
                </div>

                <!-- 비밀번호 -->
                <div class="divError" id="divPw1">
                    <input type="password" id="pw1" name="pw1" placeholder="비밀번호" class="input" maxlength="20"
                           autocomplete="new-password" aria-autocomplete="list" autocomplete='off'>
                </div>

                <!-- 비밀번호 확인 -->
                <div class="divError" id="divPw2">
                    <input type="password" id="pw2" name="pw2" placeholder="비밀번호 확인" class="input" maxlength="50"
                           autocomplete="new-password" aria-autocomplete="list" autocomplete='off'>
                </div>

                <!-- 닉네임 -->
                <div class="divError" id="divNickname">
                    <input type="text" id="nickname" name="nickname" placeholder="닉네임" class="input" maxlength="20"
                           autocomplete='off'>
                </div>

                <!-- 이메일 -->
                <div class="divError" id="divEmail">
                    <input type="email" id="email" name="email" placeholder="이메일주소" class="input" maxlength="50"
                           autocomplete='off'>
                </div>

                <!-- 이름 -->
                <div class="divError" id="divUsername">
                    <input type="text" id="name" name="name" placeholder="이름" class="input" maxlength="20"
                           autocomplete='off'>
                </div>

                <!-- 생년월일 -->
                <div class="divError" id="divBirthday">
                    <input type="text" id="birthday" name="birthday" placeholder="생년월일 8자리" class="input" maxlength="10"
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
                    <button type="submit" class="input" style="cursor: pointer;">가입 완료</button>
                </div>
            </form>
        </div>
    </div>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
    <script src="${pageContext.request.contextPath}/static/js/join.js"></script>
</body>
</html>