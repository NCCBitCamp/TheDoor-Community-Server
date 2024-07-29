<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/myPage/myPageRank.css">
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>

    <div class="content">
        <div><img src="${pageContext.request.contextPath}/static/images/extendHeaderImg.png" alt="theDoor" id="extendHeaderImg"></div>

        <div id="profileArea">
            <img src="${pageContext.request.contextPath}/static/images/myPage/profileImg.png" class="profileImg">
            <p class="emphaFont">${loginMember.nickname}</p>
        </div>

        <div id="selectArea">
            <ul>
                <li><a href="/myPage/info.do">개인정보</a></li>
                <li><a href="/myPage/rank.do">My 랭킹</a></li>
                <li><a href="/myPage/post.do">내가 쓴 글</a></li>
                <li><a href="/myPage/alert.do">알림</a></li>
            </ul>
        </div>

        <div class="ticket-container">
            <div class="ticket hostel_ticket" onclick="flipTicket(this)">
                <div class="ticket-content">
                    <p class="record">${myTopRanktheHostel.rank+1}위</p>
                    <p class="player">${myTopRanktheHostel.nickname}</p>
                    <p class="comment">${myTopRanktheHostel.comment}</p>
                    <c:set var="originalDateTime" value="${myTopRanktheHostel.date}" />
                    <c:set var="dateOnly" value="${fn:substringBefore(originalDateTime, 'T')}" />
                    <c:set var="formattedDate" value="${fn:replace(dateOnly, '-', '-')}" />
                    <c:set var="shortYear" value="${fn:substring(formattedDate, 2, 10)}" />
                    <p class="date">${shortYear}</p>
                    <p class="time">${myTopRanktheHostel.time}</p>
                </div>
                <div class="ticket-back hostel_ticket-back"></div>
            </div>
        
            <div class="ticket bit_ticket" onclick="flipTicket(this)">
                <div class="ticket-content">
                    <p class="record">${myTopRankbitCamp.rank+1}위</p>
                    <p class="player">${myTopRankbitCamp.nickname}</p>
                    <p class="comment">${myTopRankbitCamp.comment}</p>
                    <c:set var="originalDateTime" value="${myTopRankbitCamp.date}" />
                    <c:set var="dateOnly" value="${fn:substringBefore(originalDateTime, 'T')}" />
                    <c:set var="formattedDate" value="${fn:replace(dateOnly, '-', '-')}" />
                    <c:set var="shortYear" value="${fn:substring(formattedDate, 2, 10)}" />
                    <p class="date">${shortYear}</p>
                    <p class="time">${myTopRankbitCamp.time}</p>
                </div>
                <div class="ticket-back bit_ticket-back"></div>
            </div>
        
            <div class="ticket rozer_ticket" onclick="flipTicket(this)">
                <div class="ticket-content">
                    <p class="record">${myTopRankrozerStone.rank+1}위</p>
                    <p class="player">${myTopRankrozerStone.nickname}</p>
                    <p class="comment">${myTopRankrozerStone.comment}</p>
                    <c:set var="originalDateTime" value="${myTopRankrozerStone.date}" />
                    <c:set var="dateOnly" value="${fn:substringBefore(originalDateTime, 'T')}" />
                    <c:set var="formattedDate" value="${fn:replace(dateOnly, '-', '-')}" />
                    <c:set var="shortYear" value="${fn:substring(formattedDate, 2, 10)}" />
                    <p class="date">${shortYear}</p>
                    <p class="time">${myTopRankrozerStone.time}</p>
                </div>
                <div class="ticket-back rozer_ticket-back"></div>
            </div>
        </div>  
    </div>

    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function flipTicket(element) {
            const content = element.querySelector('.ticket-content');
            const back = element.querySelector('.ticket-back');
            if (back.style.display === 'none' || back.style.display === '') {
                content.style.display = 'none';
                back.style.display = 'block';
            } else {
                content.style.display = 'block';
                back.style.display = 'none';
            }
        }
    </script>
</body>
</html>
