<%@page import="java.awt.Checkbox"%>
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
            font-family: 'PTBandocheB';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2408@1.0/PTBandocheB.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }
        .border-contents-body {
            margin: 0;
            font-family: PTBandocheB, sans-serif;
        }

        .border-contents-container {
            width: 800px;
            height: 800px; /* 원래 높이 */
            margin: 50px auto;
            background-color: rgb(235, 222, 206); /* 원래 색상 */
            border-radius: 2%;
            padding: 20px;
            box-sizing: border-box;
        }

        .border-contents-title {
            width: 96%;
            height: 30px;
            padding: 10px;
            border-radius: 15px;
            font-size: 20px;
            font-weight: bold;
            background-color: white;
            margin-top: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .contents-header {
            display: flex;
            align-items: center;
            margin-top: 10px;
        }

        .border-contents-selfie {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            background-image: url('images/selfie2.jpg');
            background-size: cover;
            background-position: center;
            margin-right: 15px;
        }

        .border-contents-nickname {
            font-size: 20px;
            font-weight: bold;
            margin-right: 20px;
        }

        .border-contents-date {
            font-size: 16px;
            color: #555; /* 적당한 회색 */
        }

        .border-contents {
            padding: 10px;
            margin-top: 20px;
            width: 97%;
            height: 500px; /* 원래 높이에 맞게 조정 */
            border-radius: 15px;
            background-color: white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .border-contents-button {
            margin-top: 10px;
            display: flex;
            justify-content: flex-end;
        }

        button {
            padding: 10px 15px;
            font-size: 14px;
            border: none;
            border-radius: 5px;
            background-color: #e9b23b; /* 원래 색상 */
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-left: 10px;
        }

        button:hover {
            background-color: #e4ce6c; /* 원래 색상 */
        }
    </style>
</head>
<body class="border-contents-body">
<%@include file="ex-db.jsp"%>
<%
	String BOARDNO = request.getParameter("BOARDNO");
	String userId = (String)session.getAttribute("userId");
	ResultSet rs = null;
	Statement stmt = null;
	out.println(userId);
	try{
		stmt = conn.createStatement();
		String querytext = "SELECT U.USERID,B.BOARDNO,B.CONTENTS,B.TITLE,B.CATEGORY1,TO_CHAR(B.UDATETIME,'YYYY-MM-DD') AS UDATETIME,U.NICKNAME"+
						   " FROM TBL_EBOARD B INNER JOIN TBL_EUSER U ON B.USERID = U.USERID" +
						   " WHERE BOARDNO="+BOARDNO;
		rs = stmt.executeQuery(querytext);
		if (rs.next()) {

%> 
    <div class="border-contents-container">
        <div class="border-contents-title"><%= rs.getString("TITLE") %></div>
        <div class="contents-header">
            <div class="border-contents-selfie"></div>
            <div class="border-contents-nickname"><%= rs.getString("NICKNAME") %></div>
            <div class="border-contents-date"><%= rs.getString("UDATETIME") %></div>
        </div>
        <div class="border-contents"><%= rs.getString("CONTENTS") %></div>
        <div class="border-contents-button">
        <%
			if(rs.getString("USERID").equals(userId) || rs.getString("USERID").equals("admin")){
		%>
            <button onclick="fnUpdate_board('<%= BOARDNO %>')">수정</button>
            <button onclick="fnDelete_board('<%= BOARDNO %>')">삭제</button>
        <%
			}else{
		%>
            <button onclick="fnApply('<%= rs.getString("USERID") %>')">신청하기</button>
         <% } %>
        </div>
    </div>
    <%	}else{
				out.println("삭제된 게시물입니다.");
				}
		 } catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
</body>
</html>
<script>
	function fnApply(APPLIEDID){
		 var confirmed = confirm("정말로 신청하시겠습니까?");
	    if (confirmed) {
	        location.href = "ex-apply-result.jsp?APPLIEDID="+APPLIEDID;
	    }
	}
	function fnUpdate_board(BOARDNO){
		location.href="ex-border-update.jsp?BOARDNO="+BOARDNO;
	}
	function fnDelete_board(BOARDNO){
		location.href="ex-border-delete.jsp?BOARDNO="+BOARDNO;
	}
</script>