<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/help/helpQnA.css">
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
    <div class="logo_head_between_area_container">
        <img src="${pageContext.request.contextPath}/static/images/extendHeaderImg.png" alt="theDoor" id="extendHeaderImg">
    </div>
    <div class="head_area">
        <p class="head_area_title">QNA</p>
    </div>
    <div class="search_area">
        <select name="searchCondition">
            <option value="title"
                    <c:if test="${searchMap.searchCondition == 'title'}">
                        selected
                    </c:if>>제목</option>
            <option value="content"
                    <c:if test="${searchMap.searchCondition == 'content'}">
                        selected
                    </c:if>>내용</option>
            <option value="all"
                    <c:if test="${searchMap == null || searchMap.searchCondition == 'all'}">
                        selected
                    </c:if>>제목+내용</option>
        </select>
        <input type="text" placeholder="검색어를 입력하세요" name="searchKeyword" value="${searchMap.searchKeyword}">
        <button class="search_button">검색</button>
    </div>
    <div class="content">
        <div class="board">
            <h2></h2>
            <ul class="posts" id="postsList">
                <!-- 게시글이 여기에 추가됩니다 -->
                <li>
                    <c:forEach items="${qnaBoardList}" var="qnaBoard">
                    <div class="post-info" onclick="location.href='/board/update-cnt.do?id=${qnaBoard.id}&type=qna'">

                        <h3>${qnaBoard.title}</h3>
                        <p>${qnaBoard.content}</p>
                        <span class="post-date">2024-07-18</span>
                    </div>
                    <div>
                        <javatime:format value="${freeBoard.regdate}" pattern="yyyy-MM-dd"/>
                    </div>
                    <div class="count">
                        조회수 : ${freeBoard.cnt}
                    </div>
                    </c:forEach>
                </li>

            </ul>
        </div>
        <div class="write-post-button">
            <a href="/helpboard/help-qna-write.do"><button>글쓰기</button></a>
        </div>
        <div class="pagination">
            <a href="#">&laquo;</a>
            <a href="#">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            <a href="#">&raquo;</a>
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
