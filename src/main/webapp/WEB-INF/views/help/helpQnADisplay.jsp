<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/help/helpQnADisplay.css">
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
                마태림을 고발합니다
            </div>
            <div class="post-header">
                <div class="post-group">
                    <label for="author">작성자</label>
                    <p id="author">용감한시민</p>
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
                    <label for="answered">답변 완료 여부</label>
                    <p id="answered">X</p>
                </div>
                <div class="post-group">
                    <label for="views">조회수</label>
                    <p id="views">1234</p>
                </div>
            </div>
            <div class="post-group">
                <label for="content">내용</label>
                <div id="content" class="post-content">
                    2022.07.21 마태림은 정보처리산업기사 필기 시험을 광운공고에서 치루었다.
                    <br>이 시험을 위해서 금요일을 희생하여 이틀동안 불 같은 벼락치기를 한 결과 PASS를 받을 수 있었다.
                    <br>하지만 그 과정에서 프로젝트 안하고 팀을 버렸다는 비판을 피할 수는 없게 되었다.
                    <br>이에 마태림을 규탄하는 성명을 내려고 하는데 ㄱㅊ?
                    <br>아 배고파

                </div>
            </div>
            <div class="post-group">
                <label for="attachment">첨부된 파일</label>
                <p id="attachment" style="margin-top: 10px;"><a href="#">첨부파일 예시</a></p>
            </div>
            <div class="post-buttons">
                <a href="helpQnA.jsp"><button type="button" onclick="window.history.back();">뒤로가기</button></a>
            </div>
        </div>
    </div>
    <div class="content-bottom-gap"></div> <!-- 하단 여백 -->
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
</body>
</html>
