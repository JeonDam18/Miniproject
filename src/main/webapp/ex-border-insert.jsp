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
        .border-contents-update-body {
            margin: 0;
            font-family: PTBandocheB, sans-serif;
        }

        .border-contents-update-container {
            width: 800px;
            margin: 50px auto;
            background-color: rgb(235, 222, 206);
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

        .border-contents-update input[type="textarea"] {
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

        button {
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

        button:hover {
            background-color: #e4ce6c;
        }
        #content{
            width: 100%; /* 가로 크기를 부모 요소에 맞추기 */
            height: 150px; /* 세로 크기 지정 */
        }
    </style>
</head>
<body class="border-contents-update-body">

    <div class="border-contents-update-container">
        <div class="border-contents-update-title">
            <form action="ex-border-insert-result.jsp">
            Title : <input type="text" id="title" name="title" placeholder="제목을 입력하세요">
        </div>
        <div class="contents-header">
            <div>
                Category :
                <select id="category-select" name="category">
                    <option value="">--Please choose an option--</option>
                    <option value="언어교환">언어교환/exchange</option>
                    <option value="자유게시판">자유게시판/anything</option>
                </select>
            </div>
        </div>
        <div class="border-contents-update">
            <textarea id="content" name="contents" placeholder="내용을 입력하세요"></textarea>
        </div>
        <div class="border-contents-update-button">
            <button type="submit">입력(enter)</button>
            <button>취소(Cancel)</button>
            </form>
        </div>
    	</div>

    <script>
        document.getElementById('category-select').addEventListener('change', function() {
            var category = this.value;
            var content = '';

            if (category === 'exchange') {
                content = '언어교환은 원하는 시간을 적어주세요~. Please write down your preferred time.';
            } else if (category === 'anything') {
                content = '자유게시판입니다 Do not use bad word.';
            } else {
                content = '내용을 입력하세요.';
            }
            document.getElementById('content').value = content;
        });
    </script>
</body>
</html>