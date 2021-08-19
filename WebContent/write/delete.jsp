<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NFRAME::DELETE</title>
</head>
<body>
<%@ include file="../dbconn.jsp" %>
<%
	String num = request.getParameter("num");

	sql = "SELECT * FROM NFRAME";
	ps = conn.prepareStatement(sql);
	rs = ps.executeQuery();
	
	if(rs.next()){
		sql = "DELETE FROM NFRAME WHERE N_NUM=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, num);
		ps.executeUpdate();
	} else{
		out.println("삭제할 기사가 없습니다.");
	}

	if(rs != null)
		rs.close();
	if(ps != null)
		ps.close();
	if(conn != null)
		conn.close();
	
	response.sendRedirect("../home/index.jsp");
	
%>
</body>
</html>