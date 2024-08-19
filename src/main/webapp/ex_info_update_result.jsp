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
		String address = request.getParameter("address");
		String nickname = request.getParameter("nickname");
		String motherLang = request.getParameter("motherLang");
		String exchangeLang = request.getParameter("exchangeLang");
		String time = request.getParameter("time");
		String intro = request.getParameter("intro");
		String userId = (String)session.getAttribute("userId");
		
		Statement stmt = null;
		try{
			stmt = conn.createStatement();
			String querytext = "UPDATE TBL_EUSER SET USEADDR = '" + address + "', " +
                    "NICKNAME = '" + nickname + "', " +
                    "MOTHERLANG = '" + motherLang + "', " +
                    "EXCHANGELANG = '" + exchangeLang + "', " +
                    "PRETIME = '" + time + "', " +
                    "INTRODUCE = '" + intro + "' " +
                    "WHERE USERID = '" + userId + "'";
			out.println("Executing query: " + querytext);
			stmt.executeUpdate(querytext);
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
		response.sendRedirect("ex_main.jsp");
	%>
</body>
</html>