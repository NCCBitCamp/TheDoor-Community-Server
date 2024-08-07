<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/news/news.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JS 추가 -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <link rel="icon" href="${pageContext.request.contextPath}/static/images/favicon.ico" type="image/x-icon">
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
    <div class="content">
        <!--헤더이미지-->
        <img src="${pageContext.request.contextPath}/static/images/extendHeaderImg.png" alt="theDoor" id="extendHeaderImg">

        <!-- 현재 선택된 뉴스 네비게이션과 검색창 -->
        <div class="search-container">
            <span class="current-nav">공지사항</span>
            <form class="form-inline" id="search-form" action="/news/news.do" method="post">
                <input type="hidden" name="pageNum" value="${page.cri.pageNum}">
                <input type="hidden" name="amount" value="${page.cri.amount}">
                <input type="hidden" name="endPage" value="${page.endPage}">
                <div>
                    <select class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" name="searchCondition" aria-haspopup="true" aria-expanded="false">
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

                <!--공지사항 검색 부분-->
                <input class="form-control mr-sm-2" type="text" name="searchKeyword" value="${searchMap.searchKeyword}" placeholder="검색" aria-label="Search">
                <div class="input-group-append">
                    <i class="bi bi-search" id="search-icon"></i>
                    <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit" id="btnSearch">검색</button>
                </div>
            </form>
        </div>
        <div>
            <c:if test="${loginMember ne null and loginMember.role eq 'ADMIN'}">
                <div class="post-container" id="postContainer">
                    <button type="button" class="btn btn-outline-secondary" onclick="location.href='/news/newsWrite.do'">공지사항 등록</button>
                </div>
            </c:if>
        </div>
        <!-- 게시글 목록 테이블 -->
        <div class="container mt-3 mb-5 w-75 card-wrapper">
            <c:forEach items="${newsList}" var="news">
                <div class="card" style="width: 18rem;">
                    <svg class="bd-placeholder-img card-img-top" width="100%" height="100" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <title></title>
                        <image href="${pageContext.request.contextPath}/static/images/newsbanner/notice.jpg" width="100%" height="100%"></image>
                    </svg>
                    <div class="card-body">
                        <h5 class="card-title">${news.title}</h5>
                        <p class="card-text">작성일:
                            <javatime:format value="${news.date}" pattern="yyyy-MM-dd"/>
                        </p>
                        <p class="card-writer">
                            관리자: ${news.nickname}
                        </p>
                        <a href="/news/updateCnt.do?id=${news.id}" class="btn btn-outline-secondary btn-sm" style="margin: 0px;">자세히 보기</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>

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

            const zeroDate = (date) => {
                return date < 10 ? `0\${date}` : date;
            }

            const makeImageElement = (file) => {
                console.log(file);
                if(typeof file != 'undefined' && file.filetype === 'image') {
                    return `<img class="bd-placeholder-img card-img-top" width="100%" height="180" src="/upload/\${file.filename}" alt=\${file.fileoriginname}>`
                }

                return `<svg class="bd-placeholder-img card-img-top" width="100%" height="100" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <title></title>
                        <image href="${pageContext.request.contextPath}/static/images/newsbanner/notice.jpg" width="100%" height="100%"></image>
                    </svg>`;
            }

            $(window).on("scroll", (e) => {
                // 현재 스크롤의 위치
                const scrollTop = $(window).scrollTop();
                // 브라우저의 세로길이(스크롤 길이는 포함되지 않음)
                const windowHeight = window.innerHeight;
                // 웹 문서의 세로 길이(스크롤 길이 포함됨)
                const documentHeight = document.documentElement.scrollHeight;

                // 스크롤이 바닥에 닿았는지 여부
                const isBottom = documentHeight <= scrollTop + windowHeight + 1;

                if(isBottom) {
                    // 현재 페이지의 번호가 마지막 페이지의 번호와 같으면 함수 종료
                    if($("input[name='pageNum']").val() >= $("input[name='endPage']").val()) {
                        return;
                    } else {
                        // 스크롤이 바닥에 닿으면 현재 페이지 번호 + 1
                        $("input[name='pageNum']").val(parseInt($("input[name='pageNum']").val()) + 1);

                        $.ajax({
                            url: '/news/news-ajax.do',
                            type: 'post',
                            data: $("#search-form").serialize(),
                            success: (obj) => {
                                console.log(obj);
                                let htmlStr = "";
                                for(let i = 0; i < obj.newsList.length; i++) {
                                    htmlStr += `
                                        <div class="card" style="width: 18rem;">
                                            \${makeImageElement(obj.newsList[i].boardDto.file)}
                                            <div class="card-body">
                                                <h5 class="card-title">\${obj.newsList[i].boardDto.title}</h5>
                                                <p class="card-text">작성일: \${obj.newsList[i].boardDto.date[0]}-\${zeroDate(obj.newsList[i].boardDto.date[1])}-\${zeroDate(obj.newsList[i].boardDto.date[2])}</p>
                                                <p class="card-writer">관리자: \${obj.newsList[i].boardDto.nickname}</p>
                                                <a href="/news/newsDetail.do?id=\${obj.newsList[i].boardDto.id}" class="btn btn-outline-secondary btn-sm">자세히 보기</a>
                                            </div>
                                        </div>
                                    `;
                                }
                                // console.log(htmlStr);
                                $(".card-wrapper").append(htmlStr);
                            },
                            error: (err) => {
                                console.log(err);
                            }
                        });
                    }
                }
            });
        });
    </script>


</body>
</html>
