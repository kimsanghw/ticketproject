<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
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
.admin_review th:nth-child(8), .admin_review td:nth-child(8) {
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
.approve {
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
.ROLE_USER{
	margin-top:10px;
}
.ROLE_HALL{
	margin-top:10px;
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
.paging{
	margin-top:30px;
	 text-align: center;
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
                    <div class="ROLE_USER">일반유저</div>
                    <table class="admin_user">
                        <tr>
                            <th>아이디</th>
                            <th>이름</th>
                            <th>연락처</th>
                            <th>이메일</th> 
                        </tr>
                        <c:forEach items="${ userList}" var="user">
                        <tr>
                            <td>${user.userid }</td>
                            <td>${user.name }</td>
                            <td>${user.phone }</td>
                            <td>${user.email }</td>
                        </tr>
                        </c:forEach>
                    </table>
                    <div class="paging user-paging">
					    <c:if test="${userPaging.startPage > 1}">
					        <a href="adminPage.do?userNowPage=${userPaging.startPage - 1}">&lt;</a>
					    </c:if>
					
					    <c:forEach begin="${userPaging.startPage}" end="${userPaging.endPage}" var="cnt">
					        <c:if test="${userPaging.nowPage eq cnt}">
					            <b>${cnt}</b>
					        </c:if>
					        <c:if test="${userPaging.nowPage ne cnt}">
					            <a href="adminPage.do?userNowPage=${cnt}">${cnt}</a>
					        </c:if>
					    </c:forEach>
					
					    <c:if test="${userPaging.endPage < userPaging.lastPage}">
					        <a href="adminPage.do?userNowPage=${userPaging.endPage + 1}">&gt;</a>
					    </c:if>
					</div>
                    <div class="ROLE_HALL">공연장유저</div>
                    <table class="admin_user">
                        <tr>
                            <th>아이디</th>
                            <th>공연장명</th>
                            <th>연락처</th>
                            <th>공연장주소</th> 
                        </tr>
                        <c:forEach items="${hallAllList}" var="vo">
                        <tr>
                            <td>${vo.userid }</td>
                            <td>${vo.fcltynm }</td>
                            <td>${vo.hallPhone }</td>
                            <td>${vo.halladdress }</td>
                        </tr>
                        </c:forEach>
                    </table>
                   <div class="paging hall-paging">
					    <c:if test="${hallPaging.startPage > 1}">
					        <a href="adminPage.do?hallNowPage=${hallPaging.startPage - 1}">&lt;</a>
					    </c:if>
					
					    <c:forEach begin="${hallPaging.startPage}" end="${hallPaging.endPage}" var="cnt">
					        <c:if test="${hallPaging.nowPage eq cnt}">
					            <b>${cnt}</b>
					        </c:if>
					        <c:if test="${hallPaging.nowPage ne cnt}">
					            <a href="adminPage.do?hallNowPage=${cnt}">${cnt}</a>
					        </c:if>
					    </c:forEach>
					
					    <c:if test="${hallPaging.endPage < hallPaging.lastPage}">
					        <a href="adminPage.do?hallNowPage=${hallPaging.endPage + 1}">&gt;</a>
					    </c:if>
					</div>
                </div>
                <div id="booking" class="tab-content admin_main">
                    <h4 style="border-bottom: 1px solid black; padding-bottom: 10px;">예매내역</h4>
                    <table class="admin_check">
                        <tr>
                            <th>아이디</th>
                            <th>공연명</th>
                            <th>예매일자</th>
                            <th>좌석수</th>
                            <th>결제상태</th>
                        </tr>
                        <c:forEach items="${ReservationList }" var="vo">
                        <tr>
                            <td>${vo.userid}</td>
                            <td>${vo.prfnm}</td>
                            <td>${vo.reservationDate}</td>
                            <td>${vo.quantity }</td>
                            <td>
                            <c:choose>
					            <c:when test="${vo.state == 'P'}">결제완료</c:when>
					            <c:otherwise>${vo.state}</c:otherwise>
					        </c:choose>
                            </td>
                        </tr>
                        </c:forEach>
                    </table>
                    <div class="paging reservation-paging">
					    <c:if test="${reservationPaging.startPage > 1}">
					        <a href="adminPage.do?reservationNowPage=${reservationPaging.startPage - 1}">&lt;</a>
					    </c:if>
					
					    <c:forEach begin="${reservationPaging.startPage}" end="${reservationPaging.endPage}" var="cnt">
					        <c:if test="${reservationPaging.nowPage eq cnt}">
					            <b>${cnt}</b>
					        </c:if>
					        <c:if test="${reservationPaging.nowPage ne cnt}">
					            <a href="adminPage.do?reservationNowPage=${cnt}">${cnt}</a>
					        </c:if>
					    </c:forEach>
					
					    <c:if test="${reservationPaging.endPage < reservationPaging.lastPage}">
					        <a href="adminPage.do?reservationNowPage=${reservationPaging.endPage + 1}">&gt;</a>
					    </c:if>
					</div>
                </div>
                <div id="review" class="tab-content admin_main">
                    <h4 style="border-bottom: 1px solid black; padding-bottom: 10px;">리뷰신고</h4>
                    <div>
                        <div class="search_box">
                            <form action="${pageContext.request.contextPath}/adminpage/adminPage.do" method="get">
							    <select name="searchType" class="review_search">
							        <option value="search_prfnm" ${searchVO.searchType == 'search_prfnm' ? 'selected' : ''}>공연명</option>
							        <option value="search_reporttype" ${searchVO.searchType == 'search_reporttype' ? 'selected' : ''}>신고타입</option>
							        <option value="search_content" ${searchVO.searchType == 'search_content' ? 'selected' : ''}>내용</option>
							    </select>
							    <input type="text" name="searchValue" value="${searchVO.searchValue}" placeholder="검색어를 입력해주세요.">
							    <button type="submit" class="search_button">검색</button>
							</form>
                            </div>
                        </div>
                        <div>
<!--                             <div class="division_box">
                                <div class="division">구분</div>
                                <div>
                                    <input type="radio" name="status" value="all">
                                    <label for="all">전체</label>

                                    <input type="radio" name="status" value="treatment">
                                    <label for="treatment">처리</label>

                                    <input type="radio" name="status" value="notreatment">
                                    <label for="notreatment">미처리</label>
                                </div>
                            </div> -->
                        </div>
<!--                         <div class="search_button_box">
                            <button class="search_button">검색</button>
                            <button type="button" class="search_button">초기화</button>
                           	
                        </div> -->
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
                                <th>신고처리</th>
                            </tr>
                            <c:forEach items="${reportList }" var="vo" varStatus="status">
                            <tr data-reviewid="${vo.reviewid}">
                                <td>${status.index + 1}</td>
                                <td>${vo.prfnm}</td>
                                <td class="ellipsis">${vo.reviewContent}</td>
                                <td>${vo.reporttype}</td>
                                <td>${vo.rdate }</td>
                                <td>${vo.reviewUserId}</td>
                                <td>${vo.userid }</td>
                                <td>
                                    <div class="review_update">
                                        <form>
                                            <button class="cancel">보류</button>
                                        </form>
                                        <form action="${pageContext.request.contextPath}/reportChangeProcess" method="post">
                                        	<input type="hidden"  name="reportid" value="${vo.reportid}">
                                        	<input type="hidden" name="reviewid" value="${vo.reviewid}">
                                            <button class="delete">삭제</button>
                                        </form>
                                        
                                    </div>
                                </td>
                            </tr>
                            </c:forEach>
                        </table>
						<div class="paging report-paging">
						    <c:if test="${paging.startPage > 1 }">
						        <a href="adminPage.do?nowpage=${paging.startPage-1 }" >&lt;</a>
						    </c:if>
						    <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="cnt">
						        <c:if test="${paging.nowPage eq cnt }">
						            <b >${cnt }</b>
						        </c:if>
						        <c:if test="${paging.nowPage ne cnt }">
						            <a href="adminPage.do?nowpage=${cnt}" >${cnt}</a>
						        </c:if>
						    </c:forEach>
						    <c:if test="${paging.endPage < paging.lastPage }">
						        <a href="adminPage.do?nowpage=${paging.endPage+1 }" >&gt;</a>
						    </c:if>
						</div>
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
				               <tr data-hallid="${vo.hallid}">
								    <td>${vo.userid}</td>
								    <td>${vo.fcltynm}</td>
								    <td class="ellipsis">${vo.halladdress}</td>
								    <td><a href='<c:url value="/download?hallid=${vo.hallid}" />'>${vo.img}</a></td>
								    <td>
								        <div class="user_update">
								            <button class="approve" data-hallid="${vo.hallid}" data-enabled="1">승인</button>
								            <button class="reject" data-hallid="${vo.hallid}" data-enabled="0">보류</button>
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
<%@ include file="/WEB-INF/views/include/footer.jsp" %>


<script>
    function showTab(tabId) {
    const contents = document.querySelectorAll('.tab-content');
    contents.forEach(content => content.classList.remove('active'));

    const activeTab = document.getElementById(tabId);
    activeTab.classList.add('active');
	}
</script>
 <script>
 /*
	    window.onload = function() {
	        var message = "${message}";
	       
	        if(message) {
	            alert(message);
	        }
	    };
	    */
	    	$(document).ready(function() {
	        // 사용자 페이징
	        $(document).on('click', '.user-paging a', function(e) {
	            e.preventDefault();
	            var page = $(this).attr('href').split('userNowPage=')[1];
	            loadPage('user', page);
	        });

	        // 공연장 유저 페이징
	        $(document).on('click', '.hall-paging a', function(e) {
	            e.preventDefault();
	            var page = $(this).attr('href').split('hallNowPage=')[1];
	            loadPage('hall', page);
	        });

	        // 예매 내역 페이징
	        $(document).on('click', '.reservation-paging a', function(e) {
	            e.preventDefault();
	            var page = $(this).attr('href').split('reservationNowPage=')[1];
	            loadPage('reservation', page);
	        });

		    // 리뷰 신고 페이징
			/*$(document).on('click', '.report-paging a', function(e) {
			    e.preventDefault();
			    var page = $(this).attr('href').split('nowpage=')[1];
			    console.log(page);
			    loadPage('report', page);
			});*/

	        function loadPage(type, page) {
	            var url = 'adminPage.do';
	            var data = {};
	            data[type + 'NowPage'] = page;

	            $.ajax({
	                url: url,
	                data: data,
	                success: function(response) {
	                    //console.log('AJAX 요청 성공');
	                    //console.log('응답 데이터:', response);
	                    //console.log('페이지 타입:', type);
	                    //console.log('페이지 번호:', page);
	                    
	                    var $response = $(response);
	                    if (type === 'user') {
	                        $('.admin_user').first().html($response.find('.admin_user').first().html());
	                        $('.user-paging').html($response.find('.user-paging').html());
	                    } else if (type === 'hall') {
	                        $('.admin_user').last().html($response.find('.admin_user').last().html());
	                        $('.hall-paging').html($response.find('.hall-paging').html());
	                    } else if (type === 'reservation') {
	                        $('.admin_check').html($response.find('.admin_check').html());
	                        $('.reservation-paging').html($response.find('.reservation-paging').html());
	                    } /*else if (type === 'report') {
	                    	$('.admin_review').html($response.find('.admin_review').html());
	                    	$('.report-paging').html($response.find('.report-paging').html());
	                        console.log( $('.report-paging'));
	                     }*/
	                    console.log('리뷰 신고 데이터 업데이트 완료');
	                },
	                error: function(xhr, status, error) {
	                    console.error('AJAX 요청 실패');
	                    console.error('상태:', status);
	                    console.error('에러:', error);
	                    console.error('응답 텍스트:', xhr.responseText);
	                }
	            });
	        }
	    });
	    	
	    $(document).ready(function () {
	        $(document).on('click', '.approve', function (e) {
	            e.preventDefault();

	            // 버튼에서 데이터 가져오기
	            var hallid = $(this).data('hallid');
	            var enabled = $(this).data('enabled');

	            // AJAX 요청
	            $.ajax({
	                url: '${pageContext.request.contextPath}/updateEnabled', // 요청 URL
	                type: 'POST',
	                contentType: 'application/json',
	                data: JSON.stringify({
	                    hallid: hallid,
	                    enabled: enabled
	                }),
	                success: function (response) {
	                    if (response.success) {
	                        alert(response.message);

	                        // 승인된 항목의 행 삭제
	                        $(`tr[data-hallid="${hallid}"]`).remove();

	                    } else {
	                        alert('처리에 실패했습니다: ' + response.message);
	                    }
	                },
	                error: function (xhr, status, error) {
	                    console.error('AJAX 요청 실패');
	                    console.error('상태:', status);
	                    console.error('에러:', error);
	                    alert('오류가 발생했습니다: ' + xhr.responseText);
	                }
	            });
	        });
	    });
</script>