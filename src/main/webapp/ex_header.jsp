<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        @font-face {
            font-family: 'GmarketSansMedium';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        @font-face {
            font-family: 'SBAggroB';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        body {
            margin: 10px;
            padding: 0;
            position: relative;
            font-family: 'GmarketSansMedium', Arial, sans-serif;
        }
        .header-container {
            margin: 0 auto;
            width: 100%;
            height: 200px;
            background-color: rgb(138, 35, 15);
            position: relative; /* 자식 요소의 절대 위치 기준 */
            box-sizing: border-box;
            overflow: hidden;
        }
        .logo {
            width: 200px;
            height: 200px;
            float: left;
            background-image: url(images/logo2.PNG);
            background-size: contain;
            background-position: center;
            background-repeat: no-repeat;
        }
        .section-tabs {
            position: absolute;
            bottom: 0;
            left: 200px;
            width: calc(100% - 200px);
            box-sizing: border-box;
            background-color: rgb(138, 35, 15);
            justify-content: flex-start;
            padding: 0;
            margin: 0;
        }
        .section-tab {
            width: 400px;
            height: 54px;
            box-sizing: border-box;
            text-align: center;
            line-height: 54px;
            color: black;
            font-weight: bold;
            margin: 0 5px;
            display: inline-block;
            text-decoration: none;
            background-color: white;
            border: 1px solid #ccc;
            border-radius: 8px; 
        }
        .section-tab:hover {
            background-color: #f0f0f0;
        }
        .header-title {
            position: relative; /* 자식 요소의 절대 위치 기준 */
            margin: 30px 0 30px 400px; /* 수정: 400px -> 200px */
            font-family: 'SBAggroB', Arial, sans-serif;
            font-size: 80px; 
            color: white;
        }
        .header-user-control {
            position: absolute;
            top: 0;
            right: 0;
            margin: 30px; /* 헤더의 상단과 우측 여백 설정 */
            font-size: 16px;
        }
        .header-user-control a {
            color: white;
            text-decoration: none;
        }
        .header-user-control a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="header-container">
        <div class="logo"></div> <!--클릭시 홈으로-->
        <div class="header-title">모두 여기로 문ture!!
            <span class="header-user-control">
                <img src="images/log-out.png" style="width: 16px; height: 16px;">
                <a href="#">로그아웃</a>
                <img src="images/user_info.png" style="width: 16px; height: 16px;">
                <a href="#">정보수정</a>
            </span>
        </div>
        <div class="section-tabs"> 
            <a class="section-tab" href="#">나를 기다리는 친구들</a>
            <a class="section-tab" href="#">신청 및 게시판</a>
            <a class="section-tab" href="#">신청대기목록</a>
            <a class="section-tab" href="#">F&Q</a>
        </div>
    </div>
</body>
</html>