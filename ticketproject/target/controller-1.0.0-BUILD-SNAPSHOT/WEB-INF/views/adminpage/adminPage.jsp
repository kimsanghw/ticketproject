<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/include/header.jsp" %>
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
body {
  font-family: 'Arial', sans-serif;
}
main{
    flex: 1;
}
section{
    width: 1200px;
    margin: auto;
}
th{
    background-color: bisque;
}
.admin_page{
    margin-top: 50px;
}
.admin_menu{
    padding: 50px 0 0 0;
    width: 150px;
}
.admin_menu li{
    list-style-type: none;
    font-size: 25px;
    padding-bottom: 50px;
    cursor: pointer;
}
.admin_main{
    border: 1px solid gray;
    width: 1050px;
    margin-top: 50px;
    margin-bottom: 50px;
}
.admin_container{
    display: flex;
}
/*user*/
.admin_user{
    margin: auto;
    table-layout: fixed; /* 열 너비 고정 */
    border-collapse: collapse; /* 테두리 결합 */
}
.admin_user th, .admin_user td{
    padding: 10px 0px;
    text-align: center;
    border-bottom: 1px solid gray; 
}
.admin_user th:nth-child(1), .admin_user td:nth-child(1) {
    width: 250px /* 아이디 */
}

.admin_user th:nth-child(2), .admin_user td:nth-child(2) {
    width: 100px /* 이름 */
}

.admin_user th:nth-child(3), .admin_user td:nth-child(3) {
    width: 300px /* 연락처 */
}

.admin_user th:nth-child(4), .admin_user td:nth-child(4) {
    width: 400px; /* 이메일 */
}
/*user*/
/*check*/
.admin_check{
    margin: auto;
    table-layout: fixed; /* 열 너비 고정 */
    border-collapse: collapse; /* 테두리 결합 */
}
.admin_check th, .admin_check td{
    padding: 10px 0px;
    text-align: center;
    border-bottom: 1px solid gray; 
}
.admin_check th:nth-child(1), .admin_check td:nth-child(1) {
    width: 100px; /* 아이디 */
}

.admin_check th:nth-child(2), .admin_check td:nth-child(2) {
    width: 300px; /* 공연명 */
}

.admin_check th:nth-child(3), .admin_check td:nth-child(3) {
    width: 300px; /* 예매일자 */
}

.admin_check th:nth-child(4), .admin_check td:nth-child(4) {
    width: 200px; /* 좌석번호 */
}
.admin_check th:nth-child(5), .admin_check td:nth-child(5) {
    width: 150px; /* 상태 */
}
/*check*/
/*review*/
.admin_review{
    margin: auto;
    table-layout: fixed; /* 열 너비 고정 */
    border-collapse: collapse; /* 테두리 결합 */
}
.admin_review th, .admin_review td{
    padding: 10px 0px;
    text-align: center;
    border-bottom: 1px solid gray; 
}
.admin_review th:nth-child(1), .admin_review td:nth-child(1) {
    width: 100px; /* 리뷰번호 */
}

.admin_review th:nth-child(2), .admin_review td:nth-child(2) {
    width: 200px; /* 공연명 */
}

.admin_review th:nth-child(3), .admin_review td:nth-child(3) {
    width: 300px; /* 리뷰내용 */
}

.admin_review th:nth-child(4), .admin_review td:nth-child(4) {
    width: 200px; /* 신고타입 */
}
.admin_review th:nth-child(5), .admin_review td:nth-child(5) {
    width: 200px; /* 신고일 */
}
.admin_review th:nth-child(6), .admin_review td:nth-child(6) {
    width: 100px; /* 작성자 */
}
.admin_review th:nth-child(7), .admin_review td:nth-child(7) {
    width: 100px; /* 신고자 */
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
    overflow: hidden;         /* 넘치는 텍스트 숨기기 */
    text-overflow: ellipsis;  /* 넘치는 텍스트를 '...'로 표시 */
}
.review_search{
    margin-top: 10px;
    margin-bottom: 10px;
    width: 150px;
    height: 21px;
}
.content{
    width: 400px;
    height: 21px;
}
.search{
    margin-top: 10px;
    float: left;
    width: 100px;
    background-color: white;
    font-size: 14px;
    height: 21px;
    padding-left: 10px;
}
.division{
    width: 100px;
    background-color: white;
    font-size: 14px;
    height: 21px;
    padding-left: 10px;
    margin-bottom: 10px;
}
.division_box{
    display: flex; 
    border-bottom: 1px solid black; 
    margin-bottom: 10px;
}
.search_button_box{
    text-align: center;
}
.search_button{
    width: 150px;
    height: 30px;
    background-color: skyblue;
    border: none;
    cursor: pointer;
    margin-bottom: 10px;
}
/*review*/
/*회원승인*/
.admin_usery{
    margin: auto;
    table-layout: fixed; /* 열 너비 고정 */
    border-collapse: collapse; /* 테두리 결합 */
}
.admin_usery th, .admin_usery td{
    padding: 10px 0px;
    text-align: center;
    border-bottom: 1px solid gray;
    border-top: 1px solid grey; 
}

.admin_usery th:nth-child(1), .admin_review td:nth-child(1) {
    width: 100px; /* 리뷰번호 */
}

.admin_usery th:nth-child(2), .admin_review td:nth-child(2) {
    width: 220px; /* 공연명 */
}

.admin_usery th:nth-child(3), .admin_review td:nth-child(3) {
    width: 340px; /* 리뷰내용 */
}

.admin_usery th:nth-child(4), .admin_review td:nth-child(4) {
    width: 180px; /* 신고타입 */
}
.admin_usery th:nth-child(5), .admin_review td:nth-child(5) {
    width: 170px; /* 신고일 */
}
.cancel {
    margin-right: 20px;
    
}

.user_update{
    display: flex;
    text-align: center;
    justify-content: flex-end;
}
.user_update button{

    width: 50px;
    height: 30px;
}
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
            <h1 class="admin_page">관리자 페이지</h1>
            <div class="admin_container">
                <div class="admin_menu">
                    <ul>
                        <li onclick="showTab('user')">사용자</li>
                        <li onclick="showTab('booking')">예매내역</li>
                        <li onclick="showTab('review')">리뷰신고</li>
                        <li onclick="showTab('write')">회원승인</li>
                    </ul>
                </div>
                <div id="user" class="tab-content admin_main active">
                    <h4 style="border-bottom: 1px solid black; padding-bottom: 10px;">사용자</h4>
                    <table class="admin_user">
                        <tr>
                            <th>아이디</th>
                            <th>이름</th>
                            <th>연락처</th>
                            <th>이메일</th> 
                        </tr>
                        <tr>
                            <td>qortmddn567</td>
                            <td>백승우</td>
                            <td>010-4197-2216</td>
                            <td>qortmddn567@naver.com</td>
                        </tr>
                        <tr>
                            <td>qortmddn567</td>
                            <td>백승우</td>
                            <td>010-4197-2216</td>
                            <td>qortmddnqwdqwdqw567@naver.com</td>
                        </tr>
                        <tr>
                            <td>qortmddn567</td>
                            <td>백승우</td>
                            <td>010-4197-2216</td>
                            <td>qortmddnqwdqwdqw567@naver.com</td>
                        </tr>
                        <tr>
                            <td>qortmddn567</td>
                            <td>백승우</td>
                            <td>010-4197-2216</td>
                            <td>qortmddnqwdqwdqw567@naver.com</td>
                        </tr>
                        <tr>
                            <td>qortmddn567</td>
                            <td>백승우</td>
                            <td>010-4197-2216</td>
                            <td>qortmddnqwdqwdqw567@naver.com</td>
                        </tr>
                    </table>
                </div>
                <div id="booking" class="tab-content admin_main">
                    <h4 style="border-bottom: 1px solid black; padding-bottom: 10px;">예매내역</h4>
                    <table class="admin_check">
                        <tr>
                            <th>아이디</th>
                            <th>공연명</th>
                            <th>예매일자</th>
                            <th>좌석번호</th>
                            <th>상태</th>
                        </tr>
                        <tr>
                            <td>qortmddn567</td>
                            <td>1승</td>
                            <td>24-12-03</td>
                            <td>z열 3석</td>
                            <td>결제완료</td>
                        </tr>
                        <tr>
                            <td>qortmddn567</td>
                            <td>1승</td>
                            <td>24-12-03</td>
                            <td>z열 3석</td>
                            <td>결제완료</td>
                        </tr>
                        <tr>
                            <td>qortmddn567</td>
                            <td>1승</td>
                            <td>24-12-03</td>
                            <td>z열 3석</td>
                            <td>결제완료</td>
                        </tr>
                        <tr>
                            <td>qortmddn567</td>
                            <td>1승</td>
                            <td>24-12-03</td>
                            <td>z열 3석</td>
                            <td>결제완료</td>
                        </tr>
                        <tr>
                            <td>qortmddn567</td>
                            <td>1승</td>
                            <td>24-12-03</td>
                            <td>z열 3석</td>
                            <td>결제완료</td>
                        </tr>
                        <tr>
                            <td>qortmddn56qwdqwdqwd7</td>
                            <td>1승qwdqwdqwdqwdqwdqwd</td>
                            <td>24-12-03 12345678</td>
                            <td>z열 3석</td>
                            <td>결제완료</td>
                        </tr>

                    </table>
                </div>
                <div id="review" class="tab-content admin_main">
                    <h4 style="border-bottom: 1px solid black; padding-bottom: 10px;">리뷰신고</h4>
                    <div>
                        <div class="search_box">
                            <form>
                                <div class="search">검색어</div>
                                <select name="searchType" class="review_search">
                                    <option value="search_all">전체</option>
                                    <option value="search_id">아이디</option>
                                    <option value="search_content">내용</option>
                                </select>
                                <input type="text" name="content" class="content" placeholder="검색어를 입력해주세요.">
                            </div>
                        </div>
                        <div>
                            <div class="division_box">
                                <div class="division">구분</div>
                                <div>
                                    <input type="radio" name="status" value="all">
                                    <label for="all">전체</label>

                                    <input type="radio" name="status" value="treatment">
                                    <label for="treatment">처리</label>

                                    <input type="radio" name="status" value="notreatment">
                                    <label for="notreatment">미처리</label>
                                </div>
                            </div>
                        </div>
                        <div class="search_button_box">
                            <button class="search_button">검색</button>
                            <button type="button" class="search_button">초기화</button>
                            </form>
                        </div>
                    <div>
                        <table class="admin_review">
                            <tr>
                                <th>리뷰번호</th>
                                <th>공연명</th>
                                <th>리뷰내용</th>
                                <th>신고타입</th>
                                <th>신고일</th>
                                <th>작성자</th>
                                <th>신고자</th>
                                <th></th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>1승</td>
                                <td class="ellipsis">이거 너무 재미없쒀 이거 너무 재미없쒀 이거 너무 재미없쒀 이거 너무 재미없쒀</td>
                                <td>욕설</td>
                                <td>24-12-03</td>
                                <td>qortmddn567</td>
                                <td>hogildong</td>
                                <td>
                                    <div class="review_update">
                                        <form>
                                            <button class="cancel">취소</button>
                                        </form>
                                        <form>
                                            <button class="delete">삭제</button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>1승</td>
                                <td class="ellipsis">이거 너무 재미없쒀 이거 너무 재미없쒀 이거 너무 재미없쒀 이거 너무 재미없쒀</td>
                                <td>욕설</td>
                                <td>24-12-03</td>
                                <td>qortmddn567</td>
                                <td>hogildong</td>
                                <td>
                                    <div class="user_update">
                                        <form>
                                            <button class="cancel">취소</button>
                                        </form>
                                        <form>
                                            <button class="delete">삭제</button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div id="write" class="tab-content admin_main">
                	<h4 style="border-bottom: 1px solid black; padding-bottom: 10px;">회원승인</h4>
                    <div>
                        <table class="admin_usery">
                            <tr>
                                <th>아이디</th>
                                <th>공연장명</th>
                                <th>공연장주소</th>
                                <th>사업자등록증</th>
                                <th>승인처리</th>
                            </tr>
                            <c:forEach items="${hallList}" var="vo">
                            <tr>
                            	<input type="hidden" name="hallid" value="${vo.hallid}" >
                                <td>${vo.userid }</td>
                                <td>${vo.fcltynm }</td>
                                <td class="ellipsis">${vo.halladdress}</td>
                                <td><a href='<c:url value="/download?hallid=${vo.hallid }"/>'>${vo.img}</a></td>
                                <td>
                                    <div class="user_update">
                                        <form >
                                        	<input type="hidden" name="enabled" value="${vo.enabled}">
                                            <button class="cancel">승인</button>
                                        </form>
                                        <form>
                                        	<input type="hidden" name="enabled" value="${vo.enabled}">	
                                            <button class="delete">보류</button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                          </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </section>
    </main>
<%@ include file="/resources/include/footer.jsp" %>
<script>
    function showTab(tabId) {
    const contents = document.querySelectorAll('.tab-content');
    contents.forEach(content => content.classList.remove('active'));

    const activeTab = document.getElementById(tabId);
    activeTab.classList.add('active');
}
</script>