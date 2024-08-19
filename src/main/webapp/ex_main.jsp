<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        /* 기존 CSS 코드 유지 */
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
            /* font-family: 'GmarketSansMedium', Arial, sans-serif; */
        }
        .main-body {
            font-family: 'PTBandocheB', Arial, sans-serif;
            margin-top: 0;
            padding: 0;
        }
        .filters-container {
        	font-size : 14px;
            margin: 0 auto;
            width: 1300px;
            margin-bottom: 20px; /* 사용자 정보 리스트와의 간격 조정 */
            padding: 20px;
            background-color: #f5f5f5; /* 배경 색상 조정 */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        .filters-container form {
            display: flex;
            gap: 20px; /* 필터 간 간격 조정 */
            align-items: center;
        }
        .filters-container span {
            font-weight: bold;
            margin-right: 10px;
        }
        .filters-container select {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .filters-container select:focus {
            border-color: #be9660;
            outline: none;
        }
        .user-info-list {
        	font-size : 14px;
            margin: 0 auto;
            width: 1300px;
            height: 250px;
            background-color: antiquewhite;
            display: flex;
            align-items: center;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px; /* 필터와 사용자 정보 리스트 간 간격 조정 */
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
    <div class="filters-container">
        <form action="ex_main.jsp" method="GET">
            <span>학습언어</span>
            <select name="selectedValue" onchange="this.form.submit()">
                <option value="">--Please choose an option--</option>
                <option value="Korean" <%= "Korean".equals(request.getParameter("selectedValue")) ? "selected" : "" %>>Korean</option>
                <option value="English" <%= "English".equals(request.getParameter("selectedValue")) ? "selected" : "" %>>English</option>
                <option value="Japanese" <%= "Japanese".equals(request.getParameter("selectedValue")) ? "selected" : "" %>>Japanese</option>
                <option value="Chinese" <%= "Chinese".equals(request.getParameter("selectedValue")) ? "selected" : "" %>>Chinese</option>
                <option value="German" <%= "German".equals(request.getParameter("selectedValue")) ? "selected" : "" %>>German</option>
                <option value="French" <%= "French".equals(request.getParameter("selectedValue")) ? "selected" : "" %>>French</option>
                <option value="Portuguese" <%= "Portuguese".equals(request.getParameter("selectedValue")) ? "selected" : "" %>>Portuguese</option>
                <option value="Italian" <%= "Italian".equals(request.getParameter("selectedValue")) ? "selected" : "" %>>Italian</option>
                <option value="">all</option>
            </select>

            <span>선호시간</span>
            <select name="pretime" onchange="this.form.submit()">
                <option value="">--Please choose an option--</option>
                <option value="am" <%= "am".equals(request.getParameter("pretime")) ? "selected" : "" %>>am (오전)</option>
                <option value="pm" <%= "pm".equals(request.getParameter("pretime")) ? "selected" : "" %>>pm (오후)</option>
                <option value="">all</option>
            </select>
        </form>
    </div>
	<%
		ResultSet rs = null;
		Statement stmt = null;
		String userId = (String)session.getAttribute("userId");
		String selectedValue = request.getParameter("selectedValue");
		String pretime = request.getParameter("pretime");
		boolean selectstatus = false;
	try{
		stmt = conn.createStatement();
		String querytext = "SELECT * FROM TBL_EUSER";
		if(selectedValue != null && !selectedValue.isEmpty()){
			 querytext += " WHERE EXCHANGELANG = '" + selectedValue + "'";
			 selectstatus = true;
		}
		if(pretime != null && !pretime.isEmpty() && !"all".equals(pretime)){
			if(selectstatus){
				querytext += " AND";
			}else{
				querytext += " WHERE";
			}
			querytext += " PRETIME= '"+pretime+"'";
		}
		rs = stmt.executeQuery(querytext);
 
        while(rs.next()){
        	//본인의 프로필을 제외하고 보여줌
        	if(!rs.getString("USERID").equals(userId)){
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
                <input type="button" value="교환신청" onclick="fnApply('<%= rs.getString("USERID") %>')">
        </div>
    </div> 
</body>
            <%}
            }
	
        	%>
    <%
	} catch(SQLException ex) {
		out.println("SQLException : " + ex.getMessage());
	}
	%>
<%@ include file="ex_footer.jsp"%>
</html>

<script>
	 function fnApply(APPLIEDID){
		 var confirmed = confirm("정말로 신청하시겠습니까?");
         if (confirmed) {
             location.href = "ex-apply-result.jsp?APPLIEDID="+APPLIEDID;
         }
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