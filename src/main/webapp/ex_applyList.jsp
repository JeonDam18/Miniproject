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
        .applicant-status {
            margin: 20px auto;
            width: 1300px;
            padding: 20px;
            background-color: rgb(59, 141, 235); /* 배경색을 apply-info와 동일하게 */
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: white;
            font-weight: bold;
        }

        .applicant-status span {
            margin-right: 10px;
        }

        .applicant-status input[type="button"] {
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            background-color: #3e40b1; /* 버튼 색상 동일하게 */
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .applicant-status input[type="button"]:hover {
            background-color: #1126e6; /* 버튼 hover 색상 동일하게 */
        }
    </style>
</head>
<body class="apply-body">
<%@include file="ex-db.jsp"%>
	<%
	ResultSet rs = null;
	Statement stmt = null;
	String userId = (String)session.getAttribute("userId");

	try{
		stmt = conn.createStatement();
		String querytext = "SELECT a.APPLYUSERID,a.APPLIEDUSERID,u.NICKNAME,u.MOTHERLANG,u.EXCHANGELANG,u.PRETIME,u.INTRODUCE"+
				" FROM TBL_APPLY a"+
				" JOIN TBL_EUSER u ON a.APPLYUSERID = u.USERID"+
				" WHERE a.APPLIEDUSERID ='" + userId + "'";
		rs = stmt.executeQuery(querytext);
	%>
<%@ include file="ex_header.jsp"%>
    	<%
    		while(rs.next()){
    	%>
    <div>
        <div class="apply-info-list">
            <div class="apply-selfie">
                <img src="images/profile-ex2.png" class="apply-selfie-image">
            </div>
            <div class="apply-info">
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
                <div class="apply-user-intro">
                    <span>나는!</span><span><%= rs.getString("INTRODUCE") %></span>
                </div>
            </div>
                <input type="button" value="신청승인" onclick="fnAccept()">
          <%}%>
        </div>
    </div> 
    	<%
			String querytext2 = "SELECT a.APPLYUSERID,a.APPLIEDUSERID,u.NICKNAME,u.MOTHERLANG,u.EXCHANGELANG,u.PRETIME,u.INTRODUCE" +
						" FROM TBL_APPLY a"+
						" JOIN TBL_EUSER u ON a.APPLIEDUSERID = u.USERID"+
						" WHERE a.APPLYUSERID ='" + userId + "'";
    	
    		rs = stmt.executeQuery(querytext2);
    		while(rs.next()){
    	%>
    				<div class="applicant-status">
    	            <span>신청한사람: <%= rs.getString("APPLIEDUSERID") %></span>
    	            <span>상태: 승인대기</span>
    	            <input type="button" onclick="fnCancel('<%= rs.getString("APPLIEDUSERID") %>')" value="신청취소">
    	        	</div>
    	    <%     
    		}
	} catch(SQLException ex) {
		out.println("SQLException : " + ex.getMessage());
	}
          %>
</body>
</html>
<script>
	function fnAccept(){
		alert("신청이 승인되었습니다! 관리자를 통해 연락이 갑니다!");
	}
	function fnCancel(applieduserid){
		var confirmed = confirm("신청을 취소 하시겠습니까?");
        if (confirmed) {
		location.href="ex-apply-delete.jsp?applieduserid="+applieduserid;            
        }
	}
</script>