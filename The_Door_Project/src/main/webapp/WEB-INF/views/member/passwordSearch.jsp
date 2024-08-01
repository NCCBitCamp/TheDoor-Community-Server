<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/member/passwordSearch.css">
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
                <button type="submit" class="searchBtn">인증번호 받기</button>
            </div>

            <div id="proofBox">
                <div class="authenticationBox">
                    <input type="text" class="authenticationInput" id="authenticationInput" name="authenticationInput"
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
    $(() => {

        $.ajax({
            url:"/mail/confirm.do",
            type:"post",
            data: $("#passwordSearch-form").serialize(),
            success: () => {


            },
            error: (err) => {
                console.log(err);
            }
        });

    });

    window.addEventListener("DOMContentLoaded", () => {
        const searchBox = document.getElementById("searchBox");
        const searchBtn = document.getElementsByClassName("searchBtn")[0];
        const proofBox = document.getElementById("proofBox");
        const errMsg = document.getElementById("errMsg");
        const authenticationBtn = document.getElementsByClassName("authenticationBtn")[0];


        searchBtn.addEventListener('click', (e) => {
            e.preventDefault();
            proofBox.style.display = "unset";
            searchBox.style.height = '26rem';
        });

        authenticationBtn.addEventListener('click', (e) => {
            // 인증번호 틀리는 조건식 + 기능구현
            if (!false) {
                errMsg.style.visibility = 'unset';

            }
        });

    });
</script>
<jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>

</body>
</html>
