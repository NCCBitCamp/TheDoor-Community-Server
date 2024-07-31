<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
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
                    <label for="nickname">작성자</label>
                    <input type="text" id="nickname" name="nickname" value="${loginMember.nickname}" readonly required>
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
                <label for="uploadFiles">파일 첨부</label>
                <input type="file" id="uploadFiles" name="uploadFiles">
            </div>
            <div class="form-buttons">
                <button type="submit">작성완료</button>
                <a href="/helpboard/help-qna.do"><button type="button" onclick="window.history.back();">작성취소</button></a>
            </div>
        </div>
    </div>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
</body>

<script>
    // 추가된 파일들을 하나씩 담아줄 배열. File 객체가 저장
    const uploadFiles = [];

    $(() => {
        $("#uploadFiles").on("change", (e) => {
            // input에 추가된 파일들 변수로 받기
            const files = e.target.files;

            // 변수로 받아온 파일들 배열로 변환
            const fileArr = Array.prototype.slice.call(files);

            for(file of fileArr) {
                // 미리보기 메소드 호출
                imageLoader(file);
            }
        });

        // 폼이 서브밋될 때 uploadFiles 배열에 담겨있는 File 객체들을
        // input에 담아서 서브밋
        $("#post-form").on("submit", (e) => {
            let dataTransfer = new DataTransfer();

            for(i in uploadFiles) {
                const file = uploadFiles[i];
                dataTransfer.items.add(file);
            }

            $("#uploadFiles")[0].files = dataTransfer.files;
        });
    });

    // 미리보기 처리하는 메소드
    // 미리보기될 파일은 서버나 데이터베이스에 저장된 상태가 아니기 때문에
    // 파일 자체를 Base64 인코딩 방식으로 문자열로 변환해서 이미지로 호출해야 된다.
    // 이미지가 들어갈 태그 생성과 파일을 Base64 인코딩
    const imageLoader = (file) => {
        // 추가된 파일 uploadFiles 배열에 담기
        uploadFiles.push(file);

        let reader = new FileReader();

        // reader가 호출되면 실행될 이벤트 등록
        reader.onload = (e) => {
            // 이미지를 표출할 img 태그 생성
            let img = document.createElement("img");

            img.classList.add("upload-file");

            // 이미지인지 아닌지 판단
            if(file.name.toLowerCase().match(/(.*?)\.(jpg|jpeg|png|gif|svg|bmp)$/)) {
                img.src = e.target.result;
            } else {
                img.src = "/static/images/logo.png";
            }

            // 미리보기 영역에 추가
            // makeDiv 메소드를 호출해서 만들어진 div 자체를 preview 영역에 추가
            $("#preview").append(makeDiv(img, file));
        }

        // 파일을 Base64인코딩된 문자열로 로드
        // 이 메소드가 실행되면서 위에서 등록한 onload 이벤트가 함께 동작한다.
        reader.readAsDataURL(file);
    }

    // 미리보기 영역에 추가될 div를 생성하는 메소드
    const makeDiv = (img, file) => {
        let div = document.createElement("div");

        div.classList.add("upload-file-div");

        // 삭제 버튼 추가
        let btn = document.createElement("input");

        btn.classList.add("upload-file-delete-btn");

        btn.setAttribute("type", "button");
        btn.setAttribute("value", "x");
        // 사용자 정의 속성 추가
        btn.setAttribute("deleteFile", file.name);

        // x 버튼에 클릭했을 때 삭제하는 기능 추가
        btn.onclick = (e) => {
            // 클릭된 버튼 변수로 받기
            const element = e.target;

            const deleteFileName = element.getAttribute("deleteFile"); // helpQnADisplay.jsp에서 스크립트 추가

            // 배열에서 파일 삭제
            for(let i = 0; i < uploadFiles.length; i++) {
                if(deleteFileName === uploadFiles[i].name) {
                    uploadFiles.splice(i, 1);
                }
            }
            // uploadFiles.filter(((file, index) => file.name != deleteFileName || uploadFiles.indexOf(file) != index));

            // input에서도 파일 삭제
            // input type="file"은 첨부된 파일들을 fileList 형태로 관리
            // fileList는 File 객체에 바로 담을수 없기 때문에
            // DataTransfer라는 클래스를 사용해서 변환 후에 담아줘야한다.
            let dataTransfer = new DataTransfer();

            for(i in uploadFiles) {
                // uploadFiles 배열에 있는 File 객체를 하나씩 DataTransfer 객체에 담아준다.
                const file = uploadFiles[i];
                dataTransfer.items.add(file);
            }

            // input type="file"에 fileList 형태로 밀어넣기
            $("#uploadFiles")[0].files = dataTransfer.files;

            // 클릭된 btn 태그를 소유하고 있는 부모 div 태그 삭제
            const parentDiv = element.parentNode;
            $(parentDiv).remove();
        }

        // 파일 이름을 표출할 p 태그 생성
        let p = document.createElement("p");

        p.classList.add("upload-file-name");

        p.textContent = file.name;

        // div태그에 img, btn, p 태그 자식으로 추가
        div.appendChild(img);
        div.appendChild(btn);
        div.appendChild(p);

        return div;
    }

</script>
</html>
