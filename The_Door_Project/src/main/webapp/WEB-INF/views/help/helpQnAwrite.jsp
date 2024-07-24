<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/help/helpQnAwrite.css">
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
    <div class="logo_head_between_area_container">
        <img src="${pageContext.request.contextPath}/static/images/extendHeaderImg.png" alt="theDoor" id="extendHeaderImg">
    </div>
    <div class="head_area">
        <p class="head_area_title"><p></p>   </p>
    </div>
    <div class="content">
        <div class="form-container">
            <div class="form-group" style="display: flex; justify-content: space-between;">
                <div style="flex: 1; margin-right: 10px;">
                    <label for="author">작성자</label>
                    <input type="text" id="author" name="author">
                </div>
                <div style="flex: 1; margin-left: 10px;">
                    <label for="topic" >주제 선택</label>
                    <select id="topic" name="topic" style="font-size: small;">
                        <option value="account" style="font-size: small;">계정문제</option>
                        <option value="payment" style="font-size: small;">결제문제</option>
                        <option value="other" style="font-size: small;">기타</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" id="title" name="title">
            </div>
            <div class="form-group">
                <label>
                    <input type="checkbox" id="public" name="public"> 공개 여부
                </label>
            </div>
            <div class="form-group">
                <label for="content">내용</label>
                <textarea id="content" name="content"></textarea>
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password">
            </div>
            <div class="form-group">
                <label for="file">파일 첨부</label>
                <input type="file" id="file" name="file">
            </div>
            <div class="form-buttons">
                <button type="submit">작성완료</button>
                <a href="helpQnA.jsp"><button type="button" onclick="window.history.back();">작성취소</button></a>
            </div>
        </div>
    </div>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
</body>
</html>
