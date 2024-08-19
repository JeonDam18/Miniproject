<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        /* 전체 푸터 스타일 */
        #footer-container {
            width: 100%;
            height: 200px;
            background-color: rgb(143, 143, 143);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color: rgb(221, 221, 221);
            box-sizing: border-box;
            padding: 20px;
            text-align: center;
        }

        /* 소셜 미디어 아이콘 스타일 */
        .social-icons {
            margin-bottom: 10px;
        }

        .social-icon {
            width: 40px;
            height: 40px;
            display: inline-block;
            margin: 0 10px;
            background-repeat: no-repeat;
            background-size: cover;
        }

        .facebook {
            background-image: url(images/facebook-logo.png);
        }

        .instagram {
            background-image: url(images/instagram-logo.png);
        }

        .twitter {
            background-image: url(images/twitter-logo.png);
        }

        /* 푸터 텍스트 스타일 */
        #footer-text {
            font-size: 14px;
        }

        /* 링크 스타일 */
        .footer-link {
            color: rgb(190, 189, 189);
            text-decoration: none;
            margin: 0 5px;
        }

        .footer-link:hover {
            text-decoration: underline;
        }
        #footer-body{
        	margin: 0;
		    padding: 0;
		    min-height: 100vh; /* 화면 전체를 채우도록 설정 */
		    position: relative; /* 푸터를 화면 하단에 고정시키기 위해 필요 */
		 }
    </style>
</head>
<body id="footer-body">
    <div id="footer-container">
        <div class="social-icons">
            <a href="https://www.facebook.com/zuck/?locale=ko_KR" class="social-icon facebook" aria-label="Facebook"></a>
            <a href="https://www.instagram.com/kevin/" class="social-icon instagram" aria-label="Instagram"></a>
            <a href="https://x.com/elonmusk" class="social-icon twitter" aria-label="Twitter"></a>
        </div>
        <div>
            <a href="#" class="footer-link" onclick="fnNothing()">회사소개</a> |
            <a href="#" class="footer-link" onclick="fnNothing()">인재채용</a> |
            <a href="#" class="footer-link" onclick="fnNothing()">제휴제안</a> |
            <a href="#" class="footer-link" onclick="fnNothing()">이용약관</a> |
            <a href="#" class="footer-link" onclick="fnNothing()">개인정보처리방침</a> |
            <a href="#" class="footer-link" onclick="fnNothing()">청소년보호정책</a>
        </div>
        <div id="footer-text">
            &copy; 문ture. 모든 권리 보유.
        </div>
    </div>
</body>
</html>
<script>
	function fnNothing(){
		alert("아무기능없지롱");
	}
</script>