<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/myPage/myPageInfo.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" href="${pageContext.request.contextPath}/static/images/favicon.ico" type="image/x-icon">
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
                    <form id="alter_form" action="/myPage/modifyMyInfo.do" method="post">
                        <input name="id" value="${personalInfo.id}" type="hidden">

                        <div>
                            <label for="newPW">비밀번호</label><br>
                            <p id="password_validate" style="font-size: small"></p>
                            <input id="newPW" type="password" name="password">
                        </div>
                        <div>
                            <label for="newPWCK">비밀번호 재입력</label><br>
                            <p id="password_confirm" style="font-size: small"></p>
                            <input id="newPWCK" type="password">
                        </div>
                        <div>
                            <label for="userEmail">이메일</label>
                            <p id="email_validate" style="font-size: small"></p>
                            <input id="userEmail" type="email" name="email" value="${personalInfo.email}">
                        </div>
                        <div>
                            <label for="userNickName">닉네임</label><br>
                            <p id="nickname_validate" style="font-size: small"></p>
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
        const submitBtn = document.getElementById("submitBtn");

        const newPW = document.getElementById("newPW");
        const pwRetry = document.getElementById("newPWCK");
        const password_confirm_text = document.getElementById("password_confirm");

        const password_validate_text = document.getElementById("password_validate");

        const user_email = document.getElementById("userEmail");
        const email_validate_text = document.getElementById("email_validate");


        const userNickName = document.getElementById("userNickName");
        const nickname_validate_text = document.getElementById("nickname_validate");


        let pass_confirm = false;
        let pass_validate = false;
        let email_validate = true;
        let nickname_validate = true;

        const pw_regex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/;
        const email_regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;


        const update_submit_button = () => {
            submitBtn.disabled = !(pass_validate && pass_confirm && email_validate && nickname_validate);
        };

        function check_password_validate(){
            if(pw_regex.test(newPW.value)){
                password_validate_text.textContent = "유효한 비밀번호 입니다.";
                password_validate_text.style.color = "green";
                pass_validate = true;
            }else{
                password_validate_text.textContent = "비밀번호는 8~16자의 영문, 숫자, 특수문자를 사용해 주세요.";
                password_validate_text.style.color = "red";
                pass_validate = false;
            }
            update_submit_button();
        }


        function checkPasswordMatch() {
            if (newPW.value === pwRetry.value && newPW.value !== "") {
                password_confirm_text.textContent = "비밀번호가 일치합니다.";
                password_confirm_text.style.color = "green";
                pass_confirm = true;
            } else {
                password_confirm_text.textContent = "비밀번호가 일치하지 않습니다.";
                password_confirm_text.style.color = "red";
                pass_confirm = false;
            }
            update_submit_button();
        }


        function check_email_validate(){
            if(email_regex.test(user_email.value)){
                email_validate_text.textContent = "유효한 이메일 입니다.";
                email_validate_text.style.color = "green";
                email_validate = true;
            }else{
                email_validate_text.textContent = "유효하지 않은 이메일 입니다.";
                email_validate_text.style.color = "red";
                email_validate = false;
                }
            update_submit_button();
        }


        function check_nickname_validate(){
            $.ajax({
                url: "/myPage/alterNicknameCheck.do",
                type: "post",
                data: {nickname: userNickName.value,
                        id: ${personalInfo.id}},
                success: (map) => {
                    console.log(map); // 예외 확인하고 지우기
                    if (map.newNicknameCheckNum === 0) {
                        nickname_validate_text.textContent = "사용 가능한 닉네임 입니다.";
                        nickname_validate_text.style.color = "green";
                        nickname_validate = true;
                    } else {
                        nickname_validate_text.textContent = "사용 불가능한 닉네임 입니다.";
                        nickname_validate_text.style.color = "red";
                        nickname_validate = false;
                    }
                    update_submit_button();  // 닉네임 검증 후에도 버튼 상태 업데이트
                },
                error: (err) => {
                    console.log(err);
                }
            });
        }

        newPW.addEventListener('input', checkPasswordMatch);
        pwRetry.addEventListener('input', checkPasswordMatch);
        newPW.addEventListener('input', check_password_validate);
        user_email.addEventListener('input', check_email_validate);
        userNickName.addEventListener('blur', check_nickname_validate);

        update_submit_button(); // 초기 상태에서 버튼 비활성화 업데이트
    });

</script>

</body>
</html>
