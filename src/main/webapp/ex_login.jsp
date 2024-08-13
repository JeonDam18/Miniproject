<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문ture에 로그인</title> 
    <style>
        .login-submit-container {
            margin: 100px auto;
            width: 600px;
            height: 400px;
            background-color: rgb(250, 250, 250);
            border-radius: 5%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        @font-face {
            font-family: 'goorm-sans-code';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2408@1.0/goorm-sans-code.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        } 

        .login-submit-body {
            background-color: rgb(138, 35, 15);
            font-family: 'goorm-sans-code', Arial, sans-serif;
            margin: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .section-header-login {
            text-align: center;
            margin-bottom: 20px;
        }
        .section-header-login img {
            width: 150px; 
            margin-bottom: 10px;
        }
        .section-header-login div {
            font-size: 40px;
            color: #fff;
        }
        .login-form {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .login-form div {
            margin-bottom: 20px;
            width: 80%;
        }
        .login-label {
            font-size: 18px;
            display: block;
            margin-bottom: 5px;
        }
        .login-input {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .login-submit {
            padding: 10px 20px;
            font-size: 18px;
            background-color: rgb(156, 199, 235);
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
        }
        .login-submit:hover {
            background-color: rgb(120, 180, 220);
        }
    </style>
</head>
<body class="login-submit-body">
    <div class="section-header-login">
        <img src="images/logo2.PNG" alt="Logo">
        <div>LOGIN</div>
    </div>
    <div class="login-submit-container">
        <form action="ex_login_result.jsp" class="login-form" name=login>
            <div>
                <label for="username" class="login-label">아이디</label>
                <input type="text" id="username" name="userId" class="login-input">
            </div>
            <div>
                <label for="password" class="login-label">비밀번호</label>
                <input type="password" id="password" name="pwd" class="login-input">
            </div>
            <input class="login-submit" type="button" value="로그인" onclick="fnLogin()">
        </form>
    </div>
</body>
</html>
 <script>
    function fnLogin() {
        var form = document.login;
         var id = form.userId.value;
        var pwd = form.pwd.value;

        if (id === "") {
            alert("아이디를 입력하세요");
            form.userId.focus();
            return;
        } else if (pwd === "") {
            alert("비밀번호를 입력하세요");
            form.pwd.focus();
            return;
        } else {
            form.submit();
        }
    }
</script>