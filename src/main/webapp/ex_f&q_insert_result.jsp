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
	String category = request.getParameter("category");
	String content = request.getParameter("content");
	String userId = (String)session.getAttribute("userId");
	ResultSet rs = null;
	Statement stmt = null;
	try{
		stmt = conn.createStatement();
		String querytext = "INSERT INTO TBL_EFQ(USERID,FQCONTENTS,FQTITLE,FQCATEGORY,CDATETIME,UDATETIME)"+
						   " VALUES ('admin','"+content+"','"+title+"','"+category+"',SYSDATE,SYSDATE)";
		stmt.executeUpdate(querytext);
	}catch(SQLException ex) {
				out.println("SQLException : " + ex.getMessage());
			}
		response.sendRedirect("ex_f&q.jsp");

%> 
</body>
</html>