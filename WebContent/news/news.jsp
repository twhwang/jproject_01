<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.News" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>N-FRAME::NEWS</title>
</head>
<body>
<%@ include file="../header.jsp" %>
  <!-- SECTION-NEWS-CONTENT -->
  <section class="news-content">
    <div class="inner">
<%@ include file="../dbconn.jsp" %>
<%

String num = request.getParameter("num");
sql = "SELECT * FROM NFRAME WHERE N_NUM=?";
ps = conn.prepareStatement(sql);
ps.setString(1, num);
rs = ps.executeQuery();

if(rs.next()){
	News news = new News();
	news.setN_cate(rs.getString("n_cate"));
	news.setN_tit(rs.getString("n_tit"));
	news.setN_author(rs.getString("n_author"));
	news.setN_date(rs.getDate("n_date"));
	news.setN_num(rs.getString("n_num"));
	news.setN_pic(rs.getString("n_pic"));
	news.setN_con(rs.getString("n_con"));
	news.setN_link(rs.getString("n_link"));
	
	String ca = news.getN_cate();
	
%>
        <div class="news-header">
            <div class="header-cate"><%=news.getN_cate() %></div>
            <div class="header-tit"><%=news.getN_tit() %></div>
            <div class="header-info">
                <div class="hinfo hinfo-author"><%=news.getN_author() %></div>
                <div class="hinfo hinfo-date"><%=news.getN_date() %></div>
                <div class="hinfo hinfo-num">기사 번호 : <%=news.getN_num() %></div>
            </div>
        </div>
        <div class="news-context">
            <div class="news-img">
                <img src="../img/<%=news.getN_pic() %>" alt="">
            </div>
            <div class="news-text">
                <%=news.getN_con() %>
            </div>
            <div class="news-link">
                <span>참조 링크 : </span>
                <a href="<%=news.getN_link() %>" target="_blank"><%=news.getN_author() %></a>
            </div>
        </div>
        <div class="news-btns dflex">
        <c:choose>
        	<c:when test="${empty sessionId}">
        	</c:when>
        	<c:otherwise>
            <a href="../write/modify.jsp?num=<%=news.getN_num()%>" class="btn btn--basic">수정</a>
            <a href="javascript:void(0)" class="btn btn--red" onclick="deleteNews('<%=news.getN_num()%>')">삭제</a>
        	</c:otherwise>
        </c:choose>
            <%if(ca.equals("IT")){%>
            <a href="../it/index.jsp" class="btn btn--dark">목록</a>
            <% } else if(ca.equals("경제")){%>
            <a href="../econo/index.jsp" class="btn btn--dark">목록</a>
            <% } else if(ca.equals("문화")){%>
            <a href="../culture/index.jsp" class="btn btn--dark">목록</a>
            <% } else if(ca.equals("교육")){%>
            <a href="../edu/index.jsp" class="btn btn--dark">목록</a>
            <% } else if(ca.equals("라이프")){%>
            <a href="../life/index.jsp" class="btn btn--dark">목록</a>
            <% } %>
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
    </div>
  </section>
<%@ include file="../footer.jsp" %>
</body>
</html>