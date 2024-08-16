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
            position:  ;
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
	<%@include file="ex-db.jsp"%>
	<%
		ResultSet rs = null;
		Statement stmt = null;
		String userId = (String)session.getAttribute("userId");
	
	try{
		stmt = conn.createStatement();
		String querytext = "SELECT B.BOARDNO,B.CONTENTS,B.TITLE,B.CATEGORY1,TO_CHAR(B.UDATETIME,'YYYY-MM-DD') AS UDATETIME,U.NICKNAME FROM TBL_EBOARD B INNER JOIN TBL_EUSER U ON B.USERID = U.USERID";
		rs = stmt.executeQuery(querytext);
		out.println(userId);	
	%>
    <div class="button-container">
        <!-- <img src="images/write-logo.png"> -->
        <button onclick="fnInsertboard()"><img src="images/write-logo.png">작성하기</button>
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
            <%
		while (rs.next()) {
		%>
                <tr>
                    <td><%= rs.getString("BOARDNO") %></td>
                    <td><a href="#" onclick="fnView('<%= rs.getString("BOARDNO") %>')"><%= rs.getString("TITLE") %></a></td>
                    <td><%= rs.getString("NICKNAME") %></td>
                    <td><%= rs.getString("CONTENTS") %></td>
                    <td><%= rs.getString("CATEGORY1") %></td>
                    <td><%= rs.getString("UDATETIME") %></td>
                </tr>
			<%
			}
		} catch(SQLException ex) {
				out.println("SQLException : " + ex.getMessage());
			}
			%>
		                             
            </table>
        </div>
    </div>
</body>
</html>
<script>
	function fnView(BOARDNO){
		location.href="ex-border-contents.jsp?BOARDNO="+BOARDNO;
	}
	function fnInsertboard(){
		location.href="ex-border-insert.jsp"
	}
</script>