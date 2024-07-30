<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/member/idSearch.css">
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
<form id="idSearch-form" action="/member/idSearch.do" method="post">
    <div class="content">

        <h1>아이디 찾기</h1>
        <div id="searchBox">
            <div class="inputBox">
                <label id="nameLabel" for="username">이름</label>
                <input type="text" class="username" id="username" name="username" required maxlength="30"
                       autocomplete="off">
            </div>

            <div class="inputBox">
                <label id="emailLabel" for="email">이메일</label>
                <input type="email" class="email" id="email" name="email" required maxlength="30" autocomplete="off">
            </div>

            <div class="search">
                <button type="submit" class="searchbtn">확인</button>
                <%--                onclick="location.href='/member/idSearched.do'"--%>
            </div>
        </div>


    </div>
</form>
<jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
<script>
    // $(() => {
    //
    //     $.ajax({
    //         url: "/member/idSearch.do",
    //         type: "post",
    //         data: $("idSearch-form").serialize(),
    //         success: (map) => {
    //             console.log(map);
    //             console.log("?");
    //
    //             //     조회 결과 회원님의 아이디는 (String) 입니다.
    //
    //         },
    //         error: (err) => {
    //             console.log(err);
    //         }
    //     });
    //
    // });
</script>
</body>
</html>
