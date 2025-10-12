<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>


<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>극장 티켓팅</title>
  
 <script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.1.js"></script>
   <style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
html, body {
  height: 100%;
  display: flex;
  flex-direction: column;
  margin: 0;
}
body {
  font-family: 'Arial', sans-serif;
}
section{
    width: 1200px;
    margin: auto;
    flex: 1;
    margin-bottom: 30px;
}
main {
  flex: 1;
  background: url('<%=request.getContextPath()%>/resources/img/배경.jpg');
  background-size: cover;
  padding: 50px 0;
}
.movies h2 {
  margin-top: 50px;
  margin-bottom: 20px;
  text-align: left;
  color: white;
}

.movie-list {
 /*고친부분*/
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
  justify-content: space-between;
}

.movie-card {
  /*고친부분*/
  flex: 0 0 calc(25% - 20px); /* 한 행에 4개씩 */
  box-sizing: border-box;
  border-radius: 10px;
  overflow: hidden;
  text-align: center;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.movie-card img {
/*고친부분*/
  width: 100%;
  height: 70%;
}

.movie-card img:hover {
  transform: scale(1.05);
  transition: transform .5s;
  overflow: hidden;
}

.movie-info {
  padding: 10px;
  background-color: sandybrown;
  /*고친부분*/
  width:100%;
  height:30%;
}

.movie-info h3 {
  margin: 10px 0;
  font-size: 0.8em;
}

.movie-info p {
  font-size: 0.9em;
}
.button {
  background-color: #0078d4;
  color: white;
  border: none;
  padding: 10px 20px;
  cursor: pointer;
  border-radius: 5px;
  margin-top: 10px;
}
.hidden{
  display: none;
}
.visible {
  display: block;
}
.button:hover {
  background-color: #005fa3;
}
#show-more{
  width: 80px;
  height: 30px;
  background-color: skyblue;
  color: black;
  font-weight: 700;
  text-align: center;
}
.button_box{
  text-align: center;
  margin-top:30px;
}
.button_hidden{
  text-align: center;
  margin-top:30px;
}
#hide-more{
  width: 80px;
  height: 30px;
  background-color: skyblue;
  color: black;
  font-weight: 700;
  text-align: center;
}
.button a{
    text-decoration-line: none;
    color:white;
}
/*section 끝*/
</style>

  <main>
    <section class="movies">
      <h2>공연</h2>
    <div class="movie-list">
	  <c:forEach var="performance" items="${performances}" varStatus="status">
	  	<c:if test="${status.index < 44}">
		    <div class="movie-card ${status.index < 4 ? 'visible' : 'hidden'}">
		      <a href="performance_check?prfid=${performance.prfid}"><img src="${performance.poster}" alt="포스터 이미지"></a>
		      <div class="movie-info">
		        <h3>${performance.prfnm}</h3>
		        <button class="button"><a href="performance_check?prfid=${performance.prfid}">상세보기</a></button>
		      </div>
		    </div>
	    </c:if>
	  </c:forEach>
	</div>
       <div class="button_box">
        <button id="show-more">더보기</button>
      </div>
      <div class="button_hidden">
        <button id="hide-more" class="hidden">닫기</button>
      </div>
    </section>
  </main>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>
	document.getElementById("show-more").addEventListener("click", function () {
		  const hiddenPosters = document.querySelectorAll(".movie-card.hidden");
	
		  hiddenPosters.forEach((poster) => {
		    poster.classList.remove("hidden");
		    poster.classList.add("visible");
		  });
		  
	
		  // '더보기' 버튼 숨기기
		  this.classList.add("hidden");
		  document.getElementById("hide-more").classList.remove("hidden");
		});
	
		document.getElementById("hide-more").addEventListener("click", function () {
		  const visiblePosters = document.querySelectorAll(".movie-card.visible");
	
		  visiblePosters.forEach((poster, index) => {
		    if (index >= 4) {
		      poster.classList.remove("visible");
		      poster.classList.add("hidden");
		    }
		  });
	
		  // '더보기' 버튼 다시 표시
		  document.getElementById("show-more").classList.remove("hidden");
		  this.classList.add("hidden");
		});
  </script>
   <script>
	    window.onload = function() {
	        var message = "${message}";
	        if(message) {
	            alert(message);
	        }
	    };
	</script>