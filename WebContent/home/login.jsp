<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NFRAME::LOGIN</title>
  <!-- 초기화 CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.css" />
  <!-- Icon CSS -->
  <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
  <!-- Fonts CSS -->
  <link rel="stylesheet" href="../css/fonts.css">
  <!-- Custom CSS -->
  <link rel="stylesheet" href="../css/common.css">
</head>
<body>
    <div id="allwrap">
    	<div class="halftone"></div>
        <div class="loginBox">
            <a href="../home/" class="logo">
                <div class="main-logo">NFRAME</div>
                <div class="side-logo">NEWS MAGAZINE</div>
              </a>
            <form action="../member/p_login.jsp" method="POST">
                <div class="form-wrap">
                    <label for="log_id">ID</label>
                    <input type="text" name="id" id="log_id" class="text-input" required autofocus placeholder="아이디 입력" />
                </div>
                <div class="form-wrap">
                    <label for="log_pw">PW</label>
                    <input type="password" name="pw" id="log_pw" class="text-input" required placeholder="비밀번호 입력" />
                </div>
                <div class="btn-group">
                    <input type="submit" value="로그인" name="login-confirm" id="news-confirm" class="btn btn--basic" />
                    <input type="button" value="취소" name="login-cancel" class="btn btn--red" onclick="history.go(-1)" />
                </div>
            </form>
    		<%
    			String error = request.getParameter("error");
    		if(error != null){
    			out.println("<div class='login_error'>");
    			out.println("ID와 PW를 확인해 주세요.");
    			out.println("</div>");
    		}
    		%>
        </div>
    </div>
</body>
</html>