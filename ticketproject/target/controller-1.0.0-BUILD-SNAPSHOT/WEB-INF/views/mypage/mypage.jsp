<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/include/header.jsp" %>
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
                        <li onclick="showTab('performance_write')">등록공연</li>
                    </ul>
                </div>
                <div id="user" class="tab-content mypage_main active">
                    <h4 style="border-bottom: 1px solid black; padding-bottom: 10px;">내 정보</h4>
                    <div> 
                        <table class="info-table">
                        	<tr>
                        		<th>아이디 <span class="required">*</span></th>
                        		<td> ${vo.userId }</td>
                        	</tr>
                            <tr>
                                <th>이름 <span class="required">*</span></th>
                                <td> ${vo.name }</td>
                            </tr>
                            <tr>
                                <th>생년월일 <span class="required">*</span></th>
                                <td>${vo.birth}</td>
                            </tr>
                            <tr>
                                <th>휴대폰 <span class="required">*</span></th>
                                <td> ${vo.phone }</td>
                            </tr>
                            <tr>
                                <th>이메일 <span class="required">*</span></th>
                                <td>${vo.email }</td>
<!--                                <td>
                                    <input class="email" type="email" value=${vo.email } readonly>
                                     <button class="email_button" type="button" onclick="toggleEmailSection()">변경</button> 
                                     <div class="email-section" id="email-section" style="display:none; margin-top: 10px;"> 
                                         <form>
                                            <input class="email" type="email" id="email" name="email" placeholder="새 이메일을 입력해주세요.">
                                            <button class="email_button" type="button" onclick="toggleEmailVerificationSection()">이메일 인증받기</button>
                                        </form>
                                        <form>
                                            <div class="verification-section" id="verification-section" style="display:none; margin-top: 10px;">
                                                <input class="email" type="text" placeholder="인증번호 입력" id="verification-code">
                                                <button class="email_button" type="button" onclick="verifyEmailCode()">확인</button>
                                            </div> 
                                        </form>
                                    </div>
                                </td>
-->
                            </tr>
<!--                             <tr>
                                <th>비밀번호 <span class="required">*</span></th>
                                <td>
                                    <button class="btn" onclick="togglePasswordSection()">비밀번호 변경</button>
                                    <div class="password-section" id="password-section">
                                        <form>
                                            <div>
                                                <input type="password" placeholder="현재 비밀번호">
                                            </div>
                                            <div>
                                                <input type="password" placeholder="새로운 비밀번호">
                                            </div>
                                            <div>
                                                <input type="password" placeholder="새로운 비밀번호 확인">
                                            </div>
                                            <button>변경</button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
-->                          
							
                        </table>
						<form> 
						    <button class="modify_button" id="modifyButton" onclick="showPasswordInput(event)">수정</button> 
						</form>
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
                            <th>환불신청</th>
                        </tr>
                        <tr>
                            <td>2024-12-02 13:00:00</td>
                            <td>자라나라 머리머리</td>
                            <td>88,000원</td>                            
                            <td>결제완료</td>
                            <td><button type="submit">환불하기</button></td>
                        </tr>
                        <tr>
                            <td>2024-12-02 13:00:00</td>
                            <td>자라나라 머리머리</td>
                            <td>88,000원</td>                            
                            <td>결제완료</td>
                            <td><button type="submit">환불하기</button></td>
                        </tr>
                        <tr>
                            <td>2024-12-02 13:00:00</td>
                            <td>자라나라 머리머리</td>
                            <td>88,000원</td>                            
                            <td>결제완료</td>
                            <td><button type="submit">환불하기</button></td>
                        </tr>
                        <tr>
                            <td>2024-12-02 13:00:00</td>
                            <td>자라나라 머리머리</td>
                            <td>88,000원</td>                            
                            <td>결제완료</td>
                            <td><button type="submit">환불하기</button></td>
                        </tr>
                    </table>
                    <h4 class="type" style="border-bottom: 1px solid black; padding-bottom: 10px;">취소내역</h4>
                    <table class="admin_review">
                        <tr>
                            <th>예매일자</th>
                            <th>공연명</th>
                            <th>좌석</th>
                            <th>금액</th>
                            <th>예약상태</th>
                        </tr>
                        <tr>
                            <td>2024-12-02 13:00:00</td>
                            <td>자라나라 머리머리</td>
                            <td>a열 3석</td>                            
                            <td>88,000원</td>
                            <td>환불완료</td>
                        </tr>
                        <tr>
                            <td>2024-12-02 13:00:00</td>
                            <td>자라나라 머리머리</td>
                            <td>a열 3석</td>                            
                            <td>88,000원</td>
                            <td>환불완료</td>
                        </tr>
                        <tr>
                            <td>2024-12-02 13:00:00</td>
                            <td>자라나라 머리머리</td>
                            <td>a열 3석</td>                            
                            <td>88,000원</td>
                            <td>환불완료</td>
                        </tr>
                        <tr>
                            <td>2024-12-02 13:00:00</td>
                            <td>자라나라 머리머리</td>
                            <td>a열 3석</td>                            
                            <td>88,000원</td>
                            <td>환불완료</td>
                        </tr>
                        <tr>
                            <td>2024-12-02 13:00:00</td>
                            <td>자라나라 머리머리</td>
                            <td>a열 3석</td>                            
                            <td>88,000원</td>
                            <td>환불완료</td>
                        </tr>
                        <tr>
                            <td>2024-12-02 13:00:00</td>
                            <td>자라나라 머리머리</td>
                            <td>a열 3석</td>                            
                            <td>88,000원</td>
                            <td>환불완료</td>
                        </tr>
                    </table>
                </div>
                <div id="performance_write" class="tab-content mypage_main">
                    <h4 style="border-bottom: 1px solid black; padding-bottom: 10px;">등록공연</h4>
                    <table class="performance_view">
                        <tr>
                            <th>공연명</th>
                            <th>공연장</th>
                            <th>날짜</th>
                            <th>시간</th>
                        </tr>
                        <tr>
                            <td><a href="#">자라나라 머리머리</a></td>
                            <td>A공연장</td>
                            <td>2024-12-10</td>                            
                            <td>16:00</td>
                        </tr>
                    </table>
                </div>
            </div>
        </section>
    </main>
<%@ include file="/resources/include/footer.jsp" %>
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
 // 수정 버튼 클릭 시 비밀번호 입력창 표시
    function showPasswordInput(event) {
        event.preventDefault(); // 버튼의 기본 동작 방지
        let container = document.querySelector(".mypage_main"); // 입력칸이 추가될 컨테이너

        // 비밀번호 입력창이 없을 때만 추가
        if (!document.querySelector("#passwordContainer")) {
            let passwordField = `
                <div style="margin-top: 10px;" id="passwordContainer">
                    <label for="password">비밀번호 입력:</label>  
                    <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" />
                    <button type="button" onclick="checkPassword()">확인</button>
                </div>
            `;
            container.insertAdjacentHTML('beforeend', passwordField); // 입력창 추가
        }
    }
</script>

<script>
    // 비밀번호 확인 함수
    function checkPassword() {
    	const password = document.getElementById("password").value; // 입력된 비밀번호 가져오기

        // 비밀번호가 입력되지 않았을 경우
        if (!password) {
            alert("비밀번호를 입력하세요.");
            return;
        }

        // 서버로 비밀번호 확인 요청
        $.ajax({
            url: "<%=request.getContextPath()%>/mypage/verifyPassword", // 서버의 비밀번호 검증 엔드포인트
            type: "POST",
            data: {
                userId: "<%=session.getAttribute("$(userId)")%>", // 세션에서 현재 사용자 ID 가져오기
                password: password // 입력된 비밀번호 전달
            },
            success: function(response) {
                if (response.success) { // 비밀번호 확인 성공
                    alert(response.message);
                    window.location.href = "<%=request.getContextPath()%>/mypage/mypagemodify.do"; // 수정 페이지로 리다이렉트
                } else { // 비밀번호 확인 실패
                    alert(response.message);
                }
            },
            error: function(xhr, status, error) { // 서버 요청 중 오류 발생
                console.error("서버 요청 중 오류 발생:", error);
                alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
            }
        });
    }
</script>
<%--
<script>
    function togglePasswordSection() {
		const section = document.getElementById('password-section');
        section.style.display = section.style.display === 'none' || section.style.display === '' ? 'block' : 'none';
    }
</script>
<script>
	function toggleEmailSection(){
		const emailSection = document.getElementById('email-section'); 
		emailSection.style.display = emailSection.style.display === 'none' || emailSection.style.display === '' ? 'block' : 'none';
	}
</script>
<script>
    function toggleEmailVerificationSection() {
    	
        const emailInput = $("#email").val(); // 이메일 입력값 가져오기
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // 이메일 형식 정규식

        // 이메일 형식 검증
        if (!emailRegex.test(emailInput)) {
            alert("이메일 형식이 잘못되었습니다."); // 잘못된 이메일 형식 안내
            return; // 검증 실패 시 함수 종료
        }
    	
    	$(".maillodingbox").show(); // 이메일 인증 번호 전송 중 로딩 박스를 보여줍니다.
    	alert("이메일 전송 중입니다. 잠시만 기다려 주세요."); // 이메일 전송 중이라는 안내 메시지를 표시.
        let email = $("#email").val(); // 이메일 입력 필드에서 사용자가 입력한 이메일 값을 가져옴.
        $.ajax({ // AJAX 요청을 사용하여 서버에 인증번호 전송 요청을 보냄.
            url: "<%=request.getContextPath()%>/mypage/sendVerificationCode.do", 
            type: "POST", // 메서드는 POST를 사용합니다.
            data: { email: email }, // 서버로 보낼 데이터
            success: function(data) { // 요청이 성공했을 때 실행되는 콜백 함수
            	$(".maillodingbox").hide(); // 로딩 박스를 숨김.
                console.log(data); // 서버에서 받은 응답 데이터를 콘솔에 출력.
                alert("이메일 인증번호가 전송되었습니다.");
                const verificationSection = document.getElementById('verification-section');
                verificationSection.style.display = verificationSection.style.display === 'none' || verificationSection.style.display === '' ? 'block' : 'none';
            },
            error: function(xhr) { // 요청이 실패했을 때 실행되는 콜백 함수.
            	$(".maillodingbox").hide(); // 로딩 박스를 숨김.
                console.log(xhr);
                alert("이메일 인증번호 전송에 실패했습니다. 다시 시도해 주세요.");
            }
        });
    }
    
    function verifyEmailCode() { 
    	
        // 인증번호 확인 로직 
    	let inputCode = $("#verification-code").val();
        $.ajax({
            url: "<%=request.getContextPath()%>/mypage/verifyCode.do",
            type: "POST",
            data: { 
                code: inputCode,
                email: $("#email").val()  // 또는 $("#email").val()
            },
            success: function(data) {
            	if(data.isValid) {
                    alert("이메일 인증이 완료되었습니다.");
                    document.getElementById('verification-section').style.display = 'none';
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
</script> --%>
