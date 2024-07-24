<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/help/helpFAQDisplay.css">
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
    <div class="logo_head_between_area_container">
        <img src="${pageContext.request.contextPath}/static/images/extendHeaderImg.png" alt="theDoor" id="extendHeaderImg">
    </div>
    <div class="head_area">
        <p class="head_area_title"></p>
    </div>
    <div class="content-top-gap"></div> <!-- 상단 여백 -->
    <div class="content">
        <div class="post-container">
            <div class="post-title">
                팀을 버리고 정처기 시험공부를 하는 의문의 회전장인을 고발합니다.
            </div>
            <div class="post-header">
                <div class="post-group">
                    <label for="author">작성자</label>
                    <p id="author">bitcamp1</p>
                </div>
                <div class="post-group">
                    <label for="created_date">작성 날짜</label>
                    <p id="created_date">2024-07-22</p>
                </div>
                <div class="post-group">
                    <label for="modified_date">수정된 날짜</label>
                    <p id="modified_date">2024-07-22</p>
                </div>
                <div class="post-group">
                    <label for="views">조회수</label>
                    <p id="views">1234</p>
                </div>
            </div>
            <div class="post-group">
                <label for="content">질문</label>
                <div id="content" class="post-content">
                    우리를 버리고 정처기 공부를 하려는 안모씨를 규탄합니다
                </div>
            </div>
            <div class="post-group">
                <label for="content">답변</label>
                <div id="content" class="post-content">
                    에이 설마 팀에 정처기사 따려고 금요일날 휴가 내고 프젝 안하고 도망친 사람<br>
                    같은 사람이 또 있겠습니까?<br>
                    근데 할 거 다하고 하는 거라 할 말은 없긴 한데<br>
                    혹시 합법적으로 태클 걸 수 있는 방법은 없을까요?<br>
                    내공 20드립니다^^
                </div>
            </div>
            <div class="post-group">
                <label for="attachment">첨부된 파일</label>
                <p id="attachment" style="margin-top: 10px;"><a href="#">첨부파일 예시</a></p>
            </div>
            <div class="post-buttons">
                <a href="helpFaQ.jsp"><button type="button" onclick="window.history.back();">메뉴가기</button></a>
            </div>
        </div>
    </div>
    <div class="content-bottom-gap"></div> <!-- 하단 여백 -->
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
</body>
</html>
