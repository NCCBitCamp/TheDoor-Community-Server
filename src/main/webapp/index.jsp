<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="content">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active" style="background-image: url('${pageContext.request.contextPath}/static/images/index/carousel0.png');">
                </div>
                <div class="carousel-item" style="background-image: url('${pageContext.request.contextPath}/static/images/index/carousel1.png');">
                </div>
                <div class="carousel-item" style="background-image: url('${pageContext.request.contextPath}/static/images/index/carousel2.png');">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        <div class="container-fluid">
            <a href="WEB-INF/views/news/news.jsp" class="button">
                <img src="${pageContext.request.contextPath}/static/images/index/noticeBtn.png" alt="Image 1">
                <div class="overlay"></div>
            </a>
            <a href="WEB-INF/views/community/community.jsp" class="button">
                <img src="${pageContext.request.contextPath}/static/images/index/communityBtn.png" alt="Image 2">
                <div class="overlay"></div>
            </a>
            <a href="WEB-INF/views/help/help.jsp" class="button">
                <img src="${pageContext.request.contextPath}/static/images/index/helpBtn.png" alt="Image 3">
                <div class="overlay"></div>
            </a>
            <a href="WEB-INF/views/myPage/mypageInfo.jsp" class="button">
                <img src="${pageContext.request.contextPath}/static/images/index/myPageBtn.png" alt="Image 4">
                <div class="overlay"></div>
            </a>
        </div>

        <jsp:include page="footer.jsp"></jsp:include>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
