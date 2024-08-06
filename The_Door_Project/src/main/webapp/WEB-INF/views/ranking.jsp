<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<html>
<head>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/ranking.css">
    <link rel="icon" href="${pageContext.request.contextPath}/static/images/favicon.ico" type="image/x-icon">
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
    <div class="content">
        <img src="${pageContext.request.contextPath}/static/images/extendHeaderImg.png" alt="theDoor" id="extendHeaderImg">

        <div class="tabs nav nav-pills">
            <a class="tab nav-item nav-link active cursor-pointer" data-gametype="theHostel" role="button">The Hostel</a>
            <a class="tab nav-item nav-link cursor-pointer" data-gametype="bitCamp" role="button">Bitcamp</a>
            <a class="tab nav-item nav-link cursor-pointer" data-gametype="rozerStone" role="button">Rozer Stone</a>
        </div>
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead class="thead">
                <tr class="text-center">
                    <th style="width: 5%;">등수</th>
                    <th style="width: 15%;">아이디</th>
                    <th style="width: 60%;">남긴 메시지</th>
                    <th style="width: 10%;">기록</th>
                    <th style="width: 10%;">일자</th>
                </tr>
                </thead>
                <tbody id="table-content">
                <c:forEach items="${rankList}" var="rankBoard" varStatus="status">
                    <tr data-gametype="${rankBoard.gametype}">
                        <td>${startRank + status.index}</td>
                        <td>${rankBoard.nickname}</td>
                        <td>${rankBoard.comment}</td>
                        <td>${rankBoard.time}초</td>
                        <td>
                            <javatime:format value="${rankBoard.date}" pattern="yyyy-MM-dd"/>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <nav aria-label="Page navigation" id="custom-pagination">
            <ul class="pagination justify-content-center">
                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/main/ranking.do?gametype=${gametype}&pageNum=1" aria-label="first">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <c:forEach begin="${page.startPage}"
                           end="${page.endPage}"
                           var="number">
                    <li class="page-item ${page.cri.pageNum == number ? 'current-page' : ''}">
                        <a class="page-link" href="${pageContext.request.contextPath}/main/ranking.do?gametype=${gametype}&pageNum=${number}">${number}</a>
                    </li>
                </c:forEach>
                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/main/ranking.do?gametype=${gametype}&pageNum=${page.endPage}" aria-label="last">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>

    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function() {
            // 초기 상태: "The Hostel"이 선택된 상태
            loadContent("theHostel", 1);

            $(".tabs .tab").on("click", function(event) {
                event.preventDefault();
                // 모든 탭에서 active 클래스 제거
                $(".tabs .tab").removeClass("active");
                // 클릭한 탭에 active 클래스 추가
                $(this).addClass("active");

                // 클릭한 탭의 data-gametype 값 가져오기
                var gametype = $(this).data("gametype");
                loadContent(gametype, 1); // 페이지 번호를 1로 초기화하여 로드
            });

            // 페이지네이션 링크 클릭 이벤트 처리
            $(document).on("click", ".pagination a", function(event) {
                event.preventDefault();
                var href = $(this).attr("href");
                var params = new URLSearchParams(href.split('?')[1]);
                var pageNum = params.get("pageNum");
                var gametype = params.get("gametype");
                loadContent(gametype, pageNum);
            });
        });

        function loadContent(gametype, pageNum) {
            $.ajax({
                url: "${pageContext.request.contextPath}/main/ranking.do", // 서버의 엔드포인트 URL
                type: "GET",
                data: { gametype: gametype, pageNum: pageNum },
                success: function(response) {
                    // 서버로부터 데이터를 받아서 tbody 업데이트
                    var newContent = $(response).find("#table-content").html();
                    $("#table-content").html(newContent);

                    // 페이지네이션 업데이트
                    var newPagination = $(response).find("#custom-pagination").html();
                    $("#custom-pagination").html(newPagination);
                },
                error: function(xhr, status, error) {
                    console.log("Error loading content");
                    console.log(xhr.responseText);
                }
            });
        }
    </script>
</body>
</html>
