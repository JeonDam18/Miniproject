<%@page import="java.awt.Checkbox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
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
            position: relative; /* Positioning context for the button container */
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 15px; 
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: rgb(214, 196, 173);
            color: white;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        td {
            vertical-align: top;
        }
        .table-container {
            padding: 20px;
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
        <!-- <img src="images/write-logo.png"> -->
        <button><img src="images/write-logo.png">작성하기</button>
    </div>
    <div class="border-container">
        <div class="table-container">
            <table class="userlist">
                <tr>
                    <th>No</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>게시글</th>
                    <th>종류</th>
                    <th>날짜</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td><a href="#">주말에 한국어랑 영어 교환할분</a></td>
                    <td><a href="#">김정은</a></td>
                    <td><a href="#">저는 일중이라 현재 평일에는 힘들고 주말에...</a></td>
                    <td>언어교환</td>
                    <td>2024.08.12</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td><a href="#">주말에 한국어랑 영어 교환할분</a></td>
                    <td><a href="#">김정은</a></td>
                    <td><a href="#">저는 일중이라 현재 평일에는 힘들고 주말에...</a></td>
                    <td>언어교환</td>
                    <td>2024.08.15</td>
                </tr>                               
            </table>
        </div>
    </div>
</body>
</html>