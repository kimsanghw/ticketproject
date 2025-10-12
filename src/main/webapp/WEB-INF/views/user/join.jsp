<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
section {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    width: 1200px;
    margin: auto;
    flex: 1;
}
.signup-container {
    background-color: #fff;
    padding: 40px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    width: 400px;
    margin: 20px 0px 20px 0px;
    background-color: blanchedalmond;
}
h1 {
    text-align: center;
}
label {
    display: block;
    margin: 10px 0 5px;
}
input[type="text"], input[type="password"], input[type="email"], input[type="tel"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
}
.button {
    width: 100%;
    padding: 10px;
    background-color: #0078d4;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-top:5px;
}
.button:hover {
    background-color: #005a9e;
}
.email-verification {
    display: none;
    margin-top: 10px;
}
.email-verification input {
    width: calc(100% - 100px);
    display: inline-block;
}
.email-verification button {
    width: 90px;
    display: inline-block;
    padding: 10px;
    background-color: #0078d4;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
.error{
    font-size: 15px;
}
.tab-container {
    margin-top: 20px;
    display: flex;
    border-bottom: 2px solid black;
    margin-bottom: 20px;
}
.tab {
    flex: 1;
    padding: 10px;
    text-align: center;
    cursor: pointer;
    border: 1px solid black;
    border-bottom: none;
}
.tab.active {
    background-color: beige;
    font-weight: bold;
}
.tab-content {
    display: none;
}
.tab-content.active {
    display: block;
}
.address_btn{
  height: 35px;
  background-color: #0078d4;
  color: white;
  border: none;
  cursor: pointer;
}
.maillodingbox{
	display:none;
	position:fixed;
	top:0px;
	bottom:0px;
	left:0px;
	right:0px;
	background:black;
	opacity:0.7; 
}
</style>
</head>
<body>
	<div class="maillodingbox">
	</div>
    <section>
        <div class="signup-container">
            <h1>회원가입</h1>
            <form id="signup-form" action="/controller/join/join.do" method="POST" accept-charset="UTF-8">
              <div class="tab-container">
                <div class="tab active" onclick="openTab(event, 'info')">일반 회원</div>
                <div class="tab" onclick="openTab(event, 'review')">공연장 회원</div>
              </div>
              <div id="info" class="tab-content active">
                  <label for="id">아이디</label>
                  <input type="text" id="ROLE_USER" name="userid" onblur="idCheck(this)" required>
                  <div class="error"></div>
                  <label for="password">비밀번호</label>
                  <input type="password" id="upassword" onblur="pwCheck(this)" name="upassword" required>
                  <div class="error"></div>
                  <label for="password2">비밀번호 확인</label>
                  <input type="password" id="password2" onblur="pw2Check(this)" name="password2" required>
                  <div class="error"></div>
                  <label for="name">이름</label>
                  <input type="text" id="name" name="name" onblur="nameCheck(this)" required>
                  <label for="birth">생년월일</label>
                  <input type="text" id="birth" name="birth" onblur="birthCheck(this)" placeholder="8자리로 입력해주세요 ex)OOOO-OO-OO" required>
                  <div class="error"></div>
                  <label for="email">이메일</label>
                  <input type="email" id="email" name="email" onblur="emailCheck(this)" required>
                  <div class="error"></div>
                  <button type="button" class="button" onclick="sendEmailVerification()">이메일 인증받기</button>
                  <div class="email-verification" id="email-verification">
                      <input type="text" id="verification-code" placeholder="인증번호 입력">
                      <button type="button" onclick="verifyEmailCode()">확인</button>
                  </div>
                  <label for="phone">연락처</label>
                  <input type="tel" id="phone" name="phone" onblur="phoneCheck(this)" placeholder="010-1234-5678" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required>
                  <div class="error"></div>
                  <button type="submit" class="button">회원가입</button>
                </div>
            </form>
            <form action="prfUserJoin.do" method="POST" enctype="multipart/form-data">
              <div id="review" class="tab-content">
                <label for="id">아이디</label>
                  <input type="text" id="ROLE_HALL" name="userid" onblur="idCheck(this)" required>
                  <div class="error"></div>
                  <label for="password">비밀번호</label>
                  <input type="password" id="hpassword" onblur="prfPwCheck(this)" name="hpassword" required>
                  <div class="error"></div>
                  <label for="password2">비밀번호 확인</label>
                  <input type="password" id="password2" onblur="prfPw2Check(this)" name="password2" required>
                  <div class="error"></div>
                  <label for="fcltynm">공연장명</label>
                  <input type="text" id="fcltynm" name="fcltynm" onblur="nameCheck(this)" required>
                  <label for="address">주소</label>
                  <div>
                    <input type="text" id="zip-code" style="width: 130px;" placeholder="우편번호" readonly>
                    <button type="button" class="address_btn" onclick="openZipSearch()">우편번호 찾기</button>
                  </div>
                  <input type="text" id="halladdress" name="halladdress" placeholder="주소" readonly>
                  <input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소">
                  <label for="phone">연락처</label>
                  <input type="tel" id="hallPhone" name="hallPhone" onblur="phoneCheck(this)" placeholder="010-1234-5678" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required>
                  <div class="error"></div>
                  <div >사업자등록증
                  	<input type="file" name="file">
                  </div>
                  <button type="submit" class="button">회원가입</button>
              </div>
            </form>
        </div>
    </section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
    <script>
    //이메일 인증
		function sendEmailVerification() {
		    $(".maillodingbox").show();
		    let email = $("#email").val();
		    $.ajax({
		        url: "sendVerificationCode.do",
		        type: "POST",
		        data: { email: email },
		        success: function(data) {
		            $(".maillodingbox").hide();
		            console.log(data);
		            if (data === "success") {
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
                url: "verifyCode.do",
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

        document.getElementById('signup-form').addEventListener('submit', function(event) {
            event.preventDefault(); // 기본 제출 동작 중지

            // 폼 데이터 유효성 검사
            if(idCheck(document.getElementById('ROLE_USER')) || idCheck(document.getElementById('ROLE_HALL'))
                && pwCheck(document.getElementById('password'))
                && pw2Check(document.getElementById('password2'))
                && nameCheck(document.getElementById('name'))
                && emailCheck(document.getElementById('email'))
                && phoneCheck(document.getElementById('phone'))) {
                // 폼 제출
                this.submit(); 
            } else {
                alert("입력 정보를 확인해주세요.");
            }
        });
    </script>
<script>
    function idCheck(obj){
    	//console.log("idcheck 함수 실행");
        let uid = $("#ROLE_USER").val() || $("#ROLE_HALL").val();
        let error = $(obj).next(".error");
        let idPattern = /^(?=.*[a-zA-Z])[a-zA-Z0-9]{4,30}$/;
		//console.log(jQuery.fn.jquery);
        if(uid.trim() == ""){
        	console.log("if 1번");
            error.html("<span style='color:red'>아이디를 입력하세요</span>")
            return false;
        }else if(uid.trim().length < 6 || uid.trim().length > 14){
        	console.log("if 2번");
            error.html("<span style='color:red'>아이디는 6자 이상 14자 이하로 작성해주세요.</span>");
            return false;
        }
        
        $.ajax({
            type: 'GET',
            url: 'checkid.do',
            data: {userid : uid},
            content: "application/charset=UTF-8",
            success: function(response){
                if (response == "duplicate"){
                    error.html("<span style='color:red'>이미 사용중인 아이디 입니다</span>");
                } else if (response == "available"){
                	console.log("ajax 1번");
                    error.html("<span style='color:green'>사용가능한 아이디 입니다</span>");
                }
            },
            error: function(xhr, status, error2) {
                console.error("AJAX 오류 발생:", status, error2);
                error.html("<span style='color:red'>서버 오류가 발생했습니다.</span>");
            }
        });

        return true;
    }
    

    function pwCheck(obj){
        let pw = $("#upassword").val();
        let error = $(obj).next(".error");
        let pwPattern = /^(?=.*[a-zA-Z])[a-zA-Z0-9]+$/;

        if(pw.trim() === ""){
          error.html("<span style='color:red'>비밀번호를 입력하세요</span>");
          return false;
            }else if(pw.trim().length < 8){
          error.html("<span style='color:red'>비밀번호는 8자 이상 입력하세요</span>");
          return false;
            }else if(!pwPattern.test(pw)){
          error.html("<span style='color:red'>비밀번호는 영문과 숫자를 조합해서 입력하세요</span>");
          return false;
        }else {
          error.html("");
          return true;
        }
    }
    
    function prfPwCheck(obj){
        let pw = $("#hpassword").val();
        let error = $(obj).next(".error");
        let pwPattern = /^(?=.*[a-zA-Z])[a-zA-Z0-9]+$/;

        if(pw.trim() === ""){
          error.html("<span style='color:red'>비밀번호를 입력하세요</span>");
          return false;
            }else if(pw.trim().length < 8){
          error.html("<span style='color:red'>비밀번호는 8자 이상 입력하세요</span>");
          return false;
            }else if(!pwPattern.test(pw)){
          error.html("<span style='color:red'>비밀번호는 영문과 숫자를 조합해서 입력하세요</span>");
          return false;
        }else {
          error.html("");
          return true;
        }
    }

    function pw2Check(obj){
		let pw = $("input[name='upassword']").val();
		let pw2 = $(obj).val();
		let error = $(obj).next(".error")
		if(pw !== pw2){
			error.html("<span style='color:red'>비밀번호가 일치하지 않습니다</span>");
			return false;
		} else {
			error.html("");
			return true;
		}
	}
	
    function prfPw2Check(obj) {
        let pw = $("input[name='hpassword']").val(); // 공연장 회원 폼의 비밀번호
        let pw2 = $(obj).val(); // 확인용 비밀번호
        let error = $(obj).next(".error"); // 에러 메시지 출력 영역

        if (pw !== pw2) {
            error.html("<span style='color:red'>비밀번호가 일치하지 않습니다</span>");
            return false;
        } else {
            error.html("");
            return true;
        }
    }
    
    function nameCheck(obj) {
        let name = $(obj).val();
        let error = $(obj).next(".error");
        let namePattern = /^[가-힣]+$/;

        if (name.trim() === "") {
            error.html("<span style='color:red'>이름을 입력하세요</span>");
            return false;
        } else if (name.length < 2 || !namePattern.test(name)) {
            error.html("<span style='color:red'>이름은 2글자 이상 한글만 입력하세요</span>");
            return false;
        } else {
            error.html("");
            return true;
        }
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
</script>
<script>
  function openTab(evt, tabId) {
      // 모든 탭과 컨텐츠 숨기기
      const tabs = document.querySelectorAll('.tab');
      const contents = document.querySelectorAll('.tab-content');

      tabs.forEach(tab => tab.classList.remove('active'));
      contents.forEach(content => content.classList.remove('active'));

      // 클릭된 탭과 해당 컨텐츠 활성화
      evt.currentTarget.classList.add('active');
      document.getElementById(tabId).classList.add('active');
  }
</script>
<script>
	function openZipSearch() {
		console.log("openZipSearch()");
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 우편번호와 주소 데이터를 가져와 설정
	            const zip = data.zonecode; // 우편번호
	            const address = data.address; // 기본 주소
	            // HTML 요소에 값 설정
	            console.log(zip);
	            console.log(address);
	            document.querySelector('#zip-code').value = zip;
	            document.querySelector('#halladdress').value = address;
	        }
	    }).open();
	}
	document.addEventListener('DOMContentLoaded', function() {
		//openZipSearch();
	    // 우편번호 찾기 버튼에 이벤트 연결
	    /* document.querySelector('.address_btn').addEventListener('click', openZipSearch); */
	});
</script>
</body>
</html>