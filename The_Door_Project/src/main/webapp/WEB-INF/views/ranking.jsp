<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<html>
<head>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/ranking.css">
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
    <div class="content">
        <!--헤더이미지-->
        <img src="${pageContext.request.contextPath}/static/images/extendHeaderImg.png" alt="theDoor" id="extendHeaderImg">

        <div class="tabs nav nav-pills">
            <a class="tab nav-item nav-link" href="#">The Hostel</a>
            <a class="tab nav-item nav-link" href="#">Bitcamp</a>
            <a class="tab nav-item nav-link" href="#">Rozer Stone</a>
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
                <tbody>
                <c:forEach items="${rankList}" var="rankBoard" varStatus="status">
                    <tr>
                        <td>${status.count}</td>
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
                    <a class="page-link" href="${page.startPage}" aria-label="first">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <c:forEach begin="${page.startPage}"
                           end="${page.endPage}"
                           var="number">
                    <li class="page-item ${page.cri.pageNum == number ? 'current-page' : ''}">
                        <a class="page-link" href="${number}">${number}</a>
                    </li>
                </c:forEach>
                <li class="page-item">
                    <a class="page-link" href="${page.endPage}" aria-label="last">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>

    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        var amount = "${page.cri.amount}";
        $(".pagination a").on("click", function(e) {
            e.preventDefault();
            var pageNum = $(this).attr("href");
            window.location.href = "/main/ranking.do?pageNum=" + pageNum + "&amount=" + amount;
        });
    </script>
    </body>
</html>
