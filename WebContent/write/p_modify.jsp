<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NFRAME::MODIFY NEWS</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String filename = " ";
	String defaultFile = "default.jpg";
	String fileFolder = application.getRealPath("img/");
	int maxSize = 5 * 1024 * 1024;
	String encType = "UTF-8";
	
	MultipartRequest conCase = new MultipartRequest(request, fileFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	Enumeration files = conCase.getFileNames();
	String fname = (String)files.nextElement();
	
	String num = conCase.getParameter("n_num");
	String title = conCase.getParameter("n_tit");
	String author = conCase.getParameter("n_author");
	String context = conCase.getParameter("n_con");
	String link = conCase.getParameter("n_link");
	String fileName = conCase.getFilesystemName(fname);
	
	sql = "SELECT * FROM NFRAME WHERE N_NUM=?";
	ps = conn.prepareStatement(sql);
	ps.setString(1, num);
	rs = ps.executeQuery();
	
	if(rs.next()){
		if(fileName != null){
			sql = "UPDATE NFRAME SET N_TIT=?, N_CON=?, N_AUTHOR=?, N_PIC=?, N_LINK=? WHERE N_NUM=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, context);
			ps.setString(3, author);
			ps.setString(4, fileName);
			ps.setString(5, link);
			ps.setString(6, num);
			ps.executeUpdate();
		} else{
			sql = "UPDATE NFRAME SET N_TIT=?, N_CON=?, N_AUTHOR=?, N_LINK=? WHERE N_NUM=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, context);
			ps.setString(3, author);
			ps.setString(4, link);
			ps.setString(5, num);
			ps.executeUpdate();
		}
	}

	if(rs != null)
		rs.close();
	if(ps != null)
		ps.close();
	if(conn != null)
		conn.close();

	response.sendRedirect("../news/news.jsp?num="+num);
%>
</body>
</html>