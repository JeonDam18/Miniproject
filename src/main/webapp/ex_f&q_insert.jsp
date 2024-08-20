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
        .fq-insert-body {
            margin: 0;
            font-family: PTBandocheB, sans-serif;
        }

        .fq-insert-container {
            width: 800px;
            margin: 50px auto;
            background-color: rgb(202, 120, 109);
            border-radius: 2%;
            padding: 20px;
            box-sizing: border-box;
        }

        .fq-insert-title {
            width: 97%;
            height: 50px;
            padding: 10px;
            border-radius: 15px;
            font-size: 20px;
            font-weight: bold;
            background-color: rgb(218, 168, 168);
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
        }

        .fq-insert-title input[type="text"] {
            width: calc(100% - 120px);
            height: 30px;
            margin-left: 10px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .fq-header {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .fq-header div {
            font-size: 18px;
        }

        .fq-header select {
            margin-left: 10px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .fq-contents-update {
            width: 100%;
            height: 200px;
            border-radius: 15px;
            background-color: rgb(255, 255, 255);
            padding: 10px;
            box-sizing: border-box;
            margin-bottom: 20px;
        }

        .fq-contents-update textarea {
            width: 100%;
            height: 100%;
            border: none;
            font-size: 16px;
            box-sizing: border-box;
        }

        .fq-contents-update-button {
            display: flex;
            justify-content: flex-end;
        }

        input[type="button"] {
            padding: 10px 15px;
            font-size: 14px;
            border: none;
            border-radius: 5px;
            background-color: #a04848;
            color: rgb(255, 255, 255);
            cursor: pointer;
            transition: background-color 0.3s;
            margin-left: 10px;
        }

        input[type="button"]:hover {
            background-color: #d47979;
        }

        #content {
            width: 100%; /* 가로 크기를 부모 요소에 맞추기 */
            height: 150px; /* 세로 크기 지정 */
        }

        .button-container img {
            width: 30px;
            height: 20px;
            object-fit: contain;
            margin-right: 5px;
            background-size: cover;
        }

        .button-container input[type="button"] {
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

        .button-container input[type="button"]:hover {
            background-color: #e4e4e4;
        }
    </style>
</head>
<%
	String userId = (String)session.getAttribute("userId");
%>
<body class="fq-insert-body">
    <div class="fq-insert-container">
    	<form action="ex_f&q_insert_result.jsp" name="forminsert">
        <div class="fq-insert-title">
            Title : <input type="text" id="title" name="title" placeholder="제목을 입력하세요">
        </div>
        <div class="fq-header">
            <div>
                Category :
                <select id="category-select" name="category">
                    <option value="">--Please choose an option--</option>
                    <option value="공지사항">공지사항</option>
                    <option value="F&Q">F&Q</option>
                </select>
            </div>
        </div>
        <div class="fq-contents-update">
            <textarea id="content" name="content" placeholder="내용을 입력하세요"></textarea>
        </div>
        <div class="fq-contents-update-button">
            <input type="button" onclick="fnInsert()"value="입력(enter)">
            <input type="button" onclick="fnCancel()"value="취소(Cancel)">
            </form>
        </div>
    </div>
</body>
</html>
<script>
	function fnInsert(){
		var form = document.forminsert;
		var title = document.querySelector("#title").value;
		var category = document.querySelector("#category-select").value;
		var content = document.querySelector("#content").value;
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
	function fnCancel(){
		if(confirm("작성중이던 글을 취소하시겠습니까?")){
			window.history.back();			
		}
	}

</script>








