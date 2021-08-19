<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB_Connection</title>
</head>
<body>
	<%
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String sql = null;
		try{
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "htw";
			String pw = "1234";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pw);
			
		} catch (SQLException e){
			out.println("데이터베이스 연결에 실패했습니다.<br>");
			out.println("SQLException : " + e.getMessage());
		} 
	%>
</body>
</html>