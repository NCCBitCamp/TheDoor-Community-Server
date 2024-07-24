<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/myPageRank.css">
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>

    <div class="content">
        <div><img src="${pageContext.request.contextPath}/static/images/extendHeaderImg.png" alt="theDoor" id="extendHeaderImg"></div>

        <div id="profileArea">
            <img src="${pageContext.request.contextPath}/static/images/profileImg.png" class="profileImg">
            <p class="emphaFont">닉네임123</p>
        </div>

        <div id="selectArea">
            <ul>
                <li><a href="myPageInfo.html">개인정보</a></li>
                <li><a href="myPageRank.html">My 랭킹</a></li>
                <li><a href="myPagePost.jsp">내가 쓴 글</a></li>
                <li><a href="myPageAlert.jsp">알림</a></li>
            </ul>
        </div>

        <div class="ticket-container">
            <div class="ticket hostel_ticket" onclick="flipTicket(this)">
                <div class="ticket-content">
                    <p class="record">15위</p>
                    <p class="player">John Doe</p>
                    <p class="comment">Great game!</p>
                    <p class="date">24-07-10</p>
                    <p class="time">19:11</p>
                </div>
                <div class="ticket-back hostel_ticket-back"></div>
            </div>
        
            <div class="ticket bit_ticket" onclick="flipTicket(this)">
                <div class="ticket-content">
                    <p class="record">2위</p>
                    <p class="player">Jane Smith</p>
                    <p class="comment">Challenging!</p>
                    <p class="date">24-07-11</p>
                    <p class="time">20:15</p>
                </div>
                <div class="ticket-back bit_ticket-back"></div>
            </div>
        
            <div class="ticket rozer_ticket" onclick="flipTicket(this)">
                <div class="ticket-content">
                    <p class="record">20위</p>
                    <p class="player">Alice Brown</p>
                    <p class="comment">Exciting!</p>
                    <p class="date">24-07-12</p>
                    <p class="time">21:20</p>
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
