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
	
		String fqno = request.getParameter("fqno");
		Statement stmt = null;
		
		try{ 
			stmt = conn.createStatement();
			String querytext = "DELETE FROM TBL_EFQ WHERE FQNO="+fqno;
			stmt.executeUpdate(querytext);
			
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
		response.sendRedirect("ex_f&q.jsp");
	%>
</body>
</html>