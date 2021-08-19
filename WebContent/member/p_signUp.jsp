<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String mail = request.getParameter("mail");

	Date currentDatetime = new Date(System.currentTimeMillis());
	java.sql.Date sqlDate = new java.sql.Date(currentDatetime.getTime());
	java.sql.Timestamp timestamp = new java.sql.Timestamp(currentDatetime.getTime());
%>
<sql:setDataSource var="dataSource"
	url="jdbc:oracle:thin:@localhost:1521:xe"
	driver="oracle.jdbc.driver.OracleDriver" user="htw" password="1234" />
	
<sql:update dataSource="${dataSource}" var="resultSet">
   INSERT INTO MEMBER VALUES (?, ?, ?, ?, ?)
   <sql:param value="<%=id%>" />
	<sql:param value="<%=pw%>" />
	<sql:param value="<%=name%>" />
	<sql:param value="<%=mail%>" />
	<sql:param value="<%=timestamp%>" />
</sql:update>

<c:if test="${resultSet>=1}">
	<c:redirect url="resultView.jsp?msg=0" />
</c:if>