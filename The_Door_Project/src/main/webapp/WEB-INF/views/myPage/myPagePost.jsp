<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/myPage/myPagePost.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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

        <div id="postInfo">
            <table class="infoTable">
                <thead>
                <tr>
                    <th style="width: 10%;">게시글 번호</th>
                    <th style="width: 50%;">제목</th>
                    <th style="width: 10%;">작성자</th>
                    <th style="width: 10%;">조회수</th>
                </tr>
                </thead>
                <tbody id="table-content">
                    <c:forEach var="contents" items="${myWrite}">
                        <tr>
                            <td>${contents.id}</td>
                            <td><a href="/myPage/info.do" style="color: black">${contents.title}</a></td>
                            <td>${contents.writer_id}</td>
                            <td>${contents.cnt}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>



        <div>
            <!-- 페이지네이션 -->
            <nav aria-label="Page navigation" id="custom-pagination">
                <ul class="pagination justify-content-center">
                    <li class="page-item">
                        <a class="page-link" href="${pageContext.request.contextPath}/myPage/post.do?pageNum=1" aria-label="Previous" onclick="fn_go_page(${page.startPage - 1})">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>

                    <c:forEach begin="${page.startPage}" end="${page.endPage}" var="pageNum">
                        <li class="page-item ${page.cri.pageNum == pageNum ? 'current-page' : ''}">
                            <a class="page-link" href="${pageContext.request.contextPath}/myPage/post.do?pageNum=${pageNum}">${pageNum}</a>
                        </li>
                    </c:forEach>

                    <li class="page-item">
                        <a class="page-link" href="${pageContext.request.contextPath}/myPage/post.do?pageNum=${page.endPage}" aria-label="Next" onclick="fn_go_page(${page.endPage + 1})">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>

    <!-- Bootstrap JS 추가 -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>

<script>

    function fn_go_page(pageNum) {
        $.ajax({
            url: "/myPage/post.do", // 서버의 엔드포인트 URL
            type: "post",
            data: ( pageNum: ${pageNum} ), // pageNum 서버로 전송
            success: function(response) {
                // 서버로부터 데이터를 받아서 테이블, 페이지네이션 업데이트
                var newContent = $(response).find("#table-content").html();
                $("#table-content").html(newContent);

                var newPagination = $(response).find("#custom-pagination").html();
                $("#custom-pagination").html(newPagination);
            },
            error: (err) => {
                console.log("err : ");
                console.log(err);
            }
        });
    }


</script>

</html>
