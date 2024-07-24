<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/help/help.css">
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
    <div class="logo_head_between_area_container">
        <img src="${pageContext.request.contextPath}/static/images/extendHeaderImg.png" alt="theDoor" id="extendHeaderImg">
    </div>
    <div class="head_area">
       <p class="head_area_title">FAQ & QnA</p>
    </div>
    <div class="content">
        <div class="semi_title">
            <p>자주하는 질문 TOP3</p>
        </div>
        <div class="commentbox1"></div>
        <div class="commentbox2"></div>
        <div class="commentbox3"></div>
        <!--이 코멘트 박스들에는 조회수가 가장 높은 FaQ 3개를 올려주는 기능-->
        <div class="button_area">
            <div class="faq_button"><a href="helpFaQ.jsp">FAQ 바로가기</a></div>
            <div class="qna_button"><a href="helpQnA.jsp">QnA 바로가기</a></div>
        </div>
    </div>
    <div class="content-footer-gap"></div>

    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>

    <script>
        window.addEventListener('load', function() {
            setTimeout(function() {
                document.querySelector('.commentbox1').classList.add('fade-in');
            }, 500); // 0.5초 후 첫 번째 박스 페이드인

            setTimeout(function() {
                document.querySelector('.commentbox2').classList.add('fade-in');
            }, 1000); // 1초 후 두 번째 박스 페이드인

            setTimeout(function() {
                document.querySelector('.commentbox3').classList.add('fade-in');
            }, 1500); // 1.5초 후 세 번째 박스 페이드인
        });
    </script>
</body>
</html>
