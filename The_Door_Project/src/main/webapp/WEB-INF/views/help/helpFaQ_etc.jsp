<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <p class="head_area_title">기타 문제</p>
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
                <li>
                    <div class="post-info">
                        <h3>제 계정이 중고거래 사이트에 올라갔는데 회수 가능할까요?</h3>
                        <p>될가요?</p>
                        <span class="post-date">2024-07-17</span>
                    </div>
                    <div class="post-buttons">
                        <button>수정</button>
                        <button>삭제</button>
                    </div>
                </li>
                <li>
                    <div class="post-info">
                        <h3>모르는 계정이 생겼어요!</h3>
                        <p>ㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋㅊㅋ</p>
                        <span class="post-date">2024-07-17</span>
                    </div>
                    <div class="post-buttons">
                        <button>수정</button>
                        <button>삭제</button>
                    </div>
                </li>
                <li>
                    <div class="post-info">
                        <h3>계정을 돈으로 주고 살 수 있나요?</h3>
                        <p>어디계신가요? 바로 가겠습니다</p>
                        <span class="post-date">2024-07-17</span>
                    </div>
                    <div class="post-buttons">
                        <button>수정</button>
                        <button>삭제</button>
                    </div>
                </li>
                <li>
                    <div class="post-info">
                        <h3>계정을 돈으로 주고 살 수 있나요?</h3>
                        <p>어디계신가요? 바로 가겠습니다</p>
                        <span class="post-date">2024-07-17</span>
                    </div>
                    <div class="post-buttons">
                        <button>수정</button>
                        <button>삭제</button>
                    </div>
                </li>
                <li>
                    <div class="post-info">
                        <h3>계정을 돈으로 주고 살 수 있나요?</h3>
                        <p>어디계신가요? 바로 가겠습니다</p>
                        <span class="post-date">2024-07-17</span>
                    </div>
                    <div class="post-buttons">
                        <button>수정</button>
                        <button>삭제</button>
                    </div>
                </li>
            </ul>
        </div>
        <div class="pagination">
            <a href="#">&laquo;</a>
            <a href="#">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            <a href="#">&raquo;</a>
        </div>
    </div>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
    <script>
        window.addEventListener('load', function() {
            setTimeout(function() {
                document.querySelector('.semi_title').classList.add('fade-in');
            }, 500); // 0.5초 후 페이드인
        });
    </script>
</body>
</html>
