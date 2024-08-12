<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>신청대기목록</title>
    <style>
        @font-face {
            font-family: 'PTBandocheB';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2408@1.0/PTBandocheB.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }
        .apply-body {
            font-family: 'PTBandocheB', Arial, sans-serif;
            margin-top: 0;
            padding: 0;
        }
        .apply-info-list {
            margin: 10px auto;
            width: 1300px;
            height: 300px;
            background-color: rgb(132, 179, 240);
            display: flex;
            align-items: center;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .apply-selfie {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            margin-right: 30px;
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }
        .apply-selfie-image{
            width: 200px;
            height: 200px;
            border-radius: 50%;
            margin-right: 30px;
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        .apply-info {
            flex: 1;
            background-color: rgb(59, 141, 235);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        .apply-info div {
            margin-bottom: 10px;
        }

        .apply-info span {
            display: inline-block;
            margin-right: 10px;
            font-weight: bold;
        }

        .apply-user-intro {
            margin-top: 20px;
        }

        .apply-user-intro span {
            display: block;
            margin-top: 10px;
        }

        .apply-info-list form {
            margin-left: 20px;
        }

        .apply-info-list input[type="button"] {
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            background-color: #3e40b1;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-left: 10px;
            transition: background-color 0.3s ease;
        }

        .apply-info-list input[type="button"]:hover {
            background-color: #1126e6;
        }
    </style>
</head>
<body class="apply-body">
<%@ include file="ex_header.jsp"%>
    <div>
        <div class="apply-info-list">
            <div class="apply-selfie">
                <img src="images/selfie3.jpg" class="apply-selfie-image">
            </div>
            <div class="apply-info">
                <div>
                    <span>닉네임:</span><span>얼마나china</span>
                </div>
                <div>
                    <span>모국어(Mother tongue):</span><span>Japanese</span>
                </div>
                <div>
                    <span>학습언어:</span><span>French</span>
                </div>
                <div>
                    <span>선호시간:</span><span>따자하오</span>
                </div>
                <div class="apply-user-intro">
                    <span>나는!</span><span>니하오 와따시와 칸코쿠진 스바라시 이얼싼쓰~</span>
                </div>
            </div>
            <form action="">
                <input type="button" value="신청승인">
            </form>
        </div>
    </div> 
</body>
</html>