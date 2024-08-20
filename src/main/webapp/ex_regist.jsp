<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문ture Registration</title>
    <style>
        @font-face {
            font-family: 'goorm-sans-code';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2408@1.0/goorm-sans-code.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }
        .regist-body {
            background-color: rgb(138, 35, 15);
            font-family: 'goorm-sans-code', Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 1200px;
            margin: 0;
            overflow-y: auto;
        }
        .regist-form {
            width: 600px;
            background-color: rgb(255, 255, 255);
            border-radius: 8px;
            border: 1px solid rgb(238, 238, 238);
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            box-sizing: border-box;
        }
        .regist-form div {
            margin-bottom: 15px;
            display: flex;
            flex-direction: column;
        }
        .regist-form div label {
            font-weight: bold;
            margin-bottom: 5px;
        }
        .regist-form input[type="text"],
        .regist-form input[type="password"],
        .regist-form input[type="file"],
        .regist-form textarea,
        .regist-form select {
            width: 100%;
            padding: 8px;
            border: 1px solid rgb(200, 200, 200);
            border-radius: 4px;
            box-sizing: border-box;
        }
        .regist-form input[type="file"] {
            padding: 4px;
            border: none;
            background-color: #f8f8f8;
        }
        .regist-form button,
        .regist-form input[type="button"] {
            padding: 10px 15px;
            border: none;
            background-color: #007bff;
            color: white;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        .regist-form button:hover,
        .regist-form input[type="button"]:hover {
            background-color: #0056b3;
        }
        .regist-form input[type="radio"] {
            margin-right: 5px;
        }
        .regist-form input[type="radio"] + label {
            margin-right: 15px;
        }
        .regist-form .inline-container {
            display: flex;
            flex-direction: column;
            margin-bottom: 0; /* Remove bottom margin to avoid extra space */
        }
        .regist-form .inline-container input[type="text"] {
            margin-right: 0;
            margin-bottom: 15px;
        }
        .regist-form .inline-container .check-button {
            margin-top: 0; /* Adjust margin */
        }
        .regist-form .radio-group {
            display: flex;
            align-items: center;
            flex-wrap: wrap;
            font-size: 14px; /* Reduce font size */
        }
        .regist-form .radio-group input[type="radio"] {
            margin-right: 5px;
        }
        .regist-form .radio-group label {
            margin-right: 15px;
        }
        .regist-form .submit-button {
            text-align: center;
        }
        .regist-form .form-title {
            text-align: center; 
            font-size: 24px;
            margin-bottom: 20px;
            font-weight: bold;
        }
    </style>
</head>
<body class="regist-body">
    <div class="regist-form">
        <div class="form-title">회원가입(Register)</div>
        <form action="ex_regist_insert.jsp" id="registration-form" name="registform" method="post" enctype="multipart/form-data">
            <div>
                <label for="id">*아이디</label>
                <input type="text" id="id" name="id" placeholder="Please enter your ID :)">
            </div>
            <div class="check-button">
                <input type="button" onclick="fnDuplicate()" value="중복확인">
            </div>
            <div>
                <label for="password">*비밀번호</label>
                <input type="password" id="password" name="pwd" placeholder="Password">
            </div>
            <div>
                <label for="confirm-password">*비밀번호 확인</label>
                <input type="password" id="confirm-password" name="pwdCheck" placeholder="Double check your Password">
            </div>
            <div>
                <label for="address">주소(도/Province)</label>
                <input type="text" id="address" name="address" placeholder="Address">
            </div>
            <div>
                <label for="nickname">*닉네임</label>
                <input type="text" id="nickname" name="nickname" placeholder="Nickname">
            </div>
            <div>
                <label for="motherLang">*모국어/Mother tongue</label>
                <select name="motherLang" id="motherLang">
                    <option value="">--Please choose an option--</option>
                    <option value="Korean">Korean</option>
                    <option value="English">English</option>
                    <option value="Japanese">Japanese</option>
                    <option value="Chinese">Chinese</option>
                    <option value="German">German</option>
                    <option value="French">French</option>
                    <option value="Portuguese">Portuguese</option>
                    <option value="Italian">Italian</option>
                    <option value="etc">etc</option>
                </select>
            </div>
            <div>
                <label for="exchangeLang">교환언어/Exchange language</label>
                <select name="exchangeLang" id="exchangeLang">
                    <option value="">--Please choose an option--</option>
                    <option value="Korean">Korean</option>
                    <option value="English">English</option>
                    <option value="Japanese">Japanese</option> 
                    <option value="Chinese">Chinese</option>
                    <option value="German">German</option>
                    <option value="French">French</option>
                    <option value="Portuguese">Portuguese</option>
                    <option value="Italian">Italian</option>
                    <option value="etc">etc</option>
                </select>
            </div>
            <div class="radio-group">
                <strong>선호시간/Preferred time</strong>
                <input type="radio" id="am" name="time" value="am">
                <label for="am">오전(AM)</label>
                <input type="radio" id="pm" name="time" value="pm">
                <label for="pm">오후(PM)</label>
                <input type="radio" id="not-sure" name="time" value="all" checked>
                <label for="not-sure">미정(Not sure)</label>
            </div>
            <div>
                <label for="bio">간단한 자기소개(Tell us what you want!)</label>
                <textarea id="bio" name="intro" placeholder="자기소개를 입력하세요."></textarea>
            </div>
            <div>
                <label for="profile">프로필사진/Selfie (이미지파일만 업로드하세요)</label>
                <input type="file" name="profile" id="profile" accept=".jpg, .jpeg, .png, .gif">
            </div>
            <div class="submit-button">
                <input type="button" value="가입하기" onclick="fnRegist()">
            </div>
        </form>
    </div>
</body>
</html>
<script>
	var check1 = false; // 아이디 중복체크 확인 여부
	var check2 = false; // 중복 여부
	
	function fnDuplicate(){
		check1 = true;
		var form = document.registform;
		if(form.id.value =="" || form.id.value.length < 0){
			alert("아이디를 먼저 입력해주세요")
			form.id.focus();
		}else if(form.id.value.length < 6){
			alert("아이디는 6글자 이상으로 만들어주세요")
			form.id.focus();
		}else{
			window.open("ex_id_duplicate.jsp?userId="+form.id.value, "check","width=300, height=200");
		}
	}
	// 중복체크 리턴 결과
	function getReturn(val){
		if(val == "Y"){
			check2 = true;
		} else {
			check2 = false;
		}
	}
	function fnRegist(){
		var form = document.registform;
		if(!check2){
			alert("아이디 중복체크를 하세요");
			return;
		}
		if(form.id.value == ""){
			alert("아이디를 입력해주세요");
			form.id.focus();
			return;
		}else if(form.id.value.length < 6){
			alert("아이디는 6글자 이상으로 만들어주세요")
			form.id.focus();
			return;
		}else if(form.pwd.value == "" || form.pwdCheck.value == ""){
			alert("비밀번호를 입력해주세요")
			form.pwd.focus();
			return;
		}else if(form.pwd.value != form.pwdCheck.value){
			alert("비밀번호가 일치하지 않습니다.")
			form.pwd.focus();
			return;
		}else if(form.nickname.value == ""){
			alert("닉네임을 입력해해주세요")
			form.nickname.focus();
			return;
		}else if(form.motherLang.value == "" || form.exchangeLang.value == ""){
			alert("모국어 또는 교환언어를 선택해주세요")
			form.motherLang.focus();
			return;
		}else if(idCheck=false){
			alert("아이디 중복체크를 먼저하세요.");
		}else if(idCheck=true){
			alert("저장되었습니다.");
			form.submit();
		}
	}


 
</script>
