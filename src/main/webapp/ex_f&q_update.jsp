<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        .border-contents-update-body {
            margin: 0;
            font-family: PTBandocheB, sans-serif;
        }

        .border-contents-update-container {
            width: 800px;
            margin: 50px auto;
            background-color: #972d2d;
            border-radius: 2%;
            padding: 20px;
            box-sizing: border-box;
        }

        .border-contents-update-title {
            width: 97%;
            height: 50px;
            padding: 10px;
            border-radius: 15px;
            font-size: 20px;
            font-weight: bold;
            background-color: white;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
        }

        .border-contents-update-title input[type="text"] {
            width: calc(100% - 120px);
            height: 30px;
            margin-left: 10px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .contents-header {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .contents-header div {
            font-size: 18px;
        }

        .contents-header select {
            margin-left: 10px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .border-contents-update {
            width: 100%;
            height: 200px;
            border-radius: 15px;
            background-color: white;
            padding: 10px;
            box-sizing: border-box;
            margin-bottom: 20px;
        }

        .border-contents-update textarea {
            width: 100%;
            height: 100%;
            border: none;
            font-size: 16px;
            box-sizing: border-box;
        }

        .border-contents-update-button {
            display: flex;
            justify-content: flex-end;
        }

        input[type="button"] {
            padding: 10px 15px;
            font-size: 14px;
            border: none;
            border-radius: 5px;
            background-color: #e9b23b;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-left: 10px;
        }

        input[type="button"]:hover {
            background-color: #e4ce6c;
        }
    </style>
</head>
<body class="border-contents-update-body">
<%@ include file="ex-db.jsp" %>
<%
    String fqno = request.getParameter("fqno");
    String userId = (String) session.getAttribute("userId");
    ResultSet rs = null;
    Statement stmt = null;
    try {
        stmt = conn.createStatement();
        String querytext = "SELECT * FROM TBL_EFQ WHERE FQNO=" + fqno;
        rs = stmt.executeQuery(querytext);
        if (rs.next()) {
%>
    <div class="border-contents-update-container">
         <form action="ex_f&q_update_result.jsp" name="fqupdate">
        <div class="border-contents-update-title">
            제목 : <input type="text" id="title" name="title" value="<%= rs.getString("FQTITLE") %>">
            <input type="hidden" id="fqno" name="fqno" value="<%= fqno %>">
        </div>
        <div class="contents-header">
            <div>
                카테고리 :
                <select id="category-select" name="category">
                    <option value="">--옵션을 선택하세요--</option>
                    <option value="공지사항" <%= "alarm".equals(rs.getString("FQCATEGORY")) ? "selected" : "" %>>공지사항</option>
                    <option value="F&Q" <%= "answer".equals(rs.getString("FQCATEGORY")) ? "selected" : "" %>>F&Q</option>
                </select>
            </div>
        </div>
        <div class="border-contents-update">
            <textarea id="content" name="content"><%= rs.getString("FQCONTENTS") %></textarea>
        </div>
        <div class="border-contents-update-button">
            <input type="button" onclick="fnUpdate()" value="수정(Modify)">
            <input type="button" onclick="fnCancel()" value="취소(Cancel)">
            </form>
        </div>
    </div>
<%
        }
    } catch (SQLException ex) {
        out.println("SQLException : " + ex.getMessage());
    }
%>
<script>
    function fnUpdate() {
    	var form = document.fqupdate;
		var title = document.querySelector("#title").value;
		var category = document.querySelector("#category-select").value;
		var content = document.querySelector("#content").value;
		var fqno = document.querySelector("#fqno").value;
		if(title == ""){
			alert("제목을 입력하세요");
			return;
		}else if(category == ""){
			alert("카테고리를 구분하세요");
			return;
		}else if(content == ""){
			alert("내용을 입력하세요");
			return;
		}else{
			form.submit();
		} 
    }

    function fnCancel() {
    	if(confirm("수정중이던 글을 취소하시겠습니까?")){
			window.history.back();			
		}
    }
</script>
</body>
</html>