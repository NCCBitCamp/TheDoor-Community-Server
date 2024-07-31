<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
                <div class="community-title"><${community.title}></div>
                <div class="community-writer">작성자: ${community.nickname}</div>
            </div>
            <div class="community-content">
                ${community.content}
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
            <div class="btn-container mt-4">
                <button type="button" class="btn btn-outline-secondary" onclick="location.href='/community/communityModify.do?id=${community.id}'">수정하기</button>
            </div>
        </main>
    </div>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
</body>
</html>
