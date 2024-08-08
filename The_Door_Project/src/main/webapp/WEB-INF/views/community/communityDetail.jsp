<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/community/communityDetail.css">
    <link rel="icon" href="${pageContext.request.contextPath}/static/images/favicon.ico" type="image/x-icon">
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
    <div class="content">
        <!--헤더이미지-->
        <img src="${pageContext.request.contextPath}/static/images/extendHeaderImg.png" alt="theDoor" id="extendHeaderImg">

        <!-- 자유게시판 상세 내용 -->
        <main class="container mt-5 mb-5">
            <div class="community-header">
                <div class="community-title">&lt;${community.title}&gt;</div>
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
            <c:if test="${loginMember ne null}">
                <div class="btn-container mt-4">
                    <button type="button" class="btn btn-outline-secondary" onclick="location.href='/community/communityModify.do?id=${community.id}'">수정하기</button>
                </div>
            </c:if>
            <!-- 기존의 게시글 내용 및 첨부 파일 섹션 -->
            <div class="comment-list mt-5">
                <h5> [댓글 목록] </h5>
                <c:forEach items="${commentList}" var="comment">
                    <div class="comment">
                        <p><strong>${comment.writer_id}</strong>: ${comment.content}</p>
                        <p class="text-muted"><small>${comment.date}</small></p>
                    </div>
                </c:forEach>
            </div>

            <c:if test="${loginMember ne null}">
                <div class="comment-form mt-5" id="commentFrom">
                    <form action="${pageContext.request.contextPath}/community/addComment.do" method="post">
                        <input type="hidden" name="board_id" value="${community.id}">
                        <div class="mb-3">
                            <textarea class="form-control" name="content" rows="3" placeholder="댓글을 입력하세요" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">댓글 작성</button>
                    </form>
                </div>
            </c:if>
            <c:if test="${loginMember eq null}">
                <p>댓글을 작성하려면 <a href="${pageContext.request.contextPath}/member/login.do">로그인</a>하세요.</p>
            </c:if>

        </main>
    </div>
    
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
</body>
</html>
