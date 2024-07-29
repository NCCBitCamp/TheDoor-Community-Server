
// ----------- //
// 아이디 중복검사 //
// ----------- //
let idCheck = false;
let nicknameCheck = false;
let passwordCheck = false;
let usernameCheck = false;

$(() => {

    $("#user_id").on('blur', (e) => {

        // 공백 및 정규식 처리
        if ($("#user_id").val() === '' || !idPattern.test($("#user_id").val())) {
            idCheck = false;
            idDiv.style.border = '2px solid #fbc70e';
            idInput.style.color = '#fbc70e';
            idInput.placeholder = '아이디는 필수 정보입니다.';
            idInput.classList.add('errorPlaceholder');
            divMsg1.style.visibility = 'visible';
            liMsg1.textContent = '아이디는5~20자의 영문 소문자, 숫자만 사용 가능합니다.';
            return;
        }

        $.ajax({
            url: "/member/userIdCheck.do",
            type: "post",
            data: $("#join-form").serialize(),
            success: (map) => {

                if (map.userIdCheckNum === 0) {
                    idCheck = true;
                    divMsg1.style.visibility = 'hidden';
                    idDiv.style.border = '0px';
                    idInput.classList.remove('errorPlaceholder');
                    idInput.style.color = '#fff';
                    return;
                } else {
                    // 여기에 실패 조건 작성하기
                    idCheck = false;
                    divMsg1.style.visibility = 'visible';
                    idDiv.style.border = '2px solid #fbc70e';
                    idInput.style.color = '#fbc70e';
                    idInput.placeholder = '아이디는 필수 정보입니다.';
                    idInput.classList.add('errorPlaceholder');
                    liMsg1.textContent = '사용할 수 없는 아이디입니다.';
                }
            },
            error: (err) => {
                console.log(err);
            }
        });
    });

    $("#nickname").on('blur', (e) => {

        if ($("#nickname").val() === '' || !nicknamePattern.test($("#nickname").val())) {
            nicknameCheck = false;
            divMsg2.style.visibility = 'visible';
            nicknameInput.style.color = '#fbc70e';
            nicknameDiv.style.border = '2px solid #fbc70e';
            nicknameInput.placeholder = '닉네임은 필수 정보입니다.';
            nicknameInput.classList.add('errorPlaceholder');
            return;
        }

        $.ajax({
            url: "/member/nicknameCheck.do",
            type: "post",
            data: $("#join-form").serialize(),
            success: (map) => {

                if (map.nicknameCheckNum === 0) {
                    nicknameCheck = true;
                    nicknameDiv.style.border = '0px';
                    nicknameInput.classList.remove('errorPlaceholder');
                    nicknameInput.style.color = '#fff';
                    divMsg2.style.visibility = 'hidden';
                    return;
                } else {
                    // 여기에 실패 조건 작성하기
                    nicknameInput.style.color = '#fbc70e';
                    nicknameDiv.style.border = '2px solid #fbc70e';
                    nicknameInput.placeholder = '닉네임은 필수 정보입니다.';
                    nicknameInput.classList.add('errorPlaceholder');
                    divMsg2.style.visibility = 'visible';
                    nicknameCheck = false;
                }
            },
            error: (err) => {
                console.log(err);
            }
        });
    });

    $("#join-form").on("submit", (e) => {
        if (!idCheck || !nicknameCheck || !passwordCheck || !usernameCheck) {
            e.preventDefault();
            return;
        }
    });
});


// 비밀번호 숨김 및 표시
const eyeBtn = document.querySelector('#eyeBtn');
const pwInput = document.querySelector('#pw1');
const backImage = document.querySelector('.content');
const boxShadow = document.querySelector('.form-list');

let eyeKey = false;

eyeBtn.addEventListener('click', (e) => {
    if (!eyeKey) {
        pwInput.type = 'text';
        eyeBtn.style.backgroundImage = 'url("/static/images/member/showPassword.png")';
        backImage.style.backgroundImage = 'url("/static/images/member/loginBackground2.png")';
        boxShadow.style.boxShadow = '0px 0px 0px 0px';

        eyeKey = true;

    } else {
        pwInput.type = 'password';
        eyeBtn.style.backgroundImage = "url('/static/images/member/hidePassword.png')";
        backImage.style.backgroundImage = 'url("/static/images/member/loginBackground.png")';
        boxShadow.style.boxShadow = '0px 5px 5px 0px';
        eyeKey = false;
    }
});

//--------//
// 정규식 //
//--------//
const idPattern = /^[a-z0-9]{5,20}$/;
const pwPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/;
const namePattern = /^[가-힣a-zA-Z]{2,15}$/;
const nicknamePattern = /^[ㄱ-힣A-Za-z\d]{2,15}$/;
const birthdayPattern = /^(19[0-9][0-9]|20[0-9][0-9])(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])$/;

// input태그
const idInput = document.getElementById('user_id');
const pw1Input = document.getElementById('password');
const pw2Input = document.getElementById('pw2');
const nicknameInput = document.getElementById('nickname');
const emailInput = document.getElementById('email');
const nameInput = document.getElementById('username');
const birthdayInput = document.getElementById('birth');

// div박스
const idDiv = document.getElementById('divId');
const pw1Div = document.getElementById('divPw1');
const pw2Div = document.getElementById('divPw2');
const nicknameDiv = document.getElementById('divNickname');
const emailDiv = document.getElementById('divEmail');
const nameDiv = document.getElementById('divUsername');
const birthdayDiv = document.getElementById('divBirthday');
const divMsg1 = document.getElementById('divMsg1');
const divMsg2 = document.getElementById('divMsg2');
const liMsg1 = document.getElementById('liMsg1');
const liMsg2 = document.getElementById('liMsg2');

// ---------- //
// 아이디 메소드 //
// ---------- //
idInput.addEventListener('focus', idClick);

function idClick() {
    idDiv.style.border = '2px solid #ddd';
    idInput.style.color = '#fff';
    idInput.classList.remove('errorPlaceholder');
    idInput.placeholder = '아이디';
}

// ------------ //
// 패스워드 메소드  //
// ------------ //
pw1Input.addEventListener('focus', pw1Click);
pw1Input.addEventListener('blur', pw1Blur);
pw1Input.addEventListener('input', pw1Check);

function pw1Click() {
    pw1Div.style.border = '2px solid #ddd';
    pw1Input.style.color = '#fff';
    pw1Input.classList.remove('errorPlaceholder');
    pw1Input.placeholder = '8~16자의 영문, 숫자, 특수문자를 사용해 주세요.';
}

function pw1Blur() {
    const inputValue = this.value;

    if (pw1Input.value == '' || !pwPattern.test(inputValue)) {
        pw1Div.style.border = '2px solid #fbc70e';
        pw1Input.style.color = '#fbc70e';
        pw1Input.placeholder = '비밀번호는 필수 정보입니다.';
        pw1Input.classList.add('errorPlaceholder');
        divMsg2.style.visibility = 'visible';
        liMsg2.textContent = '비밀번호는 8~16자의 영문, 숫자, 특수문자를 사용해 주세요.';

        if (pw2Input.value != pw1Input.value && !pw2Input.value == '') {
            pw2Div.style.border = '2px solid #fbc70e';
            pw2Input.style.color = '#fbc70e';
            pw2Input.placeholder = '비밀번호를 확인해 주세요.';
            pw2Input.classList.add('errorPlaceholder');

        } else if (pw2Input.value == pw1Input.value && !pw1Input.value == ''
            && pwPattern.test(inputValue)) {
            pw2Div.style.border = '0px';
            pw2Input.classList.remove('errorPlaceholder');
            pw2Input.style.color = '#fff';
            divMsg2.style.visibility = 'hidden';
            liMsg2.textContent = '사용할 수 없는 닉네임입니다.';
        }
    }

    if (pwPattern.test(inputValue) || (pw2Input.value == pw1Input.value
        && !pw1Input.value == '' && pwPattern.test(inputValue))) {
        pw1Div.style.border = '0px';
        pw1Input.classList.remove('errorPlaceholder');
        pw1Input.style.color = '#fff';

        if (pw2Input.value != pw1Input.value && !pw2Input.value == '') {
            pw2Div.style.border = '2px solid #fbc70e';
            pw2Input.style.color = '#fbc70e';
            pw2Input.placeholder = '비밀번호를 확인해 주세요.';
            pw2Input.classList.add('errorPlaceholder');
        }
    }
}

function pw1Check() {
    const inputValue = this.value;

    // 정규식 맞을 때
    if (pwPattern.test(inputValue) && pw2Input.value == pw1Input.value) {
        pw1Div.style.border = '2px solid #ddd';
        pw1Input.classList.remove('errorPlaceholder');
        pw1Input.style.color = '#fff';

        pw2Div.style.border = '0px';
        pw2Input.classList.remove('errorPlaceholder');
        pw2Input.style.color = '#fff';

    }
}

// --------------- //
// 패스워드 확인 메소드 //
// --------------- //
pw2Input.addEventListener('focus', pw2Click);
pw2Input.addEventListener('blur', pw2Blur);
pw2Input.addEventListener('input', pw2Check);

function pw2Click() {
    pw2Div.style.border = '2px solid #ddd';
    pw2Input.style.color = '#fff';
    pw2Input.classList.remove('errorPlaceholder');
    pw2Input.placeholder = '8~16자의 영문, 숫자, 특수문자를 사용해 주세요.';
}

function pw2Blur() {
    const inputValue = this.value;

    // 공백과 정규식에 맞지 않는 값 처리
    if (pw2Input.value == '' || pw2Input.value != pw1Input.value
        || !pwPattern.test(inputValue)) {
        pw2Div.style.border = '2px solid #fbc70e';
        pw2Input.style.color = '#fbc70e';
        pw2Input.placeholder = '비밀번호를 확인해 주세요.';
        pw2Input.classList.add('errorPlaceholder');
        passwordCheck = false;
    }

    if (pw2Input.value == pw1Input.value && pwPattern.test(inputValue)) {
        pw2Div.style.border = '0px';
        pw2Input.classList.remove('errorPlaceholder');
        pw2Input.style.color = '#fff';
        divMsg2.style.visibility = 'hidden';
        liMsg2.textContent = '사용할 수 없는 닉네임입니다.';
        passwordCheck = true;
    }
}

function pw2Check() {
    const inputValue = this.value;

    // 비번 일치할 때
    if (pw2Input.value == pw1Input.value) {
        pw2Div.style.border = '0px';
        pw2Input.classList.remove('errorPlaceholder');
        pw2Input.style.color = '#fff';
        passwordCheck = true;
    }
}

// ---------- //
// 닉네임 메소드 //
// ---------- //
nicknameInput.addEventListener('focus', nicknameClick);

function nicknameClick() {
    nicknameDiv.style.border = '2px solid #ddd';
    nicknameInput.style.color = '#fff';
    nicknameInput.classList.remove('errorPlaceholder');
    nicknameInput.placeholder = '닉네임';
    liMsg2.textContent = '사용할 수 없는 닉네임입니다.';
}

// ---------- //
// 이메일 메소드 //
// ---------- //
emailInput.addEventListener('focus', emailClick);
emailInput.addEventListener('blur', emailBlur);

function emailClick() {
    emailDiv.style.border = '2px solid #ddd';
    emailInput.style.color = '#fff';
    emailInput.classList.remove('errorPlaceholder');
    emailInput.placeholder = '이메일주소';
}

function emailBlur() {
    const inputValue = this.value;

    if (emailInput.value == '') {
        emailDiv.style.border = '0px';
    } else {
        emailDiv.style.border = '0px';
    }
}


// ---------- //
//  이름 메소드  //
// ---------- //
nameInput.addEventListener('focus', nameClick);
nameInput.addEventListener('blur', nameBlur);

function nameClick() {
    nameDiv.style.border = '2px solid #ddd';
    nameInput.style.color = '#fff';
    nameInput.classList.remove('errorPlaceholder');
    nameInput.placeholder = '이름';
}

function nameBlur() {
    const inputValue = this.value;

    if (namePattern.test(inputValue)) {
        nameDiv.style.border = '0px';
        nameInput.classList.remove('errorPlaceholder');
        nameInput.style.color = '#fff';
        usernameCheck = true;


    } else {
        nameDiv.style.border = '2px solid #fbc70e';
        nameInput.style.color = '#fbc70e';
        nameInput.placeholder = '이름은 필수 정보입니다.';
        nameInput.classList.add('errorPlaceholder');
        usernameCheck = false;

    }
}


// ----------- //
// 생년월일 메소드 //
// ----------- //
birthdayInput.addEventListener('focus', birthdayClick);
birthdayInput.addEventListener('blur', birthdayBlur);

function birthdayClick() {
    birthdayDiv.style.border = '2px solid #ddd';
    birthdayInput.style.color = '#fff';
    birthdayInput.classList.remove('errorPlaceholder');
    birthdayInput.placeholder = '생년월일 8자리';
}

function birthdayBlur() {
    const inputValue = this.value;

    if (birthdayPattern.test(inputValue)) {
        birthdayDiv.style.border = '0px';
    } else {
        birthdayDiv.style.border = '2px solid #fbc70e';
        birthdayInput.style.color = '#fbc70e';
        birthdayInput.placeholder = '생년월일은 8자리 숫자로 입력해 주세요.';
        birthdayInput.classList.add('errorPlaceholder');
    }
}

