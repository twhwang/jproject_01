<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NFRAME::MODIFY NEWS</title>
<script defer src="../js/valitation.js"></script>
</head>
<body>
<%@ include file="../header.jsp" %>
<!-- SECTION-WRITE -->
  <section class="write">
      <div class="write-header">
          <div class="inner">
            기사 수정
          </div>
      </div>
      <div class="inner">
    <%@ include file="../dbconn.jsp" %>
    <%
	String num = request.getParameter("num");
    
	sql = "SELECT * FROM NFRAME WHERE N_NUM=?";
	ps = conn.prepareStatement(sql);
	ps.setString(1, num);
	rs = ps.executeQuery();
	if(rs.next()){
    %>
          <form name="writeNews" action="./p_modify.jsp" method="POST" enctype="multipart/form-data" class="write-news">
            <input type="hidden" name = "n_num" value="<%=num %>">
            <div class="form-wrap">
                <label for="news-category">카테고리</label>
                <div class="header-cate"><%=rs.getString("n_cate") %></div>
            </div>
            <div class="form-wrap">
                <label for="news-title">기사 제목</label>
                <input type="text" name="n_tit" id="news-title" class="text-input" value="<%=rs.getString("n_tit")%>"  required onchange="checkTit()" />
                <p class="valitation valitation_1"></p>
            </div>
            <div class="form-wrap">
                <label for="news-title">작성자</label>
                <input type="text" name="n_author" id="news-author" class="text-input" value="<%=rs.getString("n_author")%>"  required onchange="checkAuthor()" />
                <p class="valitation valitation_2"></p>
            </div>
            <div class="form-wrap">
                <label for="news-picture">사진 첨부</label>
                <input type="file" name="n_pic" id="news-picture" class="text-input file-input" value="<%=rs.getString("n_pic")%>" onchange="setThumb(event)" accept="image/jpeg, image/jpg, image/png">
            </div>
            <div class="form-wrap">
                <div class="pic-view" style="background: url('../img/<%=rs.getString("n_pic")%>');"></div>
            </div>
            <div class="form-wrap">
                <label for="news-context">기사 본문</label>
                <textarea name="n_con" id="news-context" class="text-area"  cols="100" wrap="hard"  required onchange="checkContext()"><%=rs.getString("n_con")%></textarea>
                <p class="valitation valitation_3"></p>
            </div>
            <div class="form-wrap">
                <label for="news-link">참조 링크</label>
                <input type="url" name="n_link" id="news-link" class="text-input" value="<%=rs.getString("n_link")%>">
            </div>
            <div class="btn-group">
                <input type="submit" value="확인" name="news-confirm" id="news-confirm" class="btn btn--basic" />
                <input type="button" value="취소" name="news-cancel" class="btn btn--red" onclick="wClear()" />
            </div>
        </form>
      </div>
    		<%
    		}
		if(rs != null)
			rs.close();
		if(ps != null)
			ps.close();
		if(conn != null)
			conn.close();
    		%>
  </section>
<%@ include file="../footer.jsp" %>
</body>
</html>