<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.News" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>N-FRAME</title>
</head>
<body>
<%@ include file="../header.jsp" %>

  <!-- HEADLINE -->
  <div class="btm-line">
    <div class="inner">
      <h3 class="head-title">헤드라인 뉴스</h3>
      <div class="swiper-container head-context">
        <div class="swiper-wrapper">
<%@ include file="../dbconn.jsp" %>
<%
    			sql = "SELECT * FROM (SELECT * FROM NFRAME) WHERE ROWNUM <=10";
    			ps = conn.prepareStatement(sql);
    			rs = ps.executeQuery();
    			
    			while(rs.next()){
    				News news = new News();
    				news.setN_cate(rs.getString("n_cate"));
    				news.setN_tit(rs.getString("n_tit"));
%>
          <div class="swiper-slide">
            <a href="javascripit:void(0)">
            <%=news.getN_tit() %>
            </a>
          </div>
<%}%>
        </div>
      </div>
    </div>
  </div>

  <section class="news-main">
    <div class="inner">
      <h1 class="tit">최신 뉴스</h1>
      <ul class="news-wrap">

<%
    			sql = "SELECT * FROM (SELECT * FROM NFRAME ORDER BY N_NUM DESC) WHERE ROWNUM <=2";
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
  <%}%>
      </ul>
    </div>
  </section>
  
  <!-- SECTION-VISUAL -->
  <section class="visual">
    <div class="inner">
      <div class="d-inner">
        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Expedita magnam hic quasi dolores distinctio eligendi quo saepe rerum, iusto omnis alias illum autem, ipsam quaerat. Iusto natus amet cupiditate! Soluta.
      </div>
    </div>
  </section>
  
  <!-- SECTION-NEWS-CONTENT -->
  <section class="news-content">
    <div class="inner">
    <h1 class="tit">전체 뉴스</h1>
      <ul class="news-wrap">
<%
    			sql = "SELECT * FROM (SELECT * FROM NFRAME ORDER BY N_NUM DESC) WHERE ROWNUM <=15 AND ROWNUM BETWEEN 1 AND 15";
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