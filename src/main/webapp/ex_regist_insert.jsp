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
	<%@ page import="java.io.*, java.util.*, javax.servlet.*"%>
	<%
	    String uploadPath = request.getServletContext().getRealPath("/") + "img/"; // 원하는 경로 여기를 직접 바라보는 경우 서버에 저장이 되어있음으로 직접 접근이 불가능하여 url로 접근해야한다.
	    System.out.println("upload ==> " + uploadPath);
	    // 해당 폴더 없으면 생성해 줌
	    File uploadDir = new File(uploadPath);
	    if (!uploadDir.exists()) {
	        uploadDir.mkdir();
	    }
	
	    String fileName = "";
	    String responseMessage = "";
	    String imageUrl = "";
	    try {
	        for (Part part : request.getParts()) {
	            fileName = getFileName(part);
	            if (!fileName.isEmpty()) {
	                String uniqueFileName = generateUniqueFileName(uploadPath, fileName);
	                part.write(uploadPath + uniqueFileName);
	                responseMessage = "파일 업로드 완료: " + uniqueFileName;
	                imageUrl = request.getContextPath() + "/img/" + uniqueFileName;
	            }
	        }
	    } catch (Exception e) {
	        responseMessage = "파일 업로드 실패: " + e.getMessage();
	    }
	    out.println(responseMessage);
	    
	%>
	<%!
	    private String getFileName(Part part) {
	        for (String content : part.getHeader("content-disposition").split(";")) {
	            if (content.trim().startsWith("filename")) {
	                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
	            }
	        }
	        return "";
	    }
	
		//중복된 이름을 체크하여 인덱스를 부여해서 기존 이름이 중복된 이름이 있다면 _index로 아이디 부여
	    private String generateUniqueFileName(String uploadPath, String fileName) {
	        File file = new File(uploadPath + fileName);
	        if (!file.exists()) {
	            return fileName;
	        }
	
	        String name = fileName;
	        String extension = "";
	        int dotIndex = fileName.lastIndexOf('.');
	        if (dotIndex != -1) {
	            name = fileName.substring(0, dotIndex);
	            extension = fileName.substring(dotIndex);
	        }
	
	        int counter = 1;
	        while (file.exists()) {
	            file = new File(uploadPath + name + "_" + counter + extension);
	            counter++;
	        }
	        return name + "_" + (counter - 1) + extension;
	    }
	%>
	<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String addr = request.getParameter("address");
		String nickname = request.getParameter("nickname");
		String motherLang = request.getParameter("motherLang");
		String exchangeLang = request.getParameter("exchangeLang");
		String time = request.getParameter("time");
		String intro = request.getParameter("intro");
		out.println(imageUrl);
		Statement stmt = null;
		
		try{ 
			stmt = conn.createStatement();
			String querytext = "INSERT INTO TBL_EUSER(USERID,USERPWD,USEADDR,MOTHERLANG,EXCHANGELANG,NICKNAME,PRETIME,INTRODUCE,SELFIE)"
					+ "VALUES('"+ id +"','"+pwd+"','"+ addr +"','"+motherLang+"','"+exchangeLang+"','"+nickname+"','"+time+"','"+intro+"','"+imageUrl+"')";
			stmt.executeUpdate(querytext);
			out.println("저장되었습니다.");
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
		 response.sendRedirect("ex_login.jsp");
	%>
</body>
</html>