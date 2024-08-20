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
		String title = request.getParameter("title");
		String fqno = request.getParameter("fqno");
		String category = request.getParameter("category");
		String content = request.getParameter("content");
		String userId = (String)session.getAttribute("userId");
		
		Statement stmt = null;
		try{
			stmt = conn.createStatement();
			String querytext = "UPDATE TBL_EFQ SET FQTITLE='"+title+"',FQCONTENTS='"+content+"',FQCATEGORY='"+category+"',UDATETIME=SYSDATE WHERE FQNO="+fqno;
			stmt.executeUpdate(querytext);
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
		response.sendRedirect("ex_f&q.jsp");
	%>
</body>
</html>