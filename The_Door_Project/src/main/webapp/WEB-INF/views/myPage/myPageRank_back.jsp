<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        .content {
            flex-direction: column;
            align-items: center;
            margin: 0%;
            /* margin-top: 0.5vh; */
            text-align: center;
            width: 100%;

        }

        #extendHeaderImg {
            width: 100%;
            height: 30vh;
            /* object-fit: none; */
        }

        #profileArea {
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 30vh;
            margin-bottom: 4vh;
        }

        .profileImg, .profileAlertImg {
            height: 50%;
            margin-top: 5vh;
            margin-bottom: 1vh;
        }

        #selectArea {
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 10vh;
        }

        #selectArea ul {
            list-style: none;
            margin: 2vh 5vw;
            height: 5vh;
            border-bottom: 1px solid black;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #selectArea li {
            list-style: none;
            margin: 0 6vw 6vh;
            font-size: 25px;
        }
        #selectArea li a {
            text-decoration: none black;
        }
        #selectArea li a:link {
            color: black;
        }
        #selectArea li a:visited {
            color: black;
        }
        #selectArea li a:hover {
            font-weight: bold;
        }

      
      
        .ticket-container {
            display: flex;
            margin: 1vw auto 2.5vw;
            max-width: 1000px;
            width: 90%;
            font-weight: bold;
            height: 20vh; /* 원하는 높이로 설정 */
        }

        .ticket-left, .ticket-right {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 10px;
            border-radius: 15px;
        }

        .ticket-left {
            background-color: #000000d0;
            color: #fff;
            border-right-style: dotted;
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            margin-right: 1px;
            min-width: 150px;
            font-size: 22px;
            flex-shrink: 0; /* 크기가 줄어들지 않도록 설정 */
        }

        .ticket-right {
            background-color: #000000d0;
            color: #fff;
            border-top-right-radius: 12px;
            border-bottom-right-radius: 12px;
            flex: 1; /* 유연하게 크기가 조정되도록 설정 */
            font-size: 20px;
        }

        .ticket-header {
            display: flex;
            justify-content: left;
            align-items: center;
            width: 89%;
            padding: 10px 0px 15px 0px;
        }

        .ticket-header span {
            margin: 0 10px; /* 좌우에 10px 간격 추가 */
        }

        .ticket-content {
            background-color: #fff;
            color: #000;
            padding: 5px;
            border-radius: 10px;
            font-weight: normal;
            text-align: center;
            width: 85%; /* 유연하게 크기가 조정되도록 설정 */

        }
        

        
        .emphaFont{
            font-size: x-large;
            font-weight: bold;
        }
    </style>
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
                    <li><a href="myPagePost.jsp">내가 쓴 글</a></li>
                    <li><a href="myPageAlert.jsp">알림</a></li>
                </ul>
        </div>


        <div class="ticket-container">
            <div class="ticket-left">
                <span>더 호스텔</span>
            </div>
            <div class="ticket-right">
                <div class="ticket-header">
                    <span>클리어 타임</span>
                    <span>—</span>
                    <span>2024-07-10/19:11 :: 190분</span>
                </div>
                <div class="ticket-content">
                    <p>한 줄 코멘트 적는 공간 입니다.</p>
                </div>
            </div>
        </div>

        <div class="ticket-container">
            <div class="ticket-left">
                <span>502호</span>
            </div>
            <div class="ticket-right">
                <div class="ticket-header">
                    <span>클리어 타임</span>
                    <span>—</span>
                    <span>2024-07-10/19:11 :: 190분</span>
                </div>
                <div class="ticket-content">
                    <p>한 줄 코멘트 적는 공간 입니다.</p>
                </div>
            </div>
        </div>

        <div class="ticket-container">
            <div class="ticket-left">
                <span>로저스톤</span>
            </div>
            <div class="ticket-right">
                <div class="ticket-header">
                    <span>클리어 타임</span>
                    <span>—</span>
                    <span>2024-07-10/19:11 :: 190분</span>
                </div>
                <div class="ticket-content">
                    <p>한 줄 코멘트 적는 공간 입니다.</p>
                </div>
            </div>
        </div>

      
    </div>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>