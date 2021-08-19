<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.News" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>N-FRAME::ECONOMY</title>
</head>
<body>
<%@ include file="../header.jsp" %>

  <!-- SECTION-NEWS-CONTENT -->
  <section class="news-content">
    <div class="inner">
        <h1 class="tit">경제</h1>
<%@ include file="../dbconn.jsp" %>
      <ul class="news-wrap">
    		<%
    			sql = "SELECT * FROM NFRAME WHERE N_CATE = '경제' ORDER BY N_NUM DESC";
    			ps = conn.prepareStatement(sql);
    			rs = ps.executeQuery();
    			
    			while(rs.next()){
    				News news = new News();
    				news.setN_num(rs.getString("n_num"));
    				news.setN_cate(rs.getString("n_cate"));
    				news.setN_tit(rs.getString("n_tit"));
    				news.setN_author(rs.getString("n_author"));
    				news.setN_date(rs.getDate("n_date"));
    				news.setN_pic(rs.getString("n_pic"));
    		%>
        <li class="news-card">
          <a href="../news/news.jsp?num=<%=news.getN_num() %>" class="news">
          <div class="news-pic">
          	<div class="halftone"></div>
          	<img src="../img/<%=news.getN_pic() %>" />
          </div>
          <div class="news-txt">
            <div class="news-cate"><%=news.getN_cate() %></div>
            <div class="news-tit"><%=news.getN_tit() %></div>
            <div class="news-txt-inner">
              <div class="news-author"><%=news.getN_author() %></div>
              <div class="news-date"><%=news.getN_date()%></div>
            </div>
          </div>
        </a>
        </li>
  <%
  }
	if(rs != null)
		rs.close();
	if(ps != null)
		ps.close();
	if(conn != null)
		conn.close();
	%>
      </ul>
    </div>
  </section>
<%@ include file="../footer.jsp" %>
</body>
</html>