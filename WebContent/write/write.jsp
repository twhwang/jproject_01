<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>N-FRAME::WRITE</title>
<script defer src="../js/valitation.js"></script>
</head>
<body>
<%@ include file="../header.jsp" %>
  <!-- SECTION-WRITE -->
  <section class="write">
      <div class="write-header">
          <div class="inner">
            기사 작성
          </div>
      </div>
      <div class="inner">
          <form name="writeNews" action="./p_write.jsp" method="POST" enctype="multipart/form-data" class="write-news">
            <div class="form-wrap">
                <label for="news-category">카테고리</label>
                <select name="n_cate" id="news-category" class="select-input">
                    <option value="IT">IT</option>
                    <option value="경제">경제</option>
                    <option value="문화">문화</option>
                    <option value="교육">교육</option>
                    <option value="라이프">라이프</option>
                </select>
            </div>
            <div class="form-wrap">
                <label for="news-title">기사 제목</label>
                <input type="text" name="n_tit" id="news-title" class="text-input"  required onchange="checkTit()" />
                <p class="valitation valitation_1"></p>
            </div>
            <div class="form-wrap">
                <label for="news-title">작성자</label>
                <input type="text" name="n_author" id="news-author" class="text-input" required onchange="checkAuthor()" />
                <p class="valitation valitation_2"></p>
            </div>
            <div class="form-wrap">
                <label for="news-picture">사진 첨부</label>
                <input type="file" name="n_pic" id="news-picture" class="text-input file-input"  onchange="setThumb(event)" accept="image/jpeg, image/jpg, image/png" />
            </div>
            <div class="form-wrap">
                <div class="pic-view"></div>
            </div>
            <div class="form-wrap">
                <label for="news-context">기사 본문</label>
                <textarea name="n_con" id="news-context" class="text-area" cols="100" wrap="hard"  required onchange="checkContext()"></textarea>
                <p class="valitation valitation_3"></p>
            </div>
            <div class="form-wrap">
                <label for="news-link">참조 링크</label>
                <input type="url" name="n_link" id="news-link" class="text-input" />
            </div>
            <div class="btn-group">
                <input type="submit" value="확인" name="news-confirm" id="news-confirm" class="btn btn--basic" />
                <input type="button" value="취소" name="news-cancel" class="btn btn--red" onclick="wClear()" />
            </div>
        </form>
      </div>
  </section>
<%@ include file="../footer.jsp" %>
</body>
</html>