<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문ture Registration</title>
    <style>
        @font-face {
            font-family: 'goorm-sans-code';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2408@1.0/goorm-sans-code.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }
        .regist-body {
            background-color: rgb(138, 35, 15);
            font-family: 'goorm-sans-code', Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 1200px;
            margin: 0;
            overflow-y: auto;
        }
        .regist-form {
            width: 600px;
            background-color: rgb(255, 255, 255);
            border-radius: 8px;
            border: 1px solid rgb(238, 238, 238);
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            box-sizing: border-box;
        }
        .regist-form div {
            margin-bottom: 15px;
            display: flex;
            flex-direction: column;
        }
        .regist-form div label {
            font-weight: bold;
            margin-bottom: 5px;
        }
        .regist-form input[type="text"],
        .regist-form input[type="password"],
        .regist-form input[type="file"],
        .regist-form textarea,
        .regist-form select {
            width: 100%;
            padding: 8px;
            border: 1px solid rgb(200, 200, 200);
            border-radius: 4px;
            box-sizing: border-box;
        }
        .regist-form input[type="file"] {
            padding: 4px;
            border: none;
            background-color: #f8f8f8;
        }
        .regist-form button,
        .regist-form input[type="button"] {
            padding: 10px 15px;
            border: none;
            background-color: #007bff;
            color: white;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        .regist-form button:hover,
        .regist-form input[type="button"]:hover {
            background-color: #0056b3;
        }
        .regist-form input[type="radio"] {
            margin-right: 5px;
        }
        .regist-form input[type="radio"] + label {
            margin-right: 15px;
        }
        .regist-form .inline-container {
            display: flex;
            flex-direction: column;
            margin-bottom: 0; /* Remove bottom margin to avoid extra space */
        }
        .regist-form .inline-container input[type="text"] {
            margin-right: 0;
            margin-bottom: 15px;
        }
        .regist-form .inline-container .check-button {
            margin-top: 0; /* Adjust margin */
        }
        .regist-form .radio-group {
            display: flex;
            align-items: center;
            flex-wrap: wrap;
            font-size: 14px; /* Reduce font size */
        }
        .regist-form .radio-group input[type="radio"] {
            margin-right: 5px;
        }
        .regist-form .radio-group label {
            margin-right: 15px;
        }
        .regist-form .submit-button {
            text-align: center;
        }
        .regist-form .form-title {
            text-align: center; 
            font-size: 24px;
            margin-bottom: 20px;
            font-weight: bold;
        }
    </style>
</head>
<%@include file="ex-db.jsp"%>
<%
	ResultSet rs = null;
	Statement stmt = null;
	String userId = (String)session.getAttribute("userId");
	
	try{
	stmt = conn.createStatement();
	String querytext = "SELECT * FROM TBL_EUSER WHERE USERID='" + userId + "'";
	rs = stmt.executeQuery(querytext);
	if(rs.next()){
%>
<body class="regist-body">
    <div class="regist-form">
        <div class="form-title">정보수정</div>
        <form action="ex_info_update_result.jsp" id="registration-form" name="updateform" method="post" enctype="multipart/form-data">   
            <div>
                <label for="id">*아이디</label>
                <input type="text" id="id" name="id" value="<%=rs.getString("USERID") %>" readonly>
            </div>
            <div> 
                <label for="password">*비밀번호</label>
                <input type="password" id="password" name="pwd" value="*******" readonly>
            </div>
            <div>
                <label for="address">주소(도/Province)</label>
                <input type="text" id="address" name="address" value="<%=rs.getString("USEADDR") %>">
            </div>
            <div>
                <label for="nickname">*닉네임</label>
                <input type="text" id="nickname" name="nickname" value="<%=rs.getString("NICKNAME") %>">
            </div>
            <div>
                <label for="motherLang">*모국어/Mother tongue</label>
                <select name="motherLang" id="motherLang">
                    <option value="">--Please choose an option--</option>
                    <option value="Korean">Korean</option>
                    <option value="English">English</option>
                    <option value="Japanese">Japanese</option>
                    <option value="Chinese">Chinese</option>
                    <option value="German">German</option>
                    <option value="French">French</option>
                    <option value="Portuguese">Portuguese</option>
                    <option value="Italian">Italian</option>
                    <option value="etc">etc</option>
                </select>
            </div>
            <div>
                <label for="exchangeLang">교환언어/Exchange language</label>
                <select name="exchangeLang" id="exchangeLang">
                    <option value="">--Please choose an option--</option>
                    <option value="Korean">Korean</option>
                    <option value="English">English</option>
                    <option value="Japanese">Japanese</option> 
                    <option value="Chinese">Chinese</option>
                    <option value="German">German</option>
                    <option value="French">French</option>
                    <option value="Portuguese">Portuguese</option>
                    <option value="Italian">Italian</option>
                    <option value="etc">etc</option>
                </select>
            </div>
            <div class="radio-group">
                <strong>선호시간/Preferred time</strong>
                <input type="radio" id="am" name="time" value="am">
                <label for="am">오전(AM)</label>
                <input type="radio" id="pm" name="time" value="pm">
                <label for="pm">오후(PM)</label>
                <input type="radio" id="not-sure" name="time" value="all" checked>
                <label for="not-sure">미정(Not sure)</label>
            </div>
            <div>
                <label for="bio">간단한 자기소개(Tell us what you want!)</label>
                <textarea id="bio" name="intro" ><%=rs.getString("INTRODUCE") %></textarea>
            </div>
            <div>
                <label for="profile">프로필사진/Selfie (이미지파일만 업로드하세요)</label>
                <input type="file" name="profile" id="profile" accept=".jpg, .jpeg, .png, .gif">
            </div>
            <div class="submit-button">
                <input type="button" value="수정하기" onclick="fnUpdate()">
            </div>
        </form>
            <%
            }
			} catch(SQLException ex) {
				out.println("SQLException : " + ex.getMessage());
			}
			%>
    </div>
</body>
</html>
<script>
	function fnUpdate(){
			var form = document.updateform;
	
			if(form.nickname.value == ""){
				alert("닉네임을 입력해해주세요")
				form.nickname.focus();
				return;
			}else if(form.motherLang.value == "" || form.exchangeLang.value == ""){
				alert("모국어 또는 교환언어를 선택해주세요")
				form.motherLang.focus();
				return;
			}else
				form.submit();
			}
	
</script>