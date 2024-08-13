<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="ex-db.jsp"%>
	<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String addr = request.getParameter("address");
		String nickname = request.getParameter("nickname");
		String motherLang = request.getParameter("motherLang");
		String exchangeLang = request.getParameter("exchangeLang");
		String time = request.getParameter("time");
		String intro = request.getParameter("intro");
		Statement stmt = null;
		
		try{ 
			stmt = conn.createStatement();
			String querytext = "INSERT INTO TBL_EUSER(USERID,USERPWD,USEADDR,MOTHERLANG,EXCHANGELANG,NICKNAME,PRETIME,INTRODUCE)"
					+ "VALUES('"+ id +"','"+pwd+"','"+ addr +"','"+motherLang+"','"+exchangeLang+"','"+nickname+"','"+time+"','"+intro+"')";
			stmt.executeUpdate(querytext);
			out.println("저장되었습니다.");
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
		response.sendRedirect("ex_login.jsp");
	%>
</body>
</html>