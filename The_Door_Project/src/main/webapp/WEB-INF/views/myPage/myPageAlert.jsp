<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/myPage/myPageAlert.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>

    <div class="content">
        <div> <img src="${pageContext.request.contextPath}/static/images/extendHeaderImg.png" alt="theDoor" id="extendHeaderImg"></div>

        <div id="profileArea">
            <img src="${pageContext.request.contextPath}/static/images/myPage/profileImg.png" class="profileImg">

            <!-- profileAlertImg 이미지변경 함수처리가 안되고 알람있으면, 빨간불 들어오게 만들기 -->
            <!-- 이미지 사용자가 변경할 수 있도록 만들기 -->

            <p class="emphaFont">${personalInfo.nickname}</p>
        </div>

        <div id="selectArea">
            <ul>
                <li><a href="/myPage/info.do">개인정보</a></li>
                <li><a href="/myPage/rank.do">My 랭킹</a></li>
                <li><a href="/myPage/post.do">내가 쓴 글</a></li>
                <li><a href="/myPage/alert.do">알림</a></li>
            </ul>
        </div>

        <div id="alertInfo">
            <table class="infoTable">
                <thead>
                <tr>
                    <th style="width: 10%;">내 글</th>
                    <th style="width: 50%;">댓글 내용</th>
                    <th style="width: 10%;">댓글 작성자</th>
                    <th style="width: 10%;">등록 시간</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="comment" items="${comments}" varStatus="status">
                    <tr>
                        <td id="showMyWrite"><a href="/community/communityDetail.do?id=${comment.board_id}" style="color: black">${comment.title}</a></td>
                        <td><a href="/community/communityDetail.do?id=${comment.board_id}" style="color: black">${comment.content}</a></td>
                        <td>${comment.writer_id}</td>
<%--                        <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${convertedTime[status.index]}"/></td>--%>
<%--                        <td>--%>
<%--                            <javatime:format value="${comment.date}" pattern="yyyy-MM-dd hh:mm"/>--%>
<%--                        </td>--%>
                        <td data-date="${comment.date}">
                            <span class="relative-time"></span>
                        </td>
                    </tr>
                </c:forEach>
                <form id="paginationForm" action="${pageContext.request.contextPath}/myPage/alert.do" method="GET">
                    <input type="hidden" name="lastDate" value="${lastDate}" />
                    <input type="hidden" name="lastId" value="${lastId}" />
                </form>
                </tbody>
            </table>
        </div>



        <div>
            <!-- 페이지네이션 -->
            <nav aria-label="Page navigation" id="custom-pagination">
                <ul class="pagination justify-content-center">
                    <li class="page-item">
                        <a class="page-link" href="${pageContext.request.contextPath}/myPage/alert.do?pageNum=1" aria-label="Previous" onclick="fn_go_page(${page.startPage - 1})">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>

                    <c:forEach begin="${page.startPage}" end="${page.endPage}" var="pageNum">
                        <li class="page-item ${page.cri.pageNum == pageNum ? 'current-page' : ''}">
                            <a class="page-link" href="${pageContext.request.contextPath}/myPage/alert.do?pageNum=${pageNum}">${pageNum}</a>
                        </li>
                    </c:forEach>

                    <li class="page-item">
                        <a class="page-link" href="${pageContext.request.contextPath}/myPage/alert.do?pageNum=${page.endPage}" aria-label="Next" onclick="fn_go_page(${page.endPage + 1})">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>


    <!-- Bootstrap JS 추가 -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>
<script>
    // 현재 시간을 JavaScript Date 객체로 생성
    const now = new Date();

    function calculateRelativeTime(dateString) {
        const commentDate = new Date(dateString);
        const diffMs = now - commentDate;
        const diffMinutes = Math.floor(diffMs / (1000 * 60));
        const diffHours = Math.floor(diffMinutes / 60);
        const diffDays = Math.floor(diffHours / 24);
        const diffMonths = Math.floor(diffDays / 30);
        const diffYears = Math.floor(diffDays / 365);


        if (diffMinutes < 1) return "방금 전";
        if (diffMinutes < 60) return diffMinutes + "분 전";
        if (diffHours < 24) return diffHours + "시간 전";
        if (diffDays === 1) return "어제";
        if (diffDays < 7) return diffDays + "일 전";
        if (diffDays < 30) return diffDays / 7 + "주 전";
        if (diffDays < 365) return diffMonths + "달 전";
        return diffYears + "년 전";
    }

    $(document).ready(function() {
        $('.relative-time').each(function() {
            const date = $(this).closest('td').data('date');
            $(this).text(calculateRelativeTime(date));
        });
    });



    function fn_go_page(pageNum) {
        $.ajax({
            url: "/myPage/alert.do", // 서버의 엔드포인트 URL
            type: "GET",
            data: pageNum, // pageNum 서버로 전송
            success: function(response) {
                // 서버로부터 데이터를 받아서 테이블, 페이지네이션 업데이트
                var $response = $(response);
                var newContent = $response.find("#alertInfo").html();
                $("#alertInfo").html(newContent);

                var newPagination = $response.find("#custom-pagination").html();
                $("#custom-pagination").html(newPagination);

                console.log("pageNum", pageNum);
            },
            error: (err) => {
                console.log("err : ");
                console.log(err);
            }
        });
    }
</script>
</html>
