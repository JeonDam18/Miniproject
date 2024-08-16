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
	
		String BOARDNO = request.getParameter("BOARDNO");
		Statement stmt = null;
		
		try{ 
			stmt = conn.createStatement();
			String querytext = "DELETE FROM TBL_EBOARD WHERE BOARDNO="+BOARDNO;
			stmt.executeUpdate(querytext);
			
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
		response.sendRedirect("ex_border.jsp");
	%>
</body>
</html>