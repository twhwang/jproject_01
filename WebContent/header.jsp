<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.News" %>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>N-FRAME::HEADER</title>
  <!-- 초기화 CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.css" />
  <!-- Icon CSS -->
  <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
  <!-- Swiper CSS -->
  <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
  <!-- Fonts CSS -->
  <link rel="stylesheet" href="../css/fonts.css">
  <!-- Custom CSS -->
  <link rel="stylesheet" href="../css/common.css">
  <!-- Swiper JS -->
  <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
  <!-- Custom JS -->
  <script defer src='../js/common.js'></script>
</head>
<body>
<%
	String seesionId = (String)session.getAttribute("sessionId");
%>
  <!-- HEADER  -->
  <header>
    <div class="inner">
      <div class="top-line dflex">
        <a href="../home/" class="logo">
          <div class="main-logo">NFRAME</div>
          <div class="side-logo">NEWS MAGAZINE</div>
        </a>
      </div>
      <div class="mid-line dflex">
        <div class="time-now">시간 불러오는 중...</div>
        <ul class="main-nav dflex">
          <li><a href="../home/">HOME</a></li>
          <li><a href="../it/">IT</a></li>
          <li><a href="../econo/">경제</a></li>
          <li><a href="../culture/">문화</a></li>
          <li><a href="../edu/">교육</a></li>
          <li><a href="../life/">라이프</a></li>
        </ul>
        <div class="write-form">
        <c:choose>
        	<c:when test="${empty sessionId}">
        		<a class="btn btn--reverse" href="../home/login.jsp">로그인 &raquo;</a>
        		<a class="btn btn--reverse" href="../member/signUp.jsp">회원가입 &raquo;</a>
        	</c:when>
        	<c:otherwise>
        		<a class="btn btn--red" href="../home/logout.jsp">로그아웃 &raquo;</a>
        		<a class="btn btn--reverse" href="../write/write.jsp">기사 작성 &raquo;</a>
        	</c:otherwise>
        </c:choose>
        </div>
      </div>
    </div>
  </header>
</body>
</html>