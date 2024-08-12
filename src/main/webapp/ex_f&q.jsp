<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .border-container {
            margin: 20px auto;
            width: 90%;
            max-width: 1200px;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #e46161;
        }
        th {
            background-color:  rgb(199, 35, 35);
            color: white;
        }
        tr:hover {
            background-color: #c75e5e;
        }
        td {
            vertical-align: top;
        }
        .table-container {
            padding: 20px;
        }
        .fq-title{
            width: 200px;
            height: 50px;
            padding: 10px;
            border-radius: 15px;
            font-size: 20px;
            font-weight: bold;
            text-align: center;
            background-color: white;
            border: 5px solid rgb(219, 115, 115);
            margin: 10px auto;
            /* box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); */
        }
        .button-container {
            position: absolute;
            top: 10px;
            right: 10px;
            display: flex;
            align-items: center;
        }
        .button-container img {
            width: 30px;
            height: 20px;
            object-fit: contain;
            margin-right: 5px;
            background-size: cover;
        }
        .button-container button {
            width: 120px;
            height: 30px;
            background-color: #f4f4f4;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
            color: #333;
        }
        .button-container button:hover {
            background-color: #e4e4e4;
        }
    </style>
</head>
<body>
<%@ include file="ex_header.jsp"%>
    <div class="button-container">
        <button><img src="images/write-logo.png">작성하기</button>
    </div>
    <div class="border-container">
        <div class="table-container">
            <div class="fq-title">F&Q 게시판입니다.</div>
            <table class="fqlist">
                    <tr>
                        <th>No</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>게시글</th>
                        <th>날짜</th>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td><a href="#">"공지사항입니다." 다들 화이팅 </a></td>
                        <td><a href="#">관리자</a></td>
                        <td><a href="#">나만힘내면 될듯</a></td>
                        <td>2024.08.12</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td><a href="#">자꾸 김정은이 말을걸어요</a></td>
                        <td><a href="#">관리자</a></td>
                        <td><a href="#">총맞은것처럼~</a></td>
                        <td>2024.08.15</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td><a href="#">자꾸 시진핑이 말을걸어요</a></td>
                        <td><a href="#">관리자</a></td>
                        <td><a href="#">주한미군만세~</a></td>
                        <td>2024.08.16</td>
                    </tr>                               
            </table>
        </div>
    </div>
</body>
</html>