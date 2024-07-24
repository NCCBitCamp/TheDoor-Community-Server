<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/news/news.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
    <div class="content">
        <!--헤더이미지-->
        <img src="${pageContext.request.contextPath}/static/images/extendHeaderImg.png" alt="theDoor" id="extendHeaderImg">

        <!-- 현재 선택된 뉴스 네비게이션과 검색창 -->
        <div class="search-container">
            <span class="current-nav">전체공지</span>
            <form class="form-inline">
                <div>
                    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">제목</button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">제목</a></li>
                        <li><a class="dropdown-item" href="#">작성자</a></li>
                    </ul>
                </div>
                <input class="form-control mr-sm-2" type="search" placeholder="검색" aria-label="Search">
                <div class="input-group-append">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
                </div>
            </form>
        </div>

        <!-- 게시글 목록 테이블 -->
        <div class="container mt-3 mb-5 w-75 card-wrapper">
            <div class="card" style="width: 18rem;">
                <svg class="bd-placeholder-img card-img-top" width="100%" height="180" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"></rect></svg>
                <div class="card-body">
                    <h5 class="card-title">공지사항</h5>
                    <p class="card-text">작성일: yyyy-MM-dd</p>
                    <a href="newsDetail.html" class="btn btn-outline-secondary btn-sm">자세히 보기</a>
                </div>
            </div>
            <div class="card" style="width: 18rem;">
                <svg class="bd-placeholder-img card-img-top" width="100%" height="180" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"></rect></svg>
                <div class="card-body">
                    <h5 class="card-title">공지사항</h5>
                    <p class="card-text">작성일: yyyy-MM-dd</p>
                    <a href="newsDetail.html" class="btn btn-outline-secondary btn-sm">자세히 보기</a>
                </div>
            </div>
            <div class="card" style="width: 18rem;">
                <svg class="bd-placeholder-img card-img-top" width="100%" height="180" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"></rect></svg>
                <div class="card-body">
                    <h5 class="card-title">공지사항</h5>
                    <p class="card-text">작성일: yyyy-MM-dd</p>
                    <a href="newsDetail.html" class="btn btn-outline-secondary btn-sm">자세히 보기</a>
                </div>
            </div>
            <div class="card" style="width: 18rem;">
                <svg class="bd-placeholder-img card-img-top" width="100%" height="180" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"></rect></svg>
                <div class="card-body">
                    <h5 class="card-title">공지사항</h5>
                    <p class="card-text">작성일: yyyy-MM-dd</p>
                    <a href="newsDetail.html" class="btn btn-outline-secondary btn-sm">자세히 보기</a>
                </div>
            </div>
            <div class="card" style="width: 18rem;">
                <svg class="bd-placeholder-img card-img-top" width="100%" height="180" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"></rect></svg>
                <div class="card-body">
                    <h5 class="card-title">공지사항</h5>
                    <p class="card-text">작성일: yyyy-MM-dd</p>
                    <a href="newsDetail.html" class="btn btn-outline-secondary btn-sm">자세히 보기</a>
                </div>
            </div>
            <div class="card" style="width: 18rem;">
                <svg class="bd-placeholder-img card-img-top" width="100%" height="180" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"></rect></svg>
                <div class="card-body">
                    <h5 class="card-title">공지사항</h5>
                    <p class="card-text">작성일: yyyy-MM-dd</p>
                    <a href="newsDetail.html" class="btn btn-outline-secondary btn-sm">자세히 보기</a>
                </div>
            </div>
            <div class="card" style="width: 18rem;">
                <svg class="bd-placeholder-img card-img-top" width="100%" height="180" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"></rect></svg>
                <div class="card-body">
                    <h5 class="card-title">공지사항</h5>
                    <p class="card-text">작성일: yyyy-MM-dd</p>
                    <a href="newsDetail.html" class="btn btn-outline-secondary btn-sm">자세히 보기</a>
                </div>
            </div>
            <div class="card" style="width: 18rem;">
                <svg class="bd-placeholder-img card-img-top" width="100%" height="180" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"></rect></svg>
                <div class="card-body">
                    <h5 class="card-title">공지사항</h5>
                    <p class="card-text">작성일: yyyy-MM-dd</p>
                    <a href="newsDetail.html" class="btn btn-outline-secondary btn-sm">자세히 보기</a>
                </div>
            </div>
            <div class="card" style="width: 18rem;">
                <svg class="bd-placeholder-img card-img-top" width="100%" height="180" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"></rect></svg>
                <div class="card-body">
                    <h5 class="card-title">공지사항</h5>
                    <p class="card-text">작성일: yyyy-MM-dd</p>
                    <a href="newsDetail.html" class="btn btn-outline-secondary btn-sm">자세히 보기</a>
                </div>
            </div>
        </div>

        <div>
            <!-- 페이지네이션 -->
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">6</a></li>
                    <li class="page-item"><a class="page-link" href="#">7</a></li>
                    <li class="page-item"><a class="page-link" href="#">8</a></li>
                    <li class="page-item"><a class="page-link" href="#">9</a></li>
                    <li class="page-item"><a class="page-link" href="#">10</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
            <div class="post-container" id="postContainer">
                <button type="button" class="btn btn-outline-secondary" onclick="location.href='newsWrite.html'">공지사항 등록</button>
            </div>
        </div>
    </div>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>

    <!-- JavaScript 추가 -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const isAdmin = true; // 관리자 여부를 확인하는 변수 (예: 서버에서 받아온 값으로 설정)
            const postContainer = document.getElementById('postContainer');

            if (!isAdmin) {
                postContainer.style.display = 'none';
            }
        });
    </script>

    <!-- Bootstrap JS 추가 -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
