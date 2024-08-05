<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/member/passwordSearch.css">
    <link rel="icon" href="${pageContext.request.contextPath}/static/images/favicon.ico" type="image/x-icon">
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
<body>
<form id="passwordSearch-form" action="#" method="post">
    <div class="content">

        <h1>비밀번호 찾기</h1>
        <div id="searchBox">
            <div class="inputBox">
                <label id="idLabel" for="user_id">아이디</label>
                <input type="text" class="user_id" id="user_id" name="user_id" required maxlength="30"
                       autocomplete="off">
            </div>

            <div class="inputBox">
                <label id="emailLabel" for="email">이메일</label>
                <input type="email" class="email" id="email" name="email" required maxlength="30" autocomplete="off">
            </div>

            <div class="search">
                <button type="button" class="searchBtn">인증번호 받기</button>
            </div>

            <div id="proofBox">
                <div class="authenticationBox">
                    <input type="text" class="authenticationInput" id="authenticationInput" name="code"
                           required maxlength="30" autocomplete="off" placeholder=" 인증번호를 입력해 주세요.">
                </div>

                <div class="authenticationBox">
                    <button type="button" class="authenticationBtn">확인</button>
                </div>
                <li id="errMsg">인증번호를 다시 확인해주세요.</li>
            </div>
        </div>


    </div>
</form>
</body>
<script>

    const authenticationInput = document.getElementById("authenticationInput");
    const searchBox = document.getElementById("searchBox");
    const searchBtn = document.getElementsByClassName("searchBtn")[0];
    const authBtn = document.getElementsByClassName("authenticationBtn")[0];
    const proofBox = document.getElementById("proofBox");
    const errMsg = document.getElementById("errMsg");
    let timerRunning = false;
    let timer;

    $(() => {

        searchBtn.addEventListener('click', (e) => {
            $('.searchBtn').text('인증번호 재발급');
            proofBox.style.display = "unset";
            searchBox.style.height = '26rem';

            if (timerRunning) {
                clearInterval(timer);
            }

            let limitTime = 180;
            timerRunning = true;

            timer = setInterval(function () {
                let minutes = Math.floor(limitTime / 60);
                let seconds = limitTime % 60;

                // 2자리 표시
                let showMin = minutes < 10 ? '0' + minutes : minutes;
                let showSec = seconds < 10 ? '0' + seconds : seconds;

                // 화면에 표시
                $('#errMsg').text('남은 시간 ' + showMin + ':' + showSec);
                errMsg.style.visibility = 'unset';
                limitTime--;

                // 시간 초과일 때
                if (limitTime <= 0) {
                    clearInterval(timer);
                    timerRunning = false;
                    errMsg.style.visibility = 'hidden';

                    // 인증번호 삭제
                    $.ajax({
                        url: "/mail/expire",
                        type: "post",
                        data: $('#passwordSearch-form').serialize(),
                        success: (boolean) => {
                            if (boolean) console.log('Authentication numbers are expired');
                        },
                        error: (err) => {
                            console.log(err);
                        }
                    });
                }

            }, 1000);

            $.ajax({
                url: "/mail/confirm.do",
                type: "post",
                data: $("#passwordSearch-form").serialize(),
                success: (boolean) => {
                    if (boolean) console.log("Authentication email sent.");
                },
                error: (err) => {
                    console.log(err);
                }
            });
        });

        authBtn.addEventListener('click', (e) => {

            $.ajax({
                url: "/mail/verify",
                type: "post",
                data: $('#passwordSearch-form').serialize(),
                success: (boolean) => {

                    console.log(boolean);

                    if (boolean === false) {
                        $('#errMsg').text('인증번호를 다시 확인해주세요.');
                        errMsg.style.visibility = 'unset';
                    } else {
                        // true
                        // -> 비밀번호 변경 가능한 페이지 리턴
                        clearInterval(timer);
                        errMsg.style.visibility = 'hidden';


                        $.ajax({
                            url: "/mail/expire",
                            type: "post",
                            data: $("#passwordSearch-form").serialize(),
                            success: (boolean) => {
                                if (boolean) console.log('Authentication numbers are expired.');
                            },
                            error: (err) => {
                                console.log(err);
                            }
                        });

                    }

                },
                error: (err) => {
                    console.log(err);
                }
            });
        });


    });


</script>
<jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>

</body>
</html>
