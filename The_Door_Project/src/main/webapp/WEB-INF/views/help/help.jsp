<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/help/help.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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
        <div class="commentbox1" style="height: 20vh">
            <h3 style="margin-top: 2.5vh; display: block">가장 많이 질문된 질문1제목</h3>
            <h5>작성자 : 안용현포에버 님</h5>
            <h5>조회수 : </h5>
        </div>
        <div class="commentbox2" style="height: 20vh">
            <h3 style="margin-top: 2.5vh">가장 많이 질문된 질문2제목</h3>
            <p>작성자 : 기습숭배 님</p>
            <p>조회수 : </p>
        </div>
        <div class="commentbox3" style="height: 20vh">
            <h3 style="margin-top: 2.5vh">가장 많이 질문된 질문3제목</h3>
            <p>작성자 : 똥겜판별사 님</p>
            <p>조회수 : </p>
        </div>
        <!--이 코멘트 박스들에는 조회수가 가장 높은 FaQ 3개를 올려주는 기능-->
        <div class="button_area">
            <div class="faq_button"><a href="/helpboard/help-faq.do">FAQ 바로가기</a></div>
            <div class="qna_button"><a href="/helpboard/help-qna.do">QnA 바로가기</a></div>
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
