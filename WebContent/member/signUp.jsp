<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NFRAME::SIGN-UP</title>
  <!-- 초기화 CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.css" />
  <!-- Icon CSS -->
  <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
  <!-- Fonts CSS -->
  <link rel="stylesheet" href="../css/fonts.css">
  <!-- Custom CSS -->
  <link rel="stylesheet" href="../css/common.css">
  <script defer src="../js/common.js"></script>
<!--   <script defer src="../js/valitation.js"></script> -->
</head>
<body>
    <div id="allwrap">
    	<div class="halftone"></div>
        <div class="loginBox">
            <a href="../home/" class="logo">
                <div class="main-logo">NFRAME</div>
                <div class="side-logo">NEWS MAGAZINE</div>
              </a>
            <form action="../member/p_signUp.jsp" method="POST" name="signUp">
                <div class="form-wrap">
                    <label for="sign_id">ID</label>
                    <input type="text" name="id" id="sign_id" class="text-input" required autofocus placeholder="아이디 입력" onchange="checkId(id)" />
                    <p class="valitation valitation_id"></p>
                </div>
                <div class="form-wrap">
                    <label for="sign_pw">PW</label>
                    <input type="password" name="pw" id="sign_pw" class="text-input" required placeholder="비밀번호 입력" onchange="checkPw(pw)" />
                    <p class="valitation valitation_pw"></p>
                </div>
                <div class="form-wrap">
                    <label for="sign_pw_c">PW 확인</label>
                    <input type="password" name="pw_confirm" id="sign_pw_c" class="text-input" required placeholder="비밀번호 확인" onchange="checkPwc()" />
                    <p class="valitation valitation_pwc"></p>
                </div>
                <div class="form-wrap">
                    <label for="sign_name">이름</label>
                    <input type="text" name="name" id="sign_name" class="text-input" required placeholder="이름 입력" onchange="checkName(name)" />
                    <p class="valitation valitation_name"></p>
                </div>
                <div class="form-wrap">
                    <label for="sign_mail">이메일</label>
                    <input type="email" name="mail" id="sign_mail" class="text-input" placeholder="이메일 입력" onchange="checkMail(mail)" />
                    <p class="valitation valitation_mail"></p>
                </div>
                <div class="btn-group">
                    <input type="submit" value="가입완료" name="sign-confirm" id="news-confirm" class="btn btn--basic" />
                    <input type="reset" value="초기화" name="sign-rest" class="btn btn--dark" />
                    <input type="button" value="가입취소" name="sign-cancel" class="btn btn--red" onclick="signUpClear()" />
                </div>
            </form>
        </div>
    </div>
</body>
</html>