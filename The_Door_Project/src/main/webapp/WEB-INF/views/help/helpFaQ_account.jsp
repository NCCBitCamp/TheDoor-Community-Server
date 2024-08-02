<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/help/helpFaQ_account.css">
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
    <div class="logo_head_between_area_container">
        <img src="${pageContext.request.contextPath}/static/images/extendHeaderImg.png" alt="theDoor" id="extendHeaderImg">
    </div>

    <div class="head_area">
        <p class="head_area_title">계정관리 문제</p>
    </div>
    <div class="search_area">
        <input type="text" placeholder="검색어를 입력하세요"><button class="search_button">검색</button>
    </div>
    <div class="content">
        <div class="board">
            <h2></h2>
            <ul class="posts" id="postsList">
                <!-- 게시글이 여기에 추가됩니다 -->
                <li>
                    <div class="post-info">
                        <h3>오랫동안 접속하지 않았더니 계정이 사라졌어요</h3>
                        <p>다시 만드세요</p>
                        <span class="post-date">2024-07-18</span>
                    </div>
                    <div class="post-buttons">
                        <button>수정</button>
                        <button>삭제</button>
                    </div>
                </li>
            </ul>
        </div>
        <div class="pagination">
            <c:if test="${page.prev}">
                <a href="${page.cri.pageNum - 1}">&laquo;</a>
            </c:if>
            <c:forEach begin="${page.startPage}" end="${page.endPage}" var="number">
                <a href="${number}">${number}</a>
            </c:forEach>
            <c:if test="${page.next}">
                <a href="${page.cri.pageNum + 1}">&raquo;</a>
            </c:if>
        </div>
    </div>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
    <script>
        window.addEventListener('load', function() {
            setTimeout(function() {
                document.querySelector('.semi_title').classList.add('fade-in');
            }, 500); // 0.5초 후 페이드인
        });

        $(".pagination a").on("click", (e) => {
            e.preventDefault();
            let pageNum = $(e.target).attr("href");
            $("input[name='pageNum']").val(pageNum);
            $("#search-form").submit();
        });

    </script>
</body>
</html>
