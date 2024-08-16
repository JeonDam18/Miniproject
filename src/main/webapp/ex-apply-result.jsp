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
		String appliedId = request.getParameter("APPLIEDID");
		String applyId = (String)session.getAttribute("userId");
		
		Statement stmt = null;
		try{
			stmt = conn.createStatement();
			String querytext = "INSERT INTO TBL_APPLY VALUES('"+applyId+"','"+appliedId+"')";
			stmt.executeUpdate(querytext);
			out.println("저장되었습니다.");
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
		response.sendRedirect("ex_applyList.jsp");
	%>
</body>
</html>