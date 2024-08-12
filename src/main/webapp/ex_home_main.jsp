<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문ture에 오신것을 환영합니다</title>

    <style>
        @font-face {
            font-family: 'SBAggroB';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        .home-main-body {
            font-family: 'SBAggroB', Arial, sans-serif;
            background: url('images/background-body.jpg');
            background-size: cover;
            margin: 0;
            padding: 0;
            opacity: 1; /* opacity 값 1로 수정 */
            
        }

        .home-main-container {
            width: 80%;
            margin: 0 auto;
            padding: 10px;
        }

        .section-header {
            width: 100%;
            height: 144px;
        }

        .section-tab {
            width: 100%;
            height: 144px;
        }

        .section-body {
            margin-top: 20px;
            width: 100%;
            height: auto;
            text-align: center;
        }

        .home-main-btn {
            border: none;
            display: inline-block; /* inline-block으로 수정 */
            text-align: center;
            cursor: pointer;
            text-transform: uppercase;
            outline: none;
            overflow: hidden;
            position: relative;
            color: #fff;
            font-weight: 700;
            font-size: 15px;
            background-color: #222;
            padding: 15px 40px; /* 버튼 패딩 조정 */
            margin: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.20);
        }

        .home-main-btn span {
            position: relative;
            z-index: 1;
        }

        .home-main-btn:after {
            content: "";
            position: absolute;
            left: 0;
            top: 0;
            height: 490%;
            width: 140%;
            background: #0b94a7;
            transition: all .5s ease-in-out;
            transform: translateX(-98%) translateY(-25%) rotate(45deg);
        }

        .home-main-btn:hover:after {
            transform: translateX(-9%) translateY(-25%) rotate(45deg);
        }

        .section-tab-font {
            color: #ad6c09;
        }

        .section-title {
            margin: 20px;
        }
    </style>
</head>

<body class="home-main-body">
    <div class="home-main-container">

        <div class="section-tab">
            <div class="section-title" style="font-size: 50px;">
                <span class="section-tab-font" style="font-size: 70px;">"문 ture"</span>에서
            </div>
            
            <div style="font-size: 50px; margin: 10px;">
                <span class="section-tab-font">You</span>가
                <span class="section-tab-font"> want</span>하던
                <span class="section-tab-font"> system</span>이
                <span class="section-tab-font"> here</span>에
                <span class="section-tab-font"> all</span>있다!!
            </div>
        </div>
        <div class="section-body">
            <div style="font-size: 100px; margin-bottom: 20px;">
                언제까지 번역기 돌릴거야 실전으로 배워보자
            </div>
            <div class="home-main-logo">
                <!-- 로고와 버튼들이 함께 보이도록 margin 조정 -->
                <button class="home-main-btn" onclick="fnLogin()"><span> 로그인 (Login) </span></button><br>
                <button class="home-main-btn" onclick="fnRegist()"><span>회원가입(Regist)</span></button>
            </div>
        </div>

    </div>
</body>

</html>
<script>
	function fnLogin(){
		location.href="ex_login.jsp"
	}
	function fnRegist(){
		location.href="ex_regist.jsp"
	}
</script>