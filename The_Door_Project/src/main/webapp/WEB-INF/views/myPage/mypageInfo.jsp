<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/myPageInfo.css">
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
    <div class="content">
        <img src="${pageContext.request.contextPath}/static/images/extendHeaderImg.png" alt="theDoor" id="extendHeaderImg">
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

            <div id="userInfo">            
                <div class="old">
                    <legend class="emphaFont">기존정보</legend>
                    <hr>
                    <br>
                    <div>
                        <label for="fixUserId">아이디</label>
                        <p></p>
                        <input class="fixedUserInfo" id="fixUserId" type="text" value="백앤드로 데이터 받아 고정하기" readonly>
                    </div>
                    <div>
                        <label for="fixUserName">이름</label>
                        <p></p>
                        <input class="fixedUserInfo" id="fixUserName" type="text" value="백앤드로 데이터 받아 고정하기" readonly>
                    </div>
                    <div>
                        <label for="fixUserEmail">이메일</label>
                        <p></p>
                        <input class="fixedUserInfo" id="fixUserEmail" type="text" value="백앤드로 데이터 받아 고정하기" readonly>
                    </div>
                    <div>
                        <label for="fixUserNick">닉네임</label>
                        <p></p>
                        <input class="fixedUserInfo" id="fixUserNick" type="text" value="백앤드로 데이터 받아 고정하기" readonly>
                    </div>
                    <div>
                        <label for="fixUserBirth">생년월일</label>
                        <p></p>
                        <input class="fixedUserInfo" id="fixUserBirth" type="text" value="백앤드로 데이터 받아 고정하기" readonly>
                    </div>
                </div>

                <div class="new">
                    <legend class="emphaFont">회원정보 변경</legend>
                    <hr>
                    <br>
                    <form action="#" method="post">
                        <div>
                            <label for="newPW">비밀번호</label><br>
                            <p></p>
                            <input id="newPW" type="text">
                        </div>
                        <div>
                            <label for="newPWCK">비밀번호 재입력</label><br>
                            <p></p>
                            <input id="newPWCK" type="text">
                        </div>
                        <div>
                            <label for="userEmail">이메일</label><br>
                            <p></p>
                            <input id="userEmail" type="email">
                        </div>
                        <div>
                            <label for="userNickName">닉네임</label><br>
                            <p></p>
                            <input id="userNickName" type="text">
                        </div>
                        <br>
                        <br>
                        <div>
                            <input type="submit" value="변경하기" style="background-color: black; color: white; font-weight: bold;">
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>

</body>
</html>
