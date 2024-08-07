const eyeBtn = document.querySelector('#pwBtn');
const pwInput = document.querySelector('#password');
const backImage = document.querySelector('.content');
const loginColor = document.querySelector('.loginbtn');
const loginBox = document.querySelector('#loginBox');
const createBox = document.querySelector('.createBtn');

let eyeKey = false;

eyeBtn.addEventListener('click', (e) => {
    if (!eyeKey) {
        pwInput.type = 'text';
        eyeBtn.style.backgroundImage = 'url("/static/images/member/showPassword.png")';
        backImage.style.backgroundImage = 'url("/static/images/member/loginBackground2.png")';
        // loginColor.style.backgroundColor = '#6e5f25';
        loginBox.style.boxShadow = '0px 0px 0px 0px';
        createBox.style.boxShadow = '0px 0px 0px 0px black';
        eyeKey = true;

    } else {
        pwInput.type = 'password';
        eyeBtn.style.backgroundImage = "url('/static/images/member/hidePassword.png')";
        backImage.style.backgroundImage = 'url("/static/images/member/loginBackground.png")';
        // loginColor.style.backgroundColor = '#FBC70E';
        loginBox.style.boxShadow = '0px 4px 4px 0px';
        createBox.style.boxShadow = '0.5px 3.5px 3px 0.5px black';

        eyeKey = false;
    }
});

$(() => {
    if($("#loginFailMsg").val() === 'idNotExist') {
        alert("가입되지 않은 사용자입니다.");
    } else if($("#loginFailMsg").val() === 'wrongPassword') {
        alert("잘못된 비밀번호입니다.");
    }
});