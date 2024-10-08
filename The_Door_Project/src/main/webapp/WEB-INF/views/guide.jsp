<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/guide.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" href="${pageContext.request.contextPath}/static/images/favicon.ico" type="image/x-icon">
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
    <div class="content">
        <div class="image-container">
            <img src="${pageContext.request.contextPath}/static/images/guide.png" alt="Guide">
            <a href="http://175.45.200.187:8180/" class="link-overlay link1"></a>
            <a href="https://youtu.be/iioHh2xaCEg" class="link-overlay link2"></a>
            <a href="https://youtu.be/iioHh2xaCEg" class="link-overlay link3"></a>
        </div>
    </div>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
</body>
</html>
