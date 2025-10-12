<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
/*header*/
header {
  margin: 0;
  background-color: beige;
}
.container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px 0px;
  width: 1200px;
  margin: auto;
}
.container img{
  width: 100px;
  height: 60px;
}
h1 {
  color: black;
}

nav ul {
  list-style: none;
  display: flex;
  gap: 20px;
}

nav ul li a {
  color: black;
  font-weight: 700;
  text-decoration: none;
}

.user-links {
  font-size: 0.9em;
}

.user-links a {
  color: black;
  margin-left: 10px;
  font-weight: 700;
  text-decoration: none;
}
/*header*/
/*footer*/
.footer {
  position: relative; /* footer가 페이지 안에서 자연스럽게 배치되도록 */
  width: 100%;
  padding: 20px 10%;
  background-color: beige;
}

.footer-content {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.footer-links {
  margin-bottom: 10px;
}

.footer-links a {
  margin-right: 15px;
  text-decoration: none;
  font-size: 14px;
}

.footer-links a:hover {
  text-decoration: underline;
  color: #0078d4; /* 링크에 hover 효과 추가 */
}

.footer-info {
  text-align: center;
  font-size: 12px;
}
footer img{
  width: 100px;
  height: 60px;
  margin-bottom: 10px;
}
    </style>
</head>
<body>
    <header>
    <div class="container">
      <h1><a href="<c:url value="/" />"><img src="${pageContext.request.contextPath}/resources/img/로고.PNG"></a></h1>
      <%-- <h1><a href="#"><img src="<c:url value="/resources/img/로고.PNG" />"></a></h1> --%>
      <nav>
        <ul class="nav-links">
          <li><a href="<c:url value="/" />">메인</a></li>
          <%-- <li><a href="<c:url value="/" />">메인</a></li> --%>
          <li><a href="${pageContext.request.contextPath}/noticeBoard/noticeList.do">공지사항</a></li>
        </ul>
      </nav>
      <div class="user-links">
      	<sec:authorize access="isAnonymous()">
	      	<a href="" onclick="openLoginPopup()">로그인</a> | <a href="${pageContext.request.contextPath}/join/join.do">회원가입</a>
      	</sec:authorize> 
   		<!-- 로그인한 사용자 -->
	    <sec:authorize access="isAuthenticated()">
	        <!-- 공연장 유저 -->
	        <sec:authorize access="hasRole('ROLE_HALL')">
	            <a href="logout.do">로그아웃</a> | 
	            <a href="<c:url value='/performanceMypage/performanceMypage.do?userid=${userid}' />">공연장 마이페이지</a>
	        </sec:authorize>
	
	        <!-- 일반 유저 -->
	        <sec:authorize access="hasRole('ROLE_USER')">
	            <a href="logout.do">로그아웃</a> | 
	            <a href="<c:url value='/mypage/mypage.do' />">마이페이지</a>
	        </sec:authorize>
	       <!-- 관리자 유저 -->
	         <sec:authorize access="hasRole('ROLE_ADMIN')">
	            <a href="logout.do">로그아웃</a> | 
	            <a href="<c:url value='/adminpage/adminPage.do' />">관리자페이지</a>
	        </sec:authorize>
	    </sec:authorize>
	    
	      </div>
	  
    </div>
    <script>
	    function openLoginPopup() {
	        const popupWidth = 500; // 팝업 너비
	        const popupHeight = 500; // 팝업 높이
	        const popupX = (window.screen.width / 2) - (popupWidth / 2); // 화면 중앙 X 좌표
	        const popupY = (window.screen.height / 2) - (popupHeight / 2); // 화면 중앙 Y 좌표
	        const features = `width=${popupWidth},height=${popupHeight},left=${popupX},top=${popupY},resizable=no,scrollbars=no,status=no`;
	        
	        const popup = window.open('${pageContext.request.contextPath}/login/login.do', 'loginPopup', features);
	        
	        if (popup) {
	            popup.moveTo(popupX, popupY);
	            popup.resizeTo(popupWidth, popupHeight); // 팝업 크기 강제 조정
	            popup.focus();
	        } else {
	            alert("팝업 차단 설정을 확인해주세요.");
	        }
	    }
    </script>
  </header>