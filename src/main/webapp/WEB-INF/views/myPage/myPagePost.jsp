<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/myPagePost.css">
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>

    <div class="content">
        <div> <img src="${pageContext.request.contextPath}/static/images/extendHeaderImg.png" alt="theDoor" id="extendHeaderImg"></div>

        <div id="profileArea">
            <img src="${pageContext.request.contextPath}/static/images/profileImg.png" class="profileImg">

            <!-- profileAlertImg 이미지변경 함수처리가 안되고 알람있으면, 빨간불 들어오게 만들기 -->
            <!-- 이미지 사용자가 변경할 수 있도록 만들기 -->

            <p class="emphaFont">닉네임123</p>
        </div>

        <div id="selectArea">
            <ul>
                <li><a href="myPageInfo.html">개인정보</a></li>
                <li><a href="myPageRank.html">My 랭킹</a></li>
                <li><a href="myPagePost.html">내가 쓴 글</a></li>
                <li><a href="myPageAlert.html">알림</a></li>
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
                <tbody>
                <tr>
                    <td>35430</td>
                    <td>우리 팀 대 성공함... 프로젝트 자랑 보실?</td>
                    <td>닉네임123</td>
                    <td>456789</td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>14</td>
                    <td>요세하녕안</td>
                    <td>닉네임123</td>
                    <td>5234</td>
                </tr>
                </tbody>
            </table>
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
        </div>
    </div>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>

    <!-- Bootstrap JS 추가 -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
