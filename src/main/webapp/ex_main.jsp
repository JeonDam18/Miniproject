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
        .main-body {
            font-family: 'PTBandocheB', Arial, sans-serif;
            margin-top: 0;
            padding: 0;
        }
        .user-info-list {
            margin: 0 auto;
            width: 1300px;
            height: 300px;
            background-color: antiquewhite;
            display: flex;
            align-items: center;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .user-selfie {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            margin-right: 30px;
            background-image: url('images/profile-ex2.png');
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }
        .user-info {
            flex: 1;
            background-color: rgb(214, 196, 173);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }
        .user-info div {
            margin-bottom: 10px;
        }
        .user-info span {
            display: inline-block;
            margin-right: 10px;
            font-weight: bold;
        }
        .user-intro {
            margin-top: 20px;
        }
        .user-intro span {
            display: block;
            margin-top: 10px;
        }
        .user-info-list input[type="button"] {
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            background-color: #be9660;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-left: 10px;
            transition: background-color 0.3s ease;
        }
        .user-info-list input[type="button"]:hover {
            background-color: #d4a94c;
        }
        .main-container{
            margin-top: 10px;
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
		String querytext = "SELECT * FROM TBL_EUSER";
		rs = stmt.executeQuery(querytext);

	%>
        <%
        while(rs.next()){
        %>
<body class="main-body">
    <div class="main-container">
        <div class="user-info-list">
            <div class="user-selfie"></div>
            <div class="user-info">
                <div>
                    <span>닉네임:</span><span><%= rs.getString("NICKNAME") %></span>
                </div>
                <div>
                    <span>모국어(Mother tongue):</span><span><%= rs.getString("MOTHERLANG") %></span>
                </div>
                <div>	
                    <span>학습언어:</span><span><%= rs.getString("EXCHANGELANG") %></span>
                </div>
                <div>
                    <span>선호시간:</span><span><%= rs.getString("PRETIME") %></span>
                </div>
                <div class="user-intro">
                    <span>나는!</span><span><%= rs.getString("INTRODUCE") %></span>
                </div>
            </div>
            <form action="">
                <input type="button" value="교환신청" onclick="fnApply()">
            </form>
        </div>
    </div> 
</body>
            <%} %>
    <%
	} catch(SQLException ex) {
		out.println("SQLException : " + ex.getMessage());
	}
	%>
</html>

<script>
	 function fnApply(){
		 alert("공사중 뚝딱뚝딱 똑땅해 어려워");
	 }
	 document.addEventListener('DOMContentLoaded', function() {
	     var currentPage = window.location.href; // 현재 페이지 URL 가져오기
	     var tabs = document.querySelectorAll('.section-tab');
	
	     tabs.forEach(function(tab) {
	         if (tab.href === currentPage) {
	             tab.classList.add('active'); // 현재 페이지와 일치하는 탭에 active 클래스 추가
	         }
	     });
	 });
</script>