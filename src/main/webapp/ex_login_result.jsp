<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인 결과</title>
</head>
<body>
	<%@ include file="ex-db.jsp"%>
	<%
	String id = request.getParameter("userId");
	String pwd = request.getParameter("pwd");

	ResultSet rs = null;
	Statement stmt = null;
	try {
		stmt = conn.createStatement();
		String querytext = "SELECT * FROM TBL_EUSER WHERE USERID='" + id + "'";
		rs = stmt.executeQuery(querytext);

		if (rs.next()) {
			if (rs.getString("USERPWD").equals(pwd)) {
		// 로그인 성공
		session.setAttribute("userId", rs.getString("USERID"));
		out.println(
				"<script>window.onload = function() { handleLoginResult('로그인 성공!', 'ex_main.jsp'); };</script>");
			} else {
		out.println(
				"<script>window.onload = function() { handleLoginResult('비밀번호가 틀립니다!', 'ex_login.jsp'); };</script>");
			}
		} else {
			out.println(
			"<script>window.onload = function() { handleLoginResult('아이디가 존재하지 않습니다!', 'ex_login.jsp'); };</script>");
		}
	} catch (SQLException ex) {
		out.println("<script>window.onload = function() { handleLoginResult('서버 오류: " + ex.getMessage()
		+ "', 'ex_login.jsp'); };</script>");
	} finally {
		try {
			if (rs != null)
		rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if (stmt != null)
		stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if (conn != null)
		conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	%>
	<script>
		function handleLoginResult(message, redirectUrl) {
			alert(message);
			if (window.opener && !window.opener.closed) {
				window.opener.location.href = redirectUrl; // Redirect the parent window
			} else {
				window.location.href = redirectUrl;
			}
			window.close(); // Close the popup
		}
	</script>
</body>
</html>