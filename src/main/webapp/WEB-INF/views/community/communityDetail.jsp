<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/community/communityDetail.css">
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
    <div class="content">
        <!--헤더이미지-->
        <img src="${pageContext.request.contextPath}/static/images/extendHeaderImg.png" alt="theDoor" id="extendHeaderImg">

        <!-- 자유게시판 상세 내용 -->
        <main class="container mt-5 mb-5">
            <div class="community-header">
                <div class="community-title">자유게시판 제목</div>
                <div class="community-writer">작성자: 글쓴이</div>
            </div>
            <div class="community-content">
                 내용이 여기에 들어갑니다.
            </div>
            <div class="btn-container mt-4">
                <button type="button" class="btn btn-outline-secondary" onclick="location.href='communityModify.jsp?boardNo=1'">수정하기</button>
            </div>
        </main>
    </div>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
</body>
</html>
