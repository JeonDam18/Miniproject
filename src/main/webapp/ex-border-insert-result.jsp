<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8");%>
	<%@include file="ex-db.jsp"%>
	<%
		String title = request.getParameter("title");
		String category = request.getParameter("category");
		String contents = request.getParameter("contents");
		String userId = (String)session.getAttribute("userId");
		
		Statement stmt = null;
		try{
			stmt = conn.createStatement();
			String querytext = "INSERT INTO TBL_EBOARD(USERID,CONTENTS,TITLE,CATEGORY1,CDATETIME,UDATETIME) VALUES('"+userId+"','"+contents+"','"+title+"','"+category+"',SYSDATE,SYSDATE)";
			stmt.executeUpdate(querytext);
			out.println("저장되었습니다.");
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
		response.sendRedirect("ex_border.jsp");
	%>
</body>
</html>