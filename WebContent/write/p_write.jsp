<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>N-FRAME::WRITE</title>
</head>
<body>
<%@ include file="../dbconn.jsp" %>
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
	
	String category = conCase.getParameter("n_cate");
	String title = conCase.getParameter("n_tit");
	String author = conCase.getParameter("n_author");
	String context = conCase.getParameter("n_con");
	String link = conCase.getParameter("n_link");
	String fileName = conCase.getFilesystemName(fname);

	sql = "INSERT INTO NFRAME VALUES(NFRAME_SEQ.NEXTVAL, ?, ?, ?, ?, SYSDATE, ?, ?)";
	ps = conn.prepareStatement(sql);
	ps.setString(1, title);
	ps.setString(2, category);
	ps.setString(3, context);
	ps.setString(4, author);
	if(fileName == null)
		ps.setString(5, defaultFile);
	else
		ps.setString(5, fileName);
	ps.setString(6, link);
	ps.executeUpdate();
	
	if(ps != null)
		ps.close();
	if(conn != null)
		conn.close();
	
	response.sendRedirect("../home/index.jsp");
	
%>
</body>
</html>