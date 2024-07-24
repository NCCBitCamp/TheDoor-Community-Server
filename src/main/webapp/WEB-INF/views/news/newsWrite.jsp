<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/newsWrite.css">
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
    <main>
        <div class="container mt-5 mb-5">
            <h4>공지사항 글쓰기</h4>
        </div>
        <div class="container mt-3">
            <form id="writeForm" action="#" method="post">
                <div class="form-group">
                    <label for="title">제목</label>
                    <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요" required>
                </div>
                <div class="form-group mt-3">
                    <label for="writer">작성자</label>
                    <input type="text" class="form-control" id="writer" name="writer" placeholder="작성자 이름" required>
                </div>
                <div class="form-group mt-3">
                    <label for="content">내용</label>
                    <textarea class="form-control" id="content" name="content" rows="10" placeholder="내용을 입력하세요" required></textarea>
                </div>
                <div class="form-group mt-3">
                    <label for="uploadFiles">파일첨부</label>
                    <input class="form-control" type="file" name="uploadFiles" id="uploadFiles" multiple>
                    <div id="fileInstructions" class="form-text text-danger">
                        파일을 변경하려면 이미지를 클릭하세요. 파일을 다운로드하려면 파일이름을 클릭하세요. 파일을 추가하려면 파일 선택 버튼을 클릭하세요.
                    </div>
                    <div id="filePreview" class="mt-3 text-center">
                        <!-- 파일 미리보기 영역 -->
                    </div>
                </div>
                <div class="btn-container mt-3 mb-5">
                    <button type="submit" id="btn-submit" class="btn btn-outline-secondary">등록</button>
                </div>
            </form>
        </div>
    </main>

    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
</body>
</html>
