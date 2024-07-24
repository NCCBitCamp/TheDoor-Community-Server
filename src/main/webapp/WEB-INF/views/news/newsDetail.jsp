<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/newsDetail.css">
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
    <div class="content">
        <!--헤더이미지-->
        <img src="${pageContext.request.contextPath}/static/images/extendHeaderImg.png" alt="theDoor" id="extendHeaderImg">

        <!-- 공지사항 상세 내용 -->
        <main class="container mt-5 mb-5">
            <div class="notice-header">
                <div class="notice-title">공지사항 제목</div>
                <div class="notice-writer">작성자: 관리자</div>
            </div>
            <div class="notice-content">
                공지사항 내용이 여기에 들어갑니다.
            </div>
            <div class="btn-container">
                <button type="button" class="btn btn-outline-secondary" onclick="location.href='newsModify.jsp'">수정하기</button>
            </div>
        </main>
    </div>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
</body>
</html>
