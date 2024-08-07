<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/member/passwordSearch.css">
    <link rel="icon" href="${pageContext.request.contextPath}/static/images/favicon.ico" type="image/x-icon">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>

<form id="passwordSearch-form" action="${pageContext.request.contextPath}/member/passwordSearch.do" method="post">
    <div class="content">
        <div class="login-container">
            <h2>비밀번호 찾기</h2>
            <div id="searchBox">
                <div class="inputBox">
                    <label id="idLabel" for="user_id">ID</label>
                    <input type="text" class="user_id" id="user_id" name="user_id" required maxlength="30"
                           autocomplete="off">
                </div>
                <div class="inputBox">
                    <label id="emailLabel" for="email">Email</label>
                    <input type="email" class="email" id="email" name="email" required maxlength="30" autocomplete="off">
                </div>
                <div class="search">
                    <input type="submit" class="searchBtn" value="인증번호 받기">
                </div>

                <div id="proofBox" style="display: none;">
                    <div class="authenticationBox">
                        <input type="text" class="authenticationInput" id="authenticationInput" name="code"
                               required maxlength="30" autocomplete="off" placeholder=" 인증번호를 입력해 주세요.">
                    </div>
                    <div class="authenticationBox">
                        <input type="submit" class="authenticationBtn" value="확인">
                    </div>
                    <li id="errMsg">인증번호를 다시 확인해주세요.</li>
                </div>
            </div>
        </div>
    </div>
</form>

<script>
    const authenticationInput = document.getElementById("authenticationInput");
    const searchBox = document.getElementById("searchBox");
    const searchBtn = document.getElementsByClassName("searchBtn")[0];
    const authBtn = document.getElementsByClassName("authenticationBtn")[0];
    const proofBox = document.getElementById("proofBox");
    const errMsg = document.getElementById("errMsg");
    let timerRunning = false;
    let timer;

    $(document).ready(() => {
        searchBtn.addEventListener('click', (e) => {
            e.preventDefault();
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

                let showMin = minutes < 10 ? '0' + minutes : minutes;
                let showSec = seconds < 10 ? '0' + seconds : seconds;

                $('#errMsg').text('남은 시간 ' + showMin + ':' + showSec);
                errMsg.style.visibility = 'unset';
                limitTime--;

                if (limitTime <= 0) {
                    clearInterval(timer);
                    timerRunning = false;
                    $('#errMsg').text('시간이 만료되었습니다. 인증번호를 다시 요청해주세요.');
                    $('.searchBtn').text('인증번호 재발급');
                    errMsg.style.visibility = 'visible';

                    $.ajax({
                        url: "/mail/expire",
                        type: "post",
                        data: $('#passwordSearch-form').serialize(),
                        success: (response) => {
                            if (response) console.log('Authentication numbers are expired');
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
                success: (response) => {
                    if (response) console.log("Authentication email sent.");
                },
                error: (err) => {
                    console.log(err);
                }
            });
        });

        authBtn.addEventListener('click', (e) => {
            e.preventDefault();

            $.ajax({
                url: "/mail/verify",
                type: "post",
                data: $('#passwordSearch-form').serialize(),
                success: (response) => {
                    if (response) {
                        // Expire 컨트롤러 추가하기
                        clearInterval(timer);
                        $.ajax({
                            url: "/mail/expire",
                            type: "post",
                            data: $('#passwordSearch-form').serialize(),
                            success: (response) => {
                                if (response) console.log('Authentication numbers are expired');
                            },
                            error: (err) => {
                                console.log(err);
                            }
                        });
                        window.location.href = "${pageContext.request.contextPath}/member/passwordChange.do?user_id=" + $('#user_id').val();
                    } else {
                        $('#errMsg').text('인증번호를 다시 확인해주세요.');
                        errMsg.style.display = 'block';
                        errMsg.style.color = '#FBC70E';
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
