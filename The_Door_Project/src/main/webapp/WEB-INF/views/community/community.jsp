<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/community/community.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
    <div class="content">
        <!--헤더이미지-->
        <img src="${pageContext.request.contextPath}/static/images/extendHeaderImg.png" alt="theDoor" id="extendHeaderImg">

        <!-- 현재 선택된 뉴스 네비게이션과 검색창 -->
        <div class="search-container">
            <span class="current-nav">자유게시판</span>
            <form class="form-inline" id="search-form" action="/community/community-list.do" method="post">
                <input type="hidden" name="pageNum" value="${page.cri.pageNum}">
                <input type="hidden" name="amount" value="${page.cri.amount}">
                <div>
                    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">제목</button>
                    <select class="form-select" name="searchCondition">
                        <option value="all"
                                <c:if test="${searchMap == null || searchMap.searchCondition == 'all'}">
                                    selected
                                </c:if>>전체</option>
                        <option value="title"
                                <c:if test="${searchMap.searchCondition == 'title'}">
                                    selected
                                </c:if>>제목</option>
                        <option value="content"
                                <c:if test="${searchMap.searchCondition == 'content'}">
                                    selected
                                </c:if>>내용</option>
                        <option value="writer"
                                <c:if test="${searchMap.searchCondition == 'writer'}">
                                    selected
                                </c:if>>작성자</option>
                    </select>
                </div>
                <input class="form-control mr-sm-2" type="text" name="searchKeyword" value="${searchMap.searchKeyword}" placeholder="검색" aria-label="Search">
                <div class="input-group-append">
                    <i class="bi bi-search" id="search-icon"></i>
                    <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit" id="btnSearch">검색</button>
                </div>
                <!-- </div> -->
            </form>
        </div>


        <!-- 게시글 목록 테이블 -->
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead class="thead">
                <tr>
                    <th style="width: 6%;">No</th>
                    <th style="width: 60%;">제목</th>
                    <th style="width: 10%;">작성자</th>
                    <th style="width: 10%;">작성일자</th>
                    <th style="width: 10%;">조회수</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${communityList}" var="community">
                        <tr onclick="location.href='/board/update-cnt.do?id=${community.id}&type=community'">
                            <td>{community.id</td>
                            <td class="title"><a href="/board/free-detail.do">${community.title}</a></td>
                            <td>{community.nickname}</td>
                            <td>
                                <javatime:format value="${community.date}" pattern="yyyy-MM-dd"/>
                            </td>
                            <td>${community.cnt}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <c:if test="${loginMember ne null}">
                <div class="post-container">
                    <button type="button" class="btn btn-outline-secondary" onclick="location.href='/community/communityWrite.do'">글 등록</button>
                </div>
            </c:if>
            <br>
            <div>

                <!-- 페이지네이션 -->
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <c:if test="${page.prev}">
                            <li class="page-item">
                                <a class="page-link" href="${page.cri.pageNum - 1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <c:forEach begin="#{page.startpage}"
                                   end="#{page.endpage}"
                                   var="number">
                            <li class="page-item">
                                <a class="page-link link-secondary" href="${number}">${number}</a>
                            </li>
                        </c:forEach>

                        <c:if test="${page.next}">
                            <li class="page-item">
                                <a class="page-link" href="${page.cri.pageNum + 1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="footer">
            <div class="footer-content">
                <a href="https://general-pet-cfa.notion.site/2-76644680bfca465e854f0e78a85e3630?pvs=4">
                    <p>더 도어 게임즈가 궁금하신가요?</p>
                </a>
                <p>©The Door Games</p>
            </div>
        </div>
    </div>

    <!-- JavaScript 추가 -->
    <script>
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

            $(".pagination a").on("click", (e) => {
                e.preventDefault();

                // console.log($(e.target).attr("href"));

                $("input[name='pageNum']").val($(e.target).attr("href"));

                $("#search-form").submit();
            });
        });
    </script>

    <!-- Bootstrap JS 추가 -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
