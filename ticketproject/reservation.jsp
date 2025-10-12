<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
/*section*/
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
html, body{
    height: 100%;
    display: flex;
    flex-direction: column;
    margin: 0;
}
section{
    width: 1200px;
    margin: auto;
    padding: 40px 0px;
    flex: 1;
}
.ticket-section {
  display: flex;
  gap: 20px;
  font-family: Arial, sans-serif;
}
.section_box{
    display: flex;
}
.poster img {
  margin-right: 40px;
  width: 295px;
  height: 400px;
}

.info {
  flex: 1;
}

.info h1 {
  font-size: 24px;
  margin-bottom: 10px;
  border-bottom: 1px solid gray;
  padding-bottom: 20px;
}

.details {
  width: 100%;
  border-collapse: collapse;
}

.details th {
  text-align: left;
  padding: 40px 0 0 10px;
  font-weight: bold;
  width: 100px;
}

.details td {
    padding: 40px 0 0 10px;
}

.details ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.details ul li {
  margin-bottom: 5px;
}

.steps {
  display: flex;
  gap: 20px;
}
.steps div{
    border-radius: 20px;
}

.step {
  border: 1px solid #ccc;
  padding: 10px;
  text-align: center;
  width: 150px;
}

.step1 {
    width: 450px;
}
.step2 {
    width: 300px;
}
.step3{
    width: 200px;
}
.available {
    width: 200px;
    border: 1px solid #ccc;
    padding: 10px;
    text-align: center;
    background-color: #f8f9fa;
}
.available p{
    margin-top: 41px;
    font-size: 20px;
    font-weight: 700;
}
.more-discount {
  text-decoration: none;
  color: blue;
}
.reservation_button{
    background-color: #c82020;
    height: 56px;
    font-size: 18px;
    font-weight: 900;
    width: 270px;
    border-radius: 15px;
    border: none;
    color: white;
    cursor: pointer;
}
.btn_box{
    text-align: right;
    margin-top: 20px;
}

/*cal*/
.scriptCalendar { text-align:center; margin: auto; }
.scriptCalendar > thead > tr > td { width:50px;height:50px; }
.scriptCalendar > thead > tr:first-child > td { font-weight:bold; }
.scriptCalendar > thead > tr:last-child > td { background-color:#90EE90; }
.scriptCalendar > tbody > tr > td { width:50px;height:50px; }
.calendarBtn { cursor:pointer; }
/*cal*/
.step3_button, .step2_button {
    margin-top: 20px;
    border-radius: 8px;
    width: auto; /* 글씨에 맞게 크기 조정 */
    min-width: 150px; /* 최소 너비 설정 */
    height: auto; /* 높이 자동 조정 */
    padding: 10px; /* 버튼 안의 여백 */
    cursor: pointer;
    background-color: white;
    font-size: 20px;
    font-weight: 700;
    text-align: center;
    word-wrap: break-word; /* 긴 단어 줄바꿈 */
    word-break: break-word; /* 단어 단위로 줄바꿈 */
    overflow-wrap: break-word; /* 글씨 넘침 방지 */
    white-space: normal; /* 줄바꿈 허용 */
}
.clicked {
    background-color: #FFD700;
    color: #000;
    font-weight: bold;
    border: 2px solid #FFA500;
}
/*section*/
</style>
      <section>
        <div class="section_box">
            <div class="poster">
                <img src="${prfImg.poster}" alt="">
            </div>
            <div class="info">
                <h1>&lt;${prfCheck.prfnm}&gt;</h1>
                <table class="details">
                <tr>
                    <th>기간</th>
                    <td>${prfCheck.prfpdfrom } ~ ${prfCheck.prfpdto }</td>
                </tr>
                <tr>
                    <th>관람시간</th>
                    <td>${prfCheck.prfruntime}</td>
                </tr>
                <tr>
                    <th>가격</th>
                    <td>${prfCheck.pcseguidance }</td>
                </tr>
                </table>
            </div>
        </div>
          <div class="steps">
            <div class="step step1">
              <h2>STEP1</h2>
              <p>날짜 선택</p>
              <div class="calendar">
                <form action="${pageContext.request.contextPath}/makeReservation" method="POST">
                	<input type="hidden" name="rprfid" value=""> 
	                <input type="hidden" name="userid" value="${userid}">
	                <input type="hidden" name="prfid" value="${prfCheck.prfid}">
	                <input type="hidden" name="hallid" value="${hall.hallid}">
	    			<input type="hidden" id="date" name="date">
	    			<input type="hidden" id="time" name="time">
	    			<input type="hidden" name="totalAmount" value="${prfCheck.pcseguidance}">
	    			<input type="hidden" name="performanceName" value="${prfCheck.prfnm}">
	    			<input type="hidden" id="location" name="location">
	    			<input type="hidden" name="poster" value="${prfImg.poster}">
    			
                    <table class="scriptCalendar">
                        <thead>
                            <tr>
                                <td class="calendarBtn" id="btnPrevCalendar">&#60;&#60;</td>
                                <td colspan="5">
                                    <span id="calYear">YYYY</span>년
                                    <span id="calMonth">MM</span>월
                                </td>
                                <td class="calendarBtn" id="nextNextCalendar">&#62;&#62;</td>
                            </tr>
                            <tr>
                                <td>일</td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td><td>토</td>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
                </div>
                <div class="step step2">
                    <h2>STEP2</h2>
                    <p>장소</p>
                    <div>
				        <c:choose>
				            <c:when test="${not empty schedules}">
				                <c:forEach var="schedule" items="${schedules}">
				                    <button class="step3_button">${schedule.halladdress}</button>
				                </c:forEach>
				            </c:when>
				            <c:otherwise>
				                <p>해당 날짜에 공연 장소가 없습니다.</p>
				            </c:otherwise>
				        </c:choose>
				    </div>
                </div>
                <div class="step step3">
                <h2>STEP3</h2>
                <p>회차 선택</p>
                <div>

			    </div>
                </div>
                <div class="available">
				    <h2>예약가능좌석</h2>
				    <p>총 좌석: <span></span></p>
				    <!-- 새로운 좌석 정보를 표시할 영역 -->
				    <div class="seats-info-container"></div>
				</div>
            </div>
            <div class="btn_box">
                <button class="reservation_button">예매하기</button>
            </div>
        </form>
      </section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
      <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function() {
        	
        	const form = document.querySelector("form");
            const locationInput = document.getElementById("location");
            const timeInput = document.getElementById("time");
            const reservationButton = document.querySelector(".reservation_button");
			
	            form.addEventListener("submit", function (event) {
	            	const dateInput = document.getElementById("date");
	            	console.log(dateInput.value);
					
	                let errorMessage = "";
	
	                // 장소 선택 여부 확인
	                if (!locationInput.value.trim()) {
	                    errorMessage += "장소를 선택해주세요.\n";
	                }
	
	                // 회차 선택 여부 확인
	                if (!timeInput.value.trim() || timeInput.value.trim() === "00:00:00") {
			            errorMessage += "회차를 다시 선택해주세요.\n";
			        }
	
	                // 에러 메시지가 있으면 제출 중단
	                if (errorMessage) {
	                    event.preventDefault(); // 폼 제출 중단
	                    alert(errorMessage); // 경고 메시지 표시
	                }
	            });
        	
        	 document.querySelectorAll('.step3_button').forEach(button => {
        	        button.addEventListener('click', function () {
        	            const locationInput = document.getElementById('location');
        	            locationInput.value = this.textContent.trim(); // 장소 설정
        	        });
        	    });
        	 
        	 document.querySelectorAll('.step2_button').forEach(button => {
        	        button.addEventListener('click', function () {
        	        	
        	        	const rprfidInput = document.getElementById("rprfid");
        	            const timeInput = document.getElementById('time');
        	            
        	            rprfidInput.value = this.dataset.rprfid; // 버튼의 data-rprfid에서 값 가져오기
        	            timeInput.value = this.textContent.trim(); // 버튼 텍스트(시간) 설정
        	            
        	            
        	        });
        	    });
        	
            buildCalendar();
            
            document.getElementById("btnPrevCalendar").addEventListener("click", function(event) {
                prevCalendar();
            });
            
            document.getElementById("nextNextCalendar").addEventListener("click", function(event) {
                nextCalendar();
            });
        });
    
        var toDay = new Date(); // @param 전역 변수, 오늘 날짜 / 내 컴퓨터 로컬을 기준으로 toDay에 Date 객체를 넣어줌
        var nowDate = new Date();  // @param 전역 변수, 실제 오늘날짜 고정값
        
        /**
         * @brief   이전달 버튼 클릭시
         */
        function prevCalendar() {
            this.toDay = new Date(toDay.getFullYear(), toDay.getMonth() - 1, toDay.getDate());
            buildCalendar();    // @param 전월 캘린더 출력 요청
            bindCalendarEvents(); // 새롭게 생성된 캘린더에 이벤트 재바인딩
        }
    
        /**
         * @brief   다음달 버튼 클릭시
         */
        function nextCalendar() {
            this.toDay = new Date(toDay.getFullYear(), toDay.getMonth() + 1, toDay.getDate());
            buildCalendar();    // @param 명월 캘린더 출력 요청
            bindCalendarEvents(); // 새롭게 생성된 캘린더에 이벤트 재바인딩
        }
    
        /**
         * @brief   캘린더 오픈
         * @details 날짜 값을 받아 캘린더 폼을 생성하고, 날짜값을 채워넣는다.
         */
        function buildCalendar() {
    
            let doMonth = new Date(toDay.getFullYear(), toDay.getMonth(), 1);
            let lastDate = new Date(toDay.getFullYear(), toDay.getMonth() + 1, 0);
    
            let tbCalendar = document.querySelector(".scriptCalendar > tbody");
    
            document.getElementById("calYear").innerText = toDay.getFullYear();                       // @param YYYY월
            document.getElementById("calMonth").innerText = autoLeftPad((toDay.getMonth() + 1), 2);   // @param MM월
            
    
            // @details 이전 캘린더의 출력결과가 남아있다면, 이전 캘린더를 삭제한다.
            while(tbCalendar.rows.length > 0) {
                tbCalendar.deleteRow(tbCalendar.rows.length - 1);
            }
    
            // @param 첫번째 개행
            let row = tbCalendar.insertRow();
    
            // @param 날짜가 표기될 열의 증가값
            let dom = 1;
    
            // @details 시작일의 요일값( doMonth.getDay() ) + 해당월의 전체일( lastDate.getDate())을  더해준 값에서
            //               7로 나눈값을 올림( Math.ceil() )하고 다시 시작일의 요일값( doMonth.getDay() )을 빼준다.
            let daysLength = (Math.ceil((doMonth.getDay() + lastDate.getDate()) / 7) * 7) - doMonth.getDay();
    
            // @param 달력 출력
            // @details 시작값은 1일을 직접 지정하고 요일값( doMonth.getDay() )를 빼서 마이너스( - )로 for문을 시작한다.
            for(let day = 1 - doMonth.getDay(); daysLength >= day; day++) {
    
                let column = row.insertCell();
    
                // @param 평일( 전월일과 익월일의 데이터 제외 )
                if(Math.sign(day) == 1 && lastDate.getDate() >= day) {
    
                    // @param 평일 날짜 데이터 삽입
                    column.innerText = autoLeftPad(day, 2);
    
                    // @param 일요일인 경우
                    if(dom % 7 == 1) {
                        column.style.color = "#FF4D4D";
                    }
    
                    // @param 토요일인 경우
                    if(dom % 7 == 0) {
                        column.style.color = "#4D4DFF";
                        row = tbCalendar.insertRow();   // @param 토요일이 지나면 다시 가로 행을 한줄 추가한다.
                    }
    
                }
    
                // @param 평일 전월일과 익월일의 데이터 날짜변경
                else {
                    let exceptDay = new Date(doMonth.getFullYear(), doMonth.getMonth(), day);
                    column.innerText = autoLeftPad(exceptDay.getDate(), 2);
                    column.style.color = "#A9A9A9";
                }
    
                // @brief   전월, 명월 음영처리
                // @details 현재년과 선택 년도가 같은경우
                if(toDay.getFullYear() == nowDate.getFullYear()) {
    
                    // @details 현재월과 선택월이 같은경우
                    if(toDay.getMonth() == nowDate.getMonth()) {
    
                        // @details 현재일보다 이전인 경우이면서 현재월에 포함되는 일인경우
                        if(nowDate.getDate() > day && Math.sign(day) == 1) {
                            column.style.backgroundColor = "#E5E5E5";
                        }
    
                        // @details 현재일보다 이후이면서 현재월에 포함되는 일인경우
                        else if(nowDate.getDate() < day && lastDate.getDate() >= day) {
                            column.style.backgroundColor = "#FFFFFF";
                            column.style.cursor = "pointer";
                            column.onclick = function(){
                            	calendarChoiceDay(this);
                            	SetSelectDate(document.getElementsByClassName("choiceDay")[0]);
                            }
                        }
    
                        // @details 현재일인 경우
                        else if(nowDate.getDate() == day) {
                            column.style.backgroundColor = "#FFFFE6";
                            column.style.cursor = "pointer";
                            column.onclick = function(){
                            	calendarChoiceDay(this);
                            	SetSelectDate(document.getElementsByClassName("choiceDay")[0]);
                            }
                        }
    
                    // @details 현재월보다 이전인경우
                    } else if(toDay.getMonth() < nowDate.getMonth()) {
                        if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                            column.style.backgroundColor = "#E5E5E5";
                        }
                    }
    
                    // @details 현재월보다 이후인경우
                    else {
                        if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                            column.style.backgroundColor = "#FFFFFF";
                            column.style.cursor = "pointer";
                            column.onclick = function(){ calendarChoiceDay(this); }
                        }
                    }
                }
    
                // @details 선택한년도가 현재년도보다 작은경우
                else if(toDay.getFullYear() < nowDate.getFullYear()) {
                    if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                        column.style.backgroundColor = "#E5E5E5";
                    }
                }
    
                // @details 선택한년도가 현재년도보다 큰경우
                else {
                    if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                        column.style.backgroundColor = "#FFFFFF";
                        column.style.cursor = "pointer";
                        column.onclick = function(){ calendarChoiceDay(this); }
                    }
                }
                dom++;
            }
        }
        
       function SetSelectDate(obj){
    	   const selectedDate = `\${document.getElementById("calYear").innerText}-\${document.getElementById("calMonth").innerText}-\${obj.innerText.trim()}`;
    	    const prfid = document.querySelector("input[name='prfid']").value;

    	    // 날짜 값이 올바르게 생성되었는지 확인
    	    if (!selectedDate || selectedDate.includes('--')) {
    	        console.error("Invalid date:", selectedDate);
    	        return;
    	    }
    	    console.log("Selected Date:", selectedDate); // 디버깅: 선택된 날짜 출력
    	    console.log("Performance ID:", prfid); // 디버깅: 공연 ID 출력
    	    
    	    // AJAX 요청
    	    $.ajax({
    	        url: "${pageContext.request.contextPath}/getScheduleByDate",
    	        type: "GET",
    	        data: { prfid: prfid, date: selectedDate },
    	        dataType: "json",
    	        success: function (response) {
    	        	console.log("Response Data:", response);
    	            updateScheduleUI(response); // 성공 시 UI 업데이트
    	        },
    	        error: function (xhr, status, error) {
    	            console.error("AJAX Error:", status, error);
    	        }
    	    });
    	   
       }
    
        /**
         * @brief   날짜 선택
         * @details 사용자가 선택한 날짜에 체크표시를 남긴다.
         */
         function calendarChoiceDay(column) {
        	 console.log("Clicked column innerText:", column.innerText);
        	    const year = document.getElementById("calYear").innerText.trim();
        	    const month = document.getElementById("calMonth").innerText.trim().padStart(2, '0'); // 2자리 포맷
        	    const day = column.innerText.trim().padStart(2, '0'); // 2자리 포맷

        	    if (!year || !month || !day) {
        	        console.error("Invalid date components:", { year, month, day });
        	        return;
        	    }
        	    const selectedDate = `\${document.getElementById("calYear").innerText}-\${document.getElementById("calMonth").innerText}-\${column.innerText}`;
        	    console.log("Selected Date:", selectedDate);
        	    
        	    const dateInput = document.getElementById("date");
        	    console.log("Setting hidden date value:", selectedDate); // 디버깅용 로그
        	    dateInput.value = selectedDate; // Hidden input에 값 설정

        	    // 기존 선택일 스타일 초기화
        	    const previousChoice = document.querySelector(".choiceDay");
        	    if (previousChoice) {
        	        previousChoice.style.backgroundColor = "#FFFFFF";
        	        previousChoice.classList.remove("choiceDay");
        	    }
				
        	    
        	    // 현재 선택한 날짜 스타일 적용	
        	    column.style.backgroundColor = "#FF9999";
        	    column.classList.add("choiceDay");
        	}
    
        /**
         * @brief   숫자 두자릿수( 00 ) 변경
         * @details 자릿수가 한자리인 ( 1, 2, 3등 )의 값을 10, 11, 12등과 같은 두자리수 형식으로 맞추기위해 0을 붙인다.
         * @param   num     앞에 0을 붙일 숫자 값
         * @param   digit   글자의 자릿수를 지정 ( 2자릿수인 경우 00, 3자릿수인 경우 000 … )
         */
        function autoLeftPad(num, digit) {
            if(String(num).length < digit) {
                num = new Array(digit - String(num).length + 1).join("0") + num;
            }
            return num;
        }
    </script>
    <script>
    function updateScheduleUI(data) {
        const step2Div = document.querySelector(".step2 div"); // 장소 출력 영역
        const step3Div = document.querySelector(".step3 div"); // 회차 출력 영역
        
        console.log("Schedule Data:", data);

        // 기존 내용을 초기화
        step2Div.innerHTML = "";
        step3Div.innerHTML = "";

        if (data && data.length > 0) {
            data.forEach(schedule => {
                // 장소 버튼 추가
                const hallButton = document.createElement("button");
                hallButton.classList.add("step3_button");
                hallButton.textContent = schedule.halladdress || "장소 정보 없음";
                hallButton.dataset.hallid = schedule.hallid; // hallid 추가
                hallButton.addEventListener("click", function () {
                    const locationInput = document.getElementById("location");
                    const hallIdInput = document.querySelector("input[name='hallid']");
                    locationInput.value = this.textContent.trim(); // 장소 설정
                    hallIdInput.value = this.dataset.hallid; // hallid 설정
                    handleButtonClick(hallButton, ".step3_button");
                });
                step2Div.appendChild(hallButton);

                // 회차 버튼 추가 (time)
                if (schedule.time) {
                    const timeButton = document.createElement("button");
                    timeButton.classList.add("step2_button");
                    timeButton.textContent = schedule.time;
                    timeButton.dataset.rprfid = schedule.rprfid; // rprfid 추가
                    timeButton.setAttribute("onclick", `fetchRemainingSeats(\${schedule.rprfid})`);
                    console.log("Button created with rprfid:", schedule.rprfid);
                    timeButton.addEventListener("click", function () {
                        const timeInput = document.getElementById("time");
                        const rprfidInput = document.querySelector("input[name='rprfid']");
                        timeInput.value = this.textContent.trim(); // 시간 설정
                        rprfidInput.value = this.dataset.rprfid; // rprfid 설정
                        handleButtonClick(timeButton, ".step2_button");
                    });
                    step3Div.appendChild(timeButton);
                }

                // 회차 버튼 추가 (time2)
                if (schedule.time2 && schedule.time2.trim() !== "") {
                    const timeButton2 = document.createElement("button");
                    timeButton2.classList.add("step2_button");
                    timeButton2.textContent = schedule.time2;
                    timeButton2.dataset.rprfid = schedule.rprfid; // rprfid 추가
                    
                    timeButton2.addEventListener("click", function () {
                        const timeInput = document.getElementById("time");
                        const rprfidInput = document.querySelector("input[name='rprfid']");
                        timeInput.value = this.textContent.trim(); // 시간 설정
                        rprfidInput.value = this.dataset.rprfid; // rprfid 설정
                        handleButtonClick(timeButton2, ".step2_button");
                    });
                    step3Div.appendChild(timeButton2);
                }
                
                // 잔여 좌석 정보 추가
            });
        } else {
            // 데이터가 없는 경우 처리
            step2Div.innerHTML = "<p>해당 날짜에 공연 장소가 없습니다.</p>";
            step3Div.innerHTML = "<p>회차 정보 없음</p>";
        }
    }



    </script>
    <script>
	    function handleButtonClick(button, buttonClass) {
	        // 기존 선택된 버튼의 상태 초기화
	        document.querySelectorAll(buttonClass).forEach(btn => btn.classList.remove("clicked"));
	
	        // 현재 클릭된 버튼에 클래스 추가
	        button.classList.add("clicked");
	    }
    </script>
	<script>
	function bindCalendarEvents() {
	    const calendarCells = document.querySelectorAll(".scriptCalendar tbody td");

	    calendarCells.forEach(cell => {
	        // 비어있는 날짜는 클릭 이벤트 생략
	        if (!cell.innerText.trim() || cell.style.color === "rgb(169, 169, 169)") {
	            return;
	        }

	        cell.style.cursor = "pointer"; // 클릭 가능하게 표시
	        cell.addEventListener("click", function () {
	            calendarChoiceDay(this);
	            SetSelectDate(this); // AJAX 요청 트리거
	        });
	    });
	}
	</script>
   
   	<script>
   	function fetchRemainingSeats(rprfid) {
   		console.log("fetchRemainingSeats called with rprfid:", rprfid);
   	    if (!rprfid) {
   	        alert("rprfid is missing or invalid!");
   	        return; // 유효하지 않으면 중단
   	    }
   	    // AJAX 요청
   	    $.ajax({
   	        url: "${pageContext.request.contextPath}/getRemainingSeatsBySchedule",
   	        type: "GET",
   	        data: { rprfid: rprfid },
   	        dataType: "json",
   	        success: function (response) {
   	        	console.log("AJAX response:", response);
   	            if (response.status === "success") {
   	                console.log("Remaining Seats:", response.remainingSeats);
   	                
   	                // UI에 남은 좌석 수 표시
   	                const seatsInfoContainer = document.querySelector(".seats-info-container");
   	                seatsInfoContainer.innerHTML = `<p>남은 좌석수: \${response.remainingSeats}</p>`;
   	            } else {
   	                console.error("Error fetching remaining seats:", response.message);
   	            }
   	        },
   	        error: function (xhr, status, error) {
   	            console.error("AJAX Error:", status, error);
   	        }
   	    });
   	}
   	</script>