<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/help/helpFaQ.css">
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
    <div class="logo_head_between_area_container">
        <img src="${pageContext.request.contextPath}/static/images/extendHeaderImg.png" alt="theDoor" id="extendHeaderImg">
    </div>
    <div class="head_area">
        <p class="head_area_title">FnQ</p>
    </div>
    <div class="content">
        <div class="title_area">어떤 것이 궁금하신가요?</div>
        <div class="image-container">
            <a href="helpFaQ_purchase.jsp"><img src="${pageContext.request.contextPath}/static/images/help/gyul_new.png" class="image_button" alt="Gyul Image"></a>
            <a href="helpFaQ_account.jsp"><img src="${pageContext.request.contextPath}/static/images/help/gye_new.png" class="image_button" alt="Gye Image"></a>
            <a href="helpFaQ_etc.jsp"><img src="${pageContext.request.contextPath}/static/images/help/etc_new.png" class="image_button" alt="Etc Image"></a>
        </div>
        <div class="semi_title" style="text-align: center;">
            <p>저희 더 도어즈 팀은 여러분들의 궁금증을 풀어드리기 위하여</p>
            <p>최고의 노력을 다하고 있습니다.</p>
            <p>진짜루</p>
            <p></p>
        </div>
    </div>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>

    <script>
        window.addEventListener('load', function() {
            setTimeout(function() {
                document.querySelector('.semi_title').classList.add('fade-in');
            }, 500); // 0.5초 후 페이드인
        });
    </script>
</body>
</html>
