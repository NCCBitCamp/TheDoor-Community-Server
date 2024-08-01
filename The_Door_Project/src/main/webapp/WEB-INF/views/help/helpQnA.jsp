<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
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
<%--    <form id="search-form" action="/helpboard/help-qna.do" method="post">--%>
    <form id="search-form" action="${pageContext.request.contextPath}/helpboard/help-qna.do" method="post">
    <div class="search_area">
        <select class="form-select" name="searchCondition">
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
        <button type="submit" class="search_button">검색</button>
    </div>
    </form>
    <div class="content">
        <div class="board">
            <h2></h2>
            <c:forEach items="${qnaBoardList}" var="qnaBoard">
            <ul class="posts" id="postsList">
                <!-- 게시글이 여기에 추가됩니다 -->
                <li>

                    <div class="post-info">

                        <h3 onclick="location.href='/helpboard/update-cnt.do?id=${qnaBoard.id}'">${qnaBoard.title}</h3>
                        <p onclick="location.href='/helpboard/update-cnt.do?id=${qnaBoard.id}'">${qnaBoard.content}</p>
                        <span class="post-date">2024-07-18</span>
                    </div>
                    <div>
                        <javatime:format value="${qnaboard.regdate}" pattern="yyyy-MM-dd"/>
                    </div>
                    <div class="count">
                        ${qnaboard.cnt}
                    </div>

                </li>
            </ul>
            </c:forEach>
        </div>
        <c:if test="${loginMember ne null}">
            <div class="write-post-button">
                <button type="button" onclick="location.href='/helpboard/help-qna-write.do'">글쓰기</button>
            </div>
        </c:if>
        <div class="pagination">
            <c:forEach begin="${page.startPage}" end="${page.endPage}" var="number">
                <a href="${pageContext.request.contextPath}/helpboard/help-qna.do?pageNum=${number}">${number}</a>
            </c:forEach>
            <c:if test="${page.prev}">
                <a href="${pageContext.request.contextPath}/helpboard/help-qna.do?pageNum=${page.cri.pageNum - 1}">&laquo;</a>
            </c:if>
            <c:if test="${page.next}">
                <a href="${pageContext.request.contextPath}/helpboard/help-qna.do?pageNum=${page.cri.pageNum + 1}">&raquo;</a>
            </c:if>
<%--            <c:if test="${page.prev}">--%>
<%--                <a href="${page.cri.pageNum - 1}">&laquo;</a>--%>
<%--            </c:if>--%>
<%--            <c:forEach begin="${page.startPage}"--%>
<%--                       end="${page.endPage}"--%>
<%--                       var="number">--%>
<%--                <a href="${number}">${number}</a>--%>
<%--            </c:forEach>--%>
<%--            <c:if test="${page.next}">--%>
<%--                <a href="${page.cri.pageNum + 1}">&raquo;</a>--%>
<%--            </c:if>--%>
        </div>
    </div>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
    <script>
        // window.addEventListener('load', function() {
        //     setTimeout(function() {
        //         document.querySelector('.semi_title').classList.add('fade-in');
        //     }, 500); // 0.5초 후 페이드인
        // });
        $(() => {
            $("#search-icon").on("click", (e) => {
                $("input[name='pageNum']").val(1);
                $("#search-form").submit();
            });

            $("input[name='searchKeyword']").on("keypress", (e) => {
                if(e.key === 'Enter') {
                    $("input[name='pageNum']").val(1);
                }
            });

            // $(".pagination a").on("click", (e) => {
            //     e.preventDefault();
            //
            //     // console.log($(e.target).attr("href"));
            //
            //     $("input[name='pageNum']").val($(e.target).attr("href"));
            //
            //     $("#search-form").submit();
            // });
            $(".pagination a").on("click", (e) => {
                e.preventDefault();
                let pageNum = $(e.target).attr("href").split('=')[1];
                $("input[name='pageNum']").val(pageNum);
                $("#search-form").submit();
            });
        });
    </script>
</body>
</html>
