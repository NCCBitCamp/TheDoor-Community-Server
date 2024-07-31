<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/myPage/myPageInfo.css">
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
    <div class="content">
        <img src="${pageContext.request.contextPath}/static/images/extendHeaderImg.png" alt="theDoor" id="extendHeaderImg">
        <div id="profileArea">
            <img src="${pageContext.request.contextPath}/static/images/myPage/profileImg.png" class="profileImg">
            
            <!-- profileAlertImg 이미지변경 함수처리가 안되고 알람있으면, 빨간불 들어오게 만들기 -->
            <!-- 이미지 사용자가 변경할 수 있도록 만들기 -->
              
            <p class="emphaFont">${personalInfo.nickname}</p>
        </div>
        
        <div id="selectArea">
                <ul>
                    <li><a href="/myPage/info.do">개인정보</a></li>
                    <li><a href="/myPage/rank.do">My 랭킹</a></li>
                    <li><a href="/myPage/post.do">내가 쓴 글</a></li>
                    <li><a href="/myPage/alert.do">알림</a></li>
                </ul>

            <div id="userInfo">            
                <div class="old">
                    <legend class="emphaFont">기존정보</legend>
                    <hr>
                    <br>
                    <div>
                        <label for="fixUserId">아이디</label>
                        <p></p>
                        <input class="fixedUserInfo" id="fixUserId" type="text" value="${personalInfo.user_id}" readonly>
                    </div>
                    <div>
                        <label for="fixUserName">이름</label>
                        <p></p>
                        <input class="fixedUserInfo" id="fixUserName" type="text" value="${personalInfo.username}" readonly>
                    </div>
                    <div>
                        <label for="fixUserEmail">이메일</label>
                        <p></p>
                        <input class="fixedUserInfo" id="fixUserEmail" type="text" value="${personalInfo.email}" readonly>
                    </div>
                    <div>
                        <label for="fixUserNick">닉네임</label>
                        <p></p>
                        <input class="fixedUserInfo" id="fixUserNick" type="text" value="${personalInfo.nickname}" readonly>
                    </div>
                    <div>
                        <label for="fixUserBirth">생년월일</label>
                        <p></p>
                        <input class="fixedUserInfo" id="fixUserBirth" type="text" value="${personalInfo.birth}" readonly>
                    </div>
                </div>

                <div class="new">
                    <legend class="emphaFont">회원정보 변경</legend>
                    <hr>
                    <br>
                    <form action="/myPage/modifyMyInfo.do" method="post">
                        <input name="id" value="${personalInfo.id}" type="hidden">

                        <div>
                            <label for="newPW">비밀번호</label><br>
                            <p></p>
                            <input id="newPW" type="text" name="password">
                        </div>
                        <div>
                            <label for="newPWCK">비밀번호 재입력</label><br>
                            <input id="newPWCK" type="text">
                            <p id="passwordConfirm"></p>
                        </div>
                        <div>
                            <label for="userEmail">이메일</label><br>
                            <p></p>
                            <input id="userEmail" type="email" name="email" value="${personalInfo.email}">
                        </div>
                        <div>
                            <label for="userNickName">닉네임</label><br>
                            <p></p>
                            <input id="userNickName" type="text" name="nickname" value="${personalInfo.nickname}">
                        </div>
                        <br>
                        <br>
                        <div>
                            <input id="submitBtn" type="submit" value="변경하기" style="background-color: black; color: white; font-weight: bold;">
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>

<script>
    document.addEventListener('DOMContentLoaded', (event) => {
        const newPW = document.getElementById("newPW");
        const pwRetry = document.getElementById("newPWCK");
        const passwordConfirm = document.getElementById("passwordConfirm");
        const submitBtn = document.getElementById("submitBtn");

        var passConfirm = false;

        if (newPW.value === "" || newPW.value === null){
            submitBtn.disabled = !passConfirm;
        }

        function checkPasswordMatch() {
            if (newPW.value === pwRetry.value) {
                passwordConfirm.textContent = "비밀번호가 일치합니다.";
                passwordConfirm.style.color = "green";
                passConfirm = true;
            } else {
                passwordConfirm.textContent = "비밀번호가 일치하지 않습니다.";
                passwordConfirm.style.color = "red";
                passConfirm = false;
            }
            submitBtn.disabled = !passConfirm;


        }

        newPW.addEventListener('input', checkPasswordMatch);
        pwRetry.addEventListener('input', checkPasswordMatch);


    });


</script>

<%--ajax써서 json 변환해서 값 받기--%>
<%--닉네임 중복체크 만들기--%>
<%--이메일 형식 맞춰받기--%>

</body>
</html>
