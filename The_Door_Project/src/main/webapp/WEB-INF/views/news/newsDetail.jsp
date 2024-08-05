<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/news/newsDetail.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" href="${pageContext.request.contextPath}/static/images/favicon.ico" type="image/x-icon">
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
    <div class="content">
        <!--헤더이미지-->
        <img src="${pageContext.request.contextPath}/static/images/extendHeaderImg.png" alt="theDoor" id="extendHeaderImg">

        <!-- 공지사항 상세 내용 -->
        <main class="container mt-5 mb-5">
            <div class="notice-header">
                <div class="notice-title">&lt;${news.title}&gt;</div>
                <div class="notice-writer">작성자: ${news.nickname}</div>
            </div>
            <div class="notice-content">
                ${news.content}
            </div>
            <div class="file-list mt-5 mb-5">
                <h5> [첨부 파일] </h5>
                <c:forEach var="file" items="${fileList}">
                    <c:if test="${file.filetype.startsWith('image')}">
                        <img src="${pageContext.request.contextPath}/upload/${file.filename}" alt="${file.fileoriginname}" style="max-width: 100%; height: auto;">
                    </c:if>
                    <c:if test="${!file.filetype.startsWith('image')}">
                        <a href="${pageContext.request.contextPath}/upload/${file.filename}" download="${file.fileoriginname}">
                                ${file.fileoriginname}
                        </a>
                    </c:if>
                </c:forEach>
            </div>
            <c:if test="${loginMember ne null  && loginMember.role == 'ADMIN'}">
                <div class="btn-container mt-4">
                    <button type="button" class="btn btn-outline-secondary" onclick="location.href='/news/newsModify.do?id=${news.id}'">수정하기</button>
                </div>
            </c:if>
        </main>
    </div>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
</body>
</html>
