<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

/*section*/
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
.tab-container {
    display: flex;
    flex-direction: column;
}
.tab-content {
    display: none;
    padding: 20px;
    border: 1px solid #fff;
    background-color: beige;
}
.tab-content.active {
    display: block;
}
main{
    flex: 1;
}
.email{
    width: 70%;
    color: black;
}
.email_button{
    padding: 8px 12px;
    border: 1px solid #ccc;
    cursor: pointer;
    border-radius: 4px;
}
.type{
    margin-top: 50px;
}
/*
.info-table {
    width: 100%;    
    border-collapse: collapse;
}
.info-table th, .info-table td {
    padding: 15px;
    border-bottom: 1px solid #555;
}
.info-table th {
    text-align: left;
    width: 130px;
}
.info-table td input {
    padding: 8px;
    box-sizing: border-box;
    color: #fff;
    border: 1px solid #555;
    color: black;
}
.info-table .btn {
    padding: 8px 12px;
    border: 1px solid #ccc;
    cursor: pointer;
    border-radius: 4px;
}
.info-table .btn:hover {
    background-color: #666;
}
.password-section {
    display: none;
    margin-top: 10px;
}
.password-section input{
    width: 70%;
}
.password-section button{
    width: 50px;
    height: 30px;
}*/
.required {
    color: red;
}
section{
    width: 1200px;
    margin: auto;
}
.mypage_page{
    margin-top: 50px;
}
.mypage_menu{
    padding: 50px 0 0 0;
    width: 150px;
}
.mypage_menu li{
    list-style-type: none;
    font-size: 25px;
    padding-bottom: 50px;
    cursor: pointer;
}
.mypage_main{
    border: 1px solid gray;
    width: 1050px;
    margin-top: 50px;
    margin-bottom: 50px;
}
.mypage_container{
    display: flex;
}
/*user*/
.mypage_user{
    margin: auto;
    table-layout: fixed; /* 열 너비 고정 */
    border-collapse: collapse; /* 테두리 결합 */
}
.mypage_user th, .mypage_user td{
    padding: 10px 0px;
    text-align: center;
    border-bottom: 1px solid gray; 
}
/*user*/
/*review*/
/*
.admin_review{
    margin: auto;
    table-layout: fixed; 
    border-collapse: collapse; 
}
.admin_review th{
    background-color: bisque;
}
.admin_review th, .admin_review td{
    padding: 10px 0px;
    text-align: center;
    border-bottom: 1px solid gray; 
}
.admin_review th:nth-child(1), .admin_review td:nth-child(1) {
    width: 200px;
}

.admin_review th:nth-child(2), .admin_review td:nth-child(2) {
    width: 300px;
}

.admin_review th:nth-child(3), .admin_review td:nth-child(3) {
    width: 150px;
}

.admin_review th:nth-child(4), .admin_review td:nth-child(4) {
    width: 200px;
}
.admin_review th:nth-child(5), .admin_review td:nth-child(5) {
    width: 200px;
}
.review_update{
    display: flex;
    text-align: right;
    justify-content: flex-end;
}
.review_update button{
    width: 50px;
    height: 30px;
}
.ellipsis {
    overflow: hidden;         
    text-overflow: ellipsis; 
}
*/
/*review*/

/*performance_view*/
.performance_view{
    margin: auto;
    table-layout: fixed; /* 열 너비 고정 */
    border-collapse: collapse; /* 테두리 결합 */
}
.performance_view th{
    background-color: bisque;
}
.performance_view th, .performance_view td{
    padding: 10px 0px;
    text-align: center;
    border-bottom: 1px solid gray; 
}
.performance_view th:nth-child(1), .performance_view td:nth-child(1) {
    width: 300px;
}

.performance_view th:nth-child(2), .performance_view td:nth-child(2) {
    width: 200px;
}

.performance_view th:nth-child(3), .performance_view td:nth-child(3) {
    width: 180px;
}

.performance_view th:nth-child(4), .performance_view td:nth-child(4) {
    width: 200px;
}
.performance_view th:nth-child(5), .performance_view td:nth-child(5) {
    width: 200px;
}

.ellipsis {
    overflow: hidden;         /* 넘치는 텍스트 숨기기 */
    text-overflow: ellipsis;  /* 넘치는 텍스트를 '...'로 표시 */
}
.updateSeatbnt{
	margin-left: 10px;
	width:100px;
	height: 30px
}
.allseatcnt{
	height: 30px;
	width:200px;
}
/*performance_view*/
/*section*/
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
/*footer*/
    </style>
	<main>
        <section>
            <h1 class="mypage_page">공연장유저 페이지</h1>
            <div class="mypage_container">
                <div class="mypage_menu">
                    <ul>
                        <li onclick="showTab('performance_write')">등록공연</li>
                        <li onclick="showTab('hall_write')">공연장<br>상세정보</li>
                    </ul>
                </div>
                <div id="performance_write" class="tab-content mypage_main">
                    <h4 style="border-bottom: 1px solid black; padding-bottom: 10px;">등록공연</h4>
                    <table class="performance_view">
                        <tr>
                            <th>공연명</th>
                            <th>공연장</th>
                            <th>날짜</th>
                            <th>1회차 시간</th>
                            <th>2회차 시간</th>
                        </tr>
                        <c:forEach items="${rprfList}" var="rprf">
	                        <tr>
	                            <td><a href="/controller/performance_view.do?rprfid=${rprf.rprfid}">${rprf.prfnm}</a></td>
	                            <td>${rprf.fcltynm}</td>
	                            <td>${rprf.date}</td>                            
	                            <td>${rprf.time}</td>
	                            <td>${rprf.time2}</td>
	                        </tr>
                        </c:forEach>
                    </table>
                    <div>
                    	<button onclick="location.href='${pageContext.request.contextPath}/performance'">등록</button>
                    </div>
                </div>
               <div id="hall_write" class="tab-content mypage_main">
			    <h4 style="border-bottom: 1px solid black; padding-bottom: 10px;">공연장상세정보</h4>
			    <div style="margin-top: 20px;">
			        <form action="<c:url value='/performanceMypage/updateAllSeatCnt' />" method="post">
			            <input type="hidden" name="hallid" value="${hallid}">
			            현재 총좌석수 : ${hallInfo.allSeatCnt}
			            <br>
			            총좌석수 : <input type="number" name="allSeatCnt" id="allSeatCnt" class="allseatcnt" required min="1" step="1"> 석
			            <button  class="updateSeatbnt" type="submit">등록</button>
			        </form>
			    </div>
			</div>
            </div>
        </section>
    </main>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        // 페이지가 로드될 때 'performance_write' 탭 활성화
        const defaultTab = document.getElementById('performance_write');
        if (defaultTab) {
            defaultTab.classList.add('active');
        }
    });

    function showTab(tabId) {
        const contents = document.querySelectorAll('.tab-content');
        contents.forEach(content => content.classList.remove('active'));

        const activeTab = document.getElementById(tabId);
        activeTab.classList.add('active');
    }


</script>
<script>
    function togglePasswordSection() {
      const section = document.getElementById('password-section');
      section.style.display = section.style.display === 'none' || section.style.display === '' ? 'block' : 'none';
    }
</script>
<script>
    function toggleEmailSection() {
        const emailSection = document.getElementById('email-section');
        emailSection.style.display = emailSection.style.display === 'none' || emailSection.style.display === '' ? 'block' : 'none';
    }
</script>
<script>
    function toggleEmailVerificationSection() {
        const verificationSection = document.getElementById('verification-section');
        verificationSection.style.display = verificationSection.style.display === 'none' || verificationSection.style.display === '' ? 'block' : 'none';
    }
</script>
<script>
    let isAuthenticated = false; // 인증 상태 변수

function togglePasswordAuthSection() {
    const section = document.getElementById('password-auth-section');
    section.style.display = section.style.display === 'none' || section.style.display === '' ? 'block' : 'none';
}

function authenticatePassword(event) {
    event.preventDefault();
    const password = document.getElementById('auth-password').value;

    // 여기에 서버와 비밀번호를 검증하는 코드 추가 (예: API 요청)
    const isValidPassword = password === '비밀번호'; // 예시 (서버로 대체 필요)

    if (isValidPassword) {
        alert('인증이 완료되었습니다.');
        isAuthenticated = true;
        enableEditableFields();
        togglePasswordAuthSection();
    } else {
        alert('비밀번호가 올바르지 않습니다.');
    }
}
function enableEditableFields() {
    if (isAuthenticated) {
        document.getElementById('user-name').readOnly = false;
        document.getElementById('user-birth').readOnly = false;
        document.getElementById('user-phone').readOnly = false;
        document.getElementById('user-email').readOnly = false;

        alert('정보를 수정할 수 있습니다.');
    } else {
        alert('비밀번호 인증이 필요합니다.');
    }
}
function enableField(fieldId) {
    if (isAuthenticated) {
        const field = document.getElementById(fieldId);
        field.readOnly = false; // 필드 활성화
        field.focus(); // 활성화된 필드로 포커스 이동
    } else {
        alert('비밀번호 인증이 필요합니다.');
    }
}
function saveUserInfo() {
    if (!isAuthenticated) {
        alert('비밀번호 인증이 필요합니다.');
        return;
    }

    const updatedData = {
        name: document.getElementById('user-name').value,
        birth: document.getElementById('user-birth').value,
        phone: document.getElementById('user-phone').value,
        email: document.getElementById('user-email').value,
    };

    // 서버로 전송
    console.log('저장된 데이터:', updatedData);
    alert('정보가 저장되었습니다.');
}
</script>

<script>
    window.onload = function() {
        var message = "${message}";
        if(message) {
            alert(message);
        }
    };
</script>