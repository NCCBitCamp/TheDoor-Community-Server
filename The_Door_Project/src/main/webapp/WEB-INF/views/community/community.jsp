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
            <form class="form-inline">
                <!-- <div class="input-group"> -->
                <!-- <div class="input-group-prepend"> -->
                <div>
                    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">제목</button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">제목</a></li>
                        <li><a class="dropdown-item" href="#">작성자</a></li>
                    </ul>
                </div>
                <input class="form-control mr-sm-2" type="search" placeholder="검색" aria-label="Search">
                <div class="input-group-append">
                    <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">검색</button>
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
                <tr>
                    <td>1</td>
                    <td class="title"><a href="communityDetail.html">게시물 제목</a></td>
                    <td>작성자</td>
                    <td>2022.01.01</td>
                    <td>100</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td class="title"><a href="communityDetail.html">게시물 제목</a></td>
                    <td>작성자</td>
                    <td>2022.01.01</td>
                    <td>100</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td class="title"><a href="communityDetail.html">게시물 제목</a></td>
                    <td>작성자</td>
                    <td>2022.01.01</td>
                    <td>100</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td class="title"><a href="communityDetailhtml">게시물 제목</a></td>
                    <td>작성자</td>
                    <td>2022.01.01</td>
                    <td>100</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td class="title"><a href="communityDetail.html">게시물 제목</a></td>
                    <td>작성자</td>
                    <td>2022.01.01</td>
                    <td>100</td>
                </tr>
                <tr>
                    <td>6</td>
                    <td class="title"><a href="communityDetail.html">게시물 제목</a></td>
                    <td>작성자</td>
                    <td>2022.01.01</td>
                    <td>100</td>
                </tr>
                <tr>
                    <td>7</td>
                    <td class="title"><a href="communityDetail.html">게시물 제목</a></td>
                    <td>작성자</td>
                    <td>2022.01.01</td>
                    <td>100</td>
                </tr>
                <tr>
                    <td>8</td>
                    <td class="title"><a href="communityDetail.html">게시물 제목</a></td>
                    <td>작성자</td>
                    <td>2022.01.01</td>
                    <td>100</td>
                </tr>
                <tr>
                    <td>9</td>
                    <td class="title"><a href="communityDetail.html">게시물 제목</a></td>
                    <td>작성자</td>
                    <td>2022.01.01</td>
                    <td>100</td>
                </tr>
                <tr>
                    <td>10</td>
                    <td class="title"><a href="communityDetail.html">게시물 제목</a></td>
                    <td>작성자</td>
                    <td>2022.01.01</td>
                    <td>100</td>
                </tr>
                </tbody>
            </table>
            <br>
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
                <div class="post-container">
                    <button type="button" class="btn btn-outline-secondary" onclick="location.href='communityWrite.html'">글 등록</button>
                </div>
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
        document.addEventListener('DOMContentLoaded', function() {
            const navItems = document.querySelectorAll('.news-navbar .nav-item');
            const currentNav = document.querySelector('.current-nav span');

            navItems.forEach(item => {
                item.addEventListener('click', function() {
                    currentNav.textContent = this.textContent;
                });
            });
        });
    </script>

    <!-- Bootstrap JS 추가 -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
