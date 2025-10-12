<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
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
}
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
.admin_review{
	width: 100%;
    margin: auto;
    table-layout: fixed; /* 열 너비 고정 */
    border-collapse: collapse; /* 테두리 결합 */
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
    overflow: hidden;         /* 넘치는 텍스트 숨기기 */
    text-overflow: ellipsis;  /* 넘치는 텍스트를 '...'로 표시 */
}

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
    width: 300px;
}

.performance_view th:nth-child(3), .performance_view td:nth-child(3) {
    width: 300px;
}

.performance_view th:nth-child(4), .performance_view td:nth-child(4) {
    width: 300px;
}
.performance_view th:nth-child(5), .performance_view td:nth-child(5) {
    width: 300px;
}
.performance_view th:nth-child(6), .performance_view td:nth-child(6) {
    width: 300px;
}

.ellipsis {
    overflow: hidden;         /* 넘치는 텍스트 숨기기 */
    text-overflow: ellipsis;  /* 넘치는 텍스트를 '...'로 표시 */
}
.modify_button{
	margin-top: 20px;
	margin-left: 400px;
	width: 100px;
	height: 30px;
}

.paging {
	margin-top: 10px;
	text-align: center;
}

.paging a {
    margin: 0 5px;
    text-decoration: none;
    color: black;
}
.paging a.active {
    font-weight: bold;
    color: blue;
}

/*performance_view*/
/*section*/
    </style>
      <main>
        <section>
            <h1 class="mypage_page">마이 페이지</h1>
            <div class="mypage_container">
                <div class="mypage_menu">
                    <ul>
                        <li onclick="showTab('user')">내 정보</li>
                        <li onclick="showTab('booking')">예매내역</li>
                        <li onclick="showTab('performance_write')">리뷰신고내역</li>
                    </ul>
                </div>
                <div id="user" class="tab-content mypage_main active">
                    <h4 style="border-bottom: 1px solid black; padding-bottom: 10px;">내 정보</h4>
                    <div> 
                    <form action="updateUserInfo.do" method="POST">
                        <table class="info-table">
                        	<tr>
                        		<th>아이디 <span class="required">*</span></th>
                        		<td> ${vo.userid}</td>
                        	</tr>
                            <tr>
                                <th>이름 <span class="required">*</span></th>
                                <td> ${vo.name }</td>
                            </tr>
                            <tr>
                                <th>생년월일 <span class="required">*</span></th>
                                <td>
                                	<input type="text" id="birth" name="birth" onblur="birthCheck(this)" value="${vo.birth}" >
                                	<div class="error"></div>
                                </td>
                            </tr>
                            <tr>
                                <th>휴대폰 <span class="required">*</span></th>
                                <td> 
                                	<input type="tel" id="phone" name="phone" onblur="phoneCheck(this)" value="${vo.phone}" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}">
                                	<div class="error"></div>
                                </td>
                            </tr>
                            <tr>
                                <th>이메일 <span class="required">*</span></th>
                                <td>
                                	<input type="email" id="email" name="email" onblur="emailCheck(this)" value="${vo.email}">
                                	<div class="error"></div>
                                	<button type="button" class="button" onclick="sendEmailVerification()">이메일 인증받기</button>
				                    <div class="email-verification" id="email-verification">
				                        <input type="text" id="verification-code" placeholder="인증번호 입력">
				                        <button type="button" onclick="verifyEmailCode()">확인</button>
				                    </div>
                                </td>
                            </tr>
                        </table>
						    <button class="modify_button" id="modifyButton">수정</button> 
						</form>
						<script>
						    document.addEventListener("DOMContentLoaded", function() {
						        <c:if test="${not empty message}">
						            alert("${message}");
						        </c:if>
						    });
						</script>
                    </div>
					</div>

                <div id="booking" class="tab-content mypage_main">
                    <h4 style="border-bottom: 1px solid black; padding-bottom: 10px;">예매내역</h4>
                    <table class="admin_review">
                        <tr>
                            <th>예매일자</th>
                            <th>공연명</th>
                            <th>금액</th>
                            <th>예약상태</th>
                        </tr>
                        <c:if test="${empty reservationList}">
  							<tr><td colspan="4">예매 내역이 없습니다.</td></tr>
                        </c:if>
                        <c:forEach items="${reservationList}" var="reservation">
	                        <tr>
	                            <td>${reservation.rdate}</td>
	                            <td>${reservation.itemName}</td>
	                            <td>${reservation.amountTotal}</td>                            
								<c:if test="${reservation.state == 'P'}">
									<td>결제완료</td>
								</c:if>
	                        </tr>
                        </c:forEach>
                    </table>
                </div>
                <div id="performance_write" class="tab-content mypage_main">
                    <h4 style="border-bottom: 1px solid black; padding-bottom: 10px;">리뷰신고내역</h4>
                    <table class="performance_view">
                        <tr>
                            <th>리뷰번호</th>
                            <th>신고일</th>
                            <th>리뷰내용</th>
                            <th>신고아이디</th>
                            <th>처리일자</th>
                            <th>처리여부</th>
                        </tr>
                        <c:forEach items="${reportList}" var="report">
	                        <tr>
	                            <td>${report.reportid}</td>
	                            <td>${report.rdate}</td>
	                            <td>${report.content}</td>                            
	                            <td>${report.userid}</td>
	                            <td>${report.processdate}</td>
	                            <c:if test="${report.process == 'E'}">
									<td>처리</td>
								</c:if>
	                            <c:if test="${report.process == 'D'}">
									<td>미처리</td>
								</c:if>
	                        </tr>
                        </c:forEach>
                     </table>
                     <!-- 페이징 영역 -->
				    <div class="paging">
				        <c:if test="${paging.startPage > 1}">
				            <a href="?nowPage=${paging.startPage - 1}&perPage=${paging.perPage}#performance_write">이전</a>
				        </c:if>
				        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i">
				            <a href="?nowPage=${i}&perPage=${paging.perPage}#performance_write"
				               class="${i == paging.nowPage ? 'active' : ''}">${i}</a>
				        </c:forEach>
				        <c:if test="${paging.endPage < paging.lastPage}">
				            <a href="?nowPage=${paging.endPage + 1}&perPage=${paging.perPage}#performance_write">다음</a>
				        </c:if>
				    </div>
                </div>
            </div>
        </section>
    </main>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
                
                <script>
				
                function sendEmailVerification() {
        		    $(".maillodingbox").show();
        		    let email = $("#email").val();
        		    $.ajax({
        		        url: "/controller/join/sendVerificationCode.do",
        		        type: "POST",
        		        data: { email: email },
        		        success: function(data) {
        		            $(".maillodingbox").hide();
        		            console.log(data);
        		            if (data === "중복된 이메일 입니다.") {
        		                alert("이미 등록된 이메일 주소입니다.");
        		            } else {
        		                alert("이메일 인증번호가 전송되었습니다.");
        		                document.getElementById('email-verification').style.display = 'block';
        		            }
        		        },
        		        error: function(xhr) {
        		            $(".maillodingbox").hide();
        		            console.log(xhr);
        		            alert("이메일 인증번호 전송에 실패했습니다. 다시 시도해 주세요.");
        		        }
        		    });
        		}

                function verifyEmailCode() {
                	
                    // 인증번호 확인 로직 
                	let inputCode = $("#verification-code").val();
                    $.ajax({
                        url: "/controller/join/verifyCode.do",
                        type: "POST",
                        data: { 
                            code: inputCode,
                            email: $("#email").val()  // 또는 $("#email").val()
                        },
                        success: function(data) {
                        	
                        	if(data.isValid) {
                                alert("이메일 인증이 완료되었습니다.");
                                document.getElementById('email-verification').style.display = 'none';
                                // 인증 완료 표시를 위한 추가 처리
                            } else {
                                alert("인증번호가 일치하지 않습니다. 다시 확인해주세요.");
                            }
                        },
                        error: function(xhr) {
                            console.log(xhr);
                            alert("인증 확인 중 오류가 발생했습니다.");
                        }
                    });
                }
                
                function birthCheck(obj){
                	const birthInput = document.getElementById('birth');
                	  const birthValue = birthInput.value;
                	  const birthRegex = /^(\d{4})-(\d{2})-(\d{2})$/;
                	  
                	  if (!birthRegex.test(birthValue)) {
                	    alert('생년월일 형식이 올바르지 않습니다. YYYY-MM-DD 형식으로 입력해주세요.');
                	    return false;
                	  }
                	  
                	  const [, year, month, day] = birthValue.match(birthRegex);
                	  const birthDate = new Date(year, month - 1, day);
                	  
                	  if (birthDate.getFullYear() != year || birthDate.getMonth() + 1 != month || birthDate.getDate() != day) {
                	    alert('유효하지 않은 날짜입니다. 실제 존재하는 날짜를 입력해주세요.');
                	    return false;
                	  }
                	  
                	  const currentYear = new Date().getFullYear();
                	  if (year < 1900 || year > currentYear) {
                	    alert('유효하지 않은 연도입니다. 1900년부터 현재 연도 사이의 값을 입력해주세요.');
                	    return false;
                	  }
                	  
                	  return true;
                	}
                document.getElementById('birth').addEventListener('input', function(e) {
              	  let value = e.target.value.replace(/\D/g, '');
              	  if (value.length > 4) value = value.slice(0,4) + '-' + value.slice(4);
              	  if (value.length > 7) value = value.slice(0,7) + '-' + value.slice(7);
              	  e.target.value = value.slice(0,10);
              	});
                
                function phoneCheck(obj){
                    let phone = $(obj).val();
                    let error = $(obj).next(".error");
                    let phonePattern = /^\d{2,3}-\d{3,4}-\d{4}$/;

                    if(phone.trim() === ""){
                        error.html("<span style='color:red'>핸드폰 번호를 입력해주세요</span>");
                        return false;
                    }else if(!phonePattern.test(phone)){
                        error.html("<span style='color:red'>핸드폰 형식이 올바르지 않습니다.</span>")
                    }else{
                        error.html("");
                        return true;
                    }
                }
                document.getElementById('phone').addEventListener('input', function(e) {
                	  let value = e.target.value.replace(/\D/g, '');
                	  if (value.length > 3) value = value.slice(0,3) + '-' + value.slice(3);
                	  if (value.length > 8) value = value.slice(0,8) + '-' + value.slice(8);
                	  e.target.value = value.slice(0,13);
                	});

                
                function emailCheck(obj){
                    let email = $("#email").val();
                    let error = $(obj).next(".error");
                    let emailPattern = /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$/;

                    if(email.trim() === ""){
                        error.html("<span style='color:red'>이메일을 입력해주세요</span>")
                        return false;
                    }else if(!emailPattern.test(email)){
                        error.html("<span style='color:red'>올바른 이메일을 입력해주세요</span>")
                        return false;
                    }else{
                        error.html("");
                        return true;
                    }
                }
                

            
                </script>
 <script>
 	/* 메뉴  */
    function showTab(tabId) {
    const contents = document.querySelectorAll('.tab-content'); 
    contents.forEach(content => content.classList.remove('active'));

    const activeTab = document.getElementById(tabId);
    activeTab.classList.add('active');
	}
</script>
<script>
    // URL에 해시(#)가 있을 경우 해당 탭을 활성화
    document.addEventListener('DOMContentLoaded', function() {
        const hash = window.location.hash;
        if (hash) {
            showTab(hash.substring(1)); // 해시값에서 '#' 제거
        }
    });
</script>

