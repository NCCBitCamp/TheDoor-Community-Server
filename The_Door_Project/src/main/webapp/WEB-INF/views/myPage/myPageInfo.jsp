<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/myPage/myPageInfo.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" href="${pageContext.request.contextPath}/static/images/favicon.ico" type="image/x-icon">
    <style>
        #user_profile_image {
            width: 115px;
            height: 115px;
            border-radius: 50%; /* 이미지를 동그랗게 자릅니다 */
            object-fit: cover; /* 이미지를 영역에 맞게 잘라줍니다 */
        }
    </style>
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
    <div class="content">
        <img src="${pageContext.request.contextPath}/static/images/extendHeaderImg.png" alt="theDoor" id="extendHeaderImg">
        <div id="profileArea">
            <c:choose>
                <c:when test="${not empty profileImg.id}">
                    <img id="user_profile_image" src="/upload/${profileImg.filename}" alt="${profileImg.filename}" class="profileImg" style="cursor: pointer; margin-bottom: 0">
                </c:when>
                <c:otherwise>
                    <img id="user_profile_image" src="${pageContext.request.contextPath}/static/images/myPage/profileImg.png" alt="defaultImg" class="profileImg" style="cursor: pointer; margin-bottom: 0">
                </c:otherwise>
            </c:choose>
<%--            이미지 업로드 시 자동으로 js로 폼 제출하기--%>
            <form id="profileImageForm" action="/myPage/uploadProfileImage.do" method="post" enctype="multipart/form-data" style="margin-top: -7px">
<%--                <p style="color: #6c757d">프로필 사진은 본 화면에서만 가능하세요.</p>--%>
                <input type="hidden" name="id" value="${personalInfo.id}" style="margin: 0; padding: 0">
                <input type="file" id="profileImageInput" name="uploadImg" style="display: none; margin: 0; padding: 0" accept="image/*">
            </form>

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




    document.addEventListener('DOMContentLoaded', (event) => {
        const profileImageInput = document.getElementById('profileImageInput');
        const profileImageForm = document.getElementById('profileImageForm');
        const userProfileImage = document.getElementById('user_profile_image');

        // 프로필 이미지를 클릭하면 파일 입력 요소를 열어 이미지를 선택하도록 함
        userProfileImage.addEventListener('click', function() {
            profileImageInput.click();
        });

        // 사용자가 파일을 선택했을 때 실행되는 이벤트 핸들러
        profileImageInput.addEventListener('change', function(event) {
            const file = event.target.files[0]; // 사용자가 선택한 파일을 가져옴

            if (file) {
                // 허용된 파일 형식 목록 (MIME 타입 기준)
                const allowedTypes = ['image/jpeg', 'image/png', 'image/gif', 'image/svg+xml', 'image/bmp'];

                // 사용자가 선택한 파일의 MIME 타입이 허용된 형식인지 확인
                if (!allowedTypes.includes(file.type)) {
                    // 파일 형식이 맞지 않으면 경고 메시지를 표시하고 업로드 중단
                    alert('jpg, jpeg, png, gif, svg, bmp 형식의 이미지 파일만 업로드 가능합니다.');
                    return; // 업로드 중단
                }

                // 파일 형식이 유효한 경우, 미리보기 이미지를 업데이트하기 위해 FileReader 사용
                const reader = new FileReader();
                reader.onload = function(e) {
                    // 이미지 미리보기 영역(src 속성)에 파일의 데이터 URL을 설정하여 이미지 미리보기를 표시
                    userProfileImage.src = e.target.result;
                };
                reader.readAsDataURL(file); // 파일을 읽어서 데이터 URL 형식으로 변환

                // 선택한 파일을 서버에 업로드
                uploadProfileImage(file);
            }
        });

        // 서버에 프로필 이미지를 업로드하는 함수
        function uploadProfileImage(file) {
            const formData = new FormData(); // FormData 객체를 생성하여 파일 데이터를 담음
            formData.append('uploadImg', file); // 서버에 전송할 폼 데이터에 파일을 추가

            // AJAX 요청을 통해 서버로 파일을 업로드
            $.ajax({
                url: profileImageForm.action, // 폼 액션 URL을 사용
                type: profileImageForm.method, // 폼 메서드를 사용
                data: formData, // 전송할 데이터를 설정 (파일 데이터)
                processData: false, // 파일 데이터는 이미 처리된 상태이므로 처리하지 않도록 설정
                contentType: false, // 파일 업로드의 Content-Type을 설정하지 않음 (브라우저가 자동 설정)
                success: function(response) {
                    // 서버에서 이미지가 성공적으로 저장되면, 파일 입력 값을 초기화하여 요청을 한번만 발생하도록 함
                    profileImageInput.value = '';
                },
                error: function(err) {
                    // 파일 업로드 실패 시 콘솔에 에러 메시지를 출력
                    console.error('프로필 이미지 업로드 실패:', err);
                }
            });
        }
    });



</script>

</body>
</html>
