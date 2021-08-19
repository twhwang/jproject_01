<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>NFRAME::USER INFO</title>
</head>
<body>
<%@ include file="../header.jsp" %>
<section class="userInfo">
	<div class="inner">
		<%
			String msg = request.getParameter("msg");

			if (msg != null) {
				if (msg.equals("0"))
					out.println("<div class='welcome'>회원가입을 축하합니다!</div>");
				}
		%>
	</div>
</section>
<%@ include file="../footer.jsp" %>
</body>
</html>