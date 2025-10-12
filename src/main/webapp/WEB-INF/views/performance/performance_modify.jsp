<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<!DOCTYPE html>
<html lang="en">
<head>
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
section{
    flex: 1;
    width: 1200px;
    margin: auto;
}
.write_page{
    margin-top: 50px;
    margin-bottom: 50px;
}
.write_box1{
    border: 1px solid black;
    width: 250px;
    height: 150px;
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
    width: 850px;
}
.step3 p{
	font-size: 30px;
}
.step2_button{
    margin-top: 20px;
    border-radius: 8px;
    width: 150px;
    height: 40px;
    cursor: pointer;
    background-color: white;
    font-size: 20px;
    font-weight: 700;
}
.step3_button{
	margin:auto;
    border-radius: 8px;
    width: 500px;
    height: 40px;
    background-color: white;
    font-size: 20px;
    font-weight: 700;
}
.available {
    width: 200px;
    border: 1px solid #ccc;
    padding: 10px;
    text-align: center;
    background-color: #f8f9fa;
}
.available p{
    margin-bottom: 20px;
}
.available input{
    margin-bottom: 20px;
}
.performance_select{
    margin-top: 20px;
    width: 500px;
    border-radius: 20px;
    height: 30px;
}
.performance_modify{
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
.performance_delete{
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
.performanceName{
	margin-bottom: 20px;
	margin-top: 40px;
}
.performanceAddress{
	margin-top: 70px;
	margin-bottom: 20px;
}
/*cal*/
.scriptCalendar { text-align:center; margin: auto; }
.scriptCalendar > thead > tr > td { width:50px;height:50px; }
.scriptCalendar > thead > tr:first-child > td { font-weight:bold; }
.scriptCalendar > thead > tr:last-child > td { background-color:#90EE90; }
.scriptCalendar > tbody > tr > td { width:50px;height:50px; }
.calendarBtn { cursor:pointer; }
/*cal*/
/*section*/
    </style>
      <section>
        <form action="${pageContext.request.contextPath}/performance_modify" method="post" >
	        <input type="hidden" name="rprfid" value="${rprf.rprfid}">
	      	<input type="hidden" name="hallid" value="${rprf.hallid}">
            <h1 class="write_page">공연 수정</h1>
            <div class="steps">
                <div class="step step3">
              	<p class="performanceName">공연명</p>
                <select class="performance_select" name="prfid">
			  		<c:forEach var="pervo" items="${pervo}">
                      	<option value="${pervo.prfid}">${pervo.prfnm}</option>
                  	</c:forEach>
				</select>
                <p class="performanceAddress">공연장</p>
                <div>
                    <div class="step3_button">${rprf.halladdress}</div>
                </div>
             </div>
                <div class="step step1">
                    <p>날짜 선택</p>
                	<div class="calendar">
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
                <input type="hidden" id="date" name="date" value="">
            	</div>
            <div class="available">
                <p>시간</p>
                <div>첫번째 회차</div><input type="time" name="time">
                <div>두번째 회차</div><input type="time" name="time2">
            </div>
            </div>
            <div class="btn_box">
                <button class="performance_modify">수정</button>
            </div>
        </form>
      </section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
      <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function() {
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
        }
    
        /**
         * @brief   다음달 버튼 클릭시
         */
        function nextCalendar() {
            this.toDay = new Date(toDay.getFullYear(), toDay.getMonth() + 1, toDay.getDate());
            buildCalendar();    // @param 명월 캘린더 출력 요청
        }
    
        let unavailableDates = [];

        function fetchUnavailableDates(prfid, callback) {
            $.ajax({
                url: `${contextPath}/getUnavailableDates`,
                type: "GET",
                data: { prfid: prfid },
                dataType: "json",
                success: function (data) {
                    callback(data); // 비활성화할 날짜 리스트를 콜백으로 전달
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching unavailable dates:", error);
                    callback([]); // 오류 발생 시 빈 리스트 반환
                },
            });
        }
                
        /**
         * @brief   캘린더 오픈
         * @details 날짜 값을 받아 캘린더 폼을 생성하고, 날짜값을 채워넣는다.
         */
        function buildCalendar() {
        	console.log("Building calendar with unavailable dates:", unavailableDates); 
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
                	const fullDate = `\${toDay.getFullYear()}-\${autoLeftPad(toDay.getMonth() + 1, 2)}-\${autoLeftPad(day, 2)}`;
                	const currentDate = new Date(fullDate);
                    
                    // @param 평일 날짜 데이터 삽입
                    column.innerText = autoLeftPad(day, 2);
    
                    if (unavailableDates.includes(fullDate) || currentDate < nowDate) {
                        // 비활성화 날짜 설정
                        column.style.backgroundColor = "#E5E5E5";
                        column.style.color = "#A9A9A9";
                        column.style.cursor = "not-allowed";
                        column.setAttribute("data-disabled", "true");
                    } else {
                        // 활성화 날짜 설정
                        column.style.backgroundColor = "#FFFFFF";
                        column.style.cursor = "pointer";
                        column.setAttribute("data-disabled", "false");
                        column.setAttribute("data-date", fullDate);
                        column.onclick = function () {
                            calendarChoiceDay(this);
                        };
                    }
                    
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
                            column.onclick = function(){ calendarChoiceDay(this); }
                        }
    
                        // @details 현재일인 경우
                        else if(nowDate.getDate() == day) {
                            column.style.backgroundColor = "#FFFFE6";
                            column.style.cursor = "pointer";
                            column.onclick = function(){ calendarChoiceDay(this); }
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
        
        $(document).ready(function () {
            const prfidSelect = $(".performance_select");
            prfidSelect.on("change", function () {
                const selectedPrfid = $(this).val();
                if (selectedPrfid) {
                    fetchUnavailableDates(selectedPrfid, function (dates) {
                        unavailableDates = dates; // 비활성화할 날짜 업데이트
                        buildCalendar(); // 캘린더 다시 생성
                    });
                }
            });

            buildCalendar();
        });
    
        /**
         * @brief   날짜 선택
         * @details 사용자가 선택한 날짜에 체크표시를 남긴다.
         */
         function calendarChoiceDay(column) {
        	    // @param 기존 선택일이 존재하는 경우 기존 선택일의 표시형식을 초기화 한다.
        	    
        	    if (column.getAttribute("data-disabled") === "true") {
			        alert("선택할 수 없는 날짜입니다.");
			        return;
			    }
        	    const previousChoice = document.getElementsByClassName("choiceDay")[0];

        	    if (previousChoice) {
        	        // @see 금일인 경우
        	        if (document.getElementById("calMonth").innerText == autoLeftPad((nowDate.getMonth() + 1), 2) &&
        	            previousChoice.innerText == autoLeftPad(toDay.getDate(), 2)) {
        	            previousChoice.style.backgroundColor = "#FFFFE6";
        	        } else {
        	            // @see 금일이 아닌 경우
        	            previousChoice.style.backgroundColor = "#FFFFFF";
        	        }
        	        previousChoice.classList.remove("choiceDay");
        	    }

        	    // @param 선택일 체크 표시
        	    column.style.backgroundColor = "#FF9999";

        	    // @param 선택일 클래스명 변경
        	    column.classList.add("choiceDay");

        	    // 날짜 값 가져오기
        	    const year = document.getElementById("calYear").innerText.trim();
        	    const month = document.getElementById("calMonth").innerText.trim().padStart(2, '0');
        	    const day = column.innerText.trim().padStart(2, '0');

        	    // 유효성 검사: year, month, day 값이 비어있으면 실행 중단
        	    if (!year || !month || !day || isNaN(day)) {
        	        console.error("Invalid date values:", { year, month, day });
        	        alert("유효하지 않은 날짜입니다. 다시 선택해주세요.");
        	        return; // 함수 종료
        	    }
        	    console.log("Year:", year);
        	    console.log("Month:", month);
        	    console.log("Day:", day);

        	    const date = `\${year}-\${month}-\${day}`; // YYYY-MM-DD 형식
        	    document.getElementById("date").value = date; // hidden input에 날짜 설정
        	    console.log("선택된 날짜:", date); // 디버깅용 로그
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
    const contextPath = "${pageContext.request.contextPath}"; // contextPath: 서버의 컨텍스트 경로를 JSP의 pageContext에서 가져옴
    $(document).ready(function () {	// 문서가 완전히 로드된 후 실행되는 함수 (jQuery의 ready 이벤트)
        $(".search-button").on("click", function (e) {  // 검색 버튼 클릭 이벤트 핸들러
            e.preventDefault(); // 기본 폼 제출 동작 방지 (페이지 새로고침 방지)
            const keyword = $(".step3 input").val().trim(); // 입력 필드에서 검색 키워드를 가져오고 앞뒤 공백을 제거
		
            if (keyword) {	// 검색어가 비어있지 않은 경우에만 AJAX 요청 실행
                $.ajax({
                    url: contextPath + "/performance",
                    type: "POST",
                    data: { keyword: keyword },
                    dataType: "json",
                    success: function (data) {
                        const resultList = $(".search-results"); // 검색 결과를 표시할 <ul> 요소
                        resultList.empty(); // 기존 검색 결과 초기화
                        
                        const performanceSelect = $(".performance_select");

                        data.forEach(function (performance) { // 서버에서 반환된 데이터(공연 목록)를 순회하며 화면에 표시
                            const li = $("<li>") //새로운 li 생성
                                .text(performance.prfnm) // 공연명(prfnm)을 <li>의 텍스트로 설정
                                .css("cursor", "pointer")
                                .data("prfid", performance.prfid) // 공연 ID(prfid)를 data 속성에 저장
                                .on("click", function () { // <li> 요소 클릭 이벤트 핸들러
                                	performanceSelect.val(performance.prfid);
                                    // 선택된 공연의 prfid와 prfnm을 찾아서 <select>에서 선택
                                    const select = $(".performance_select"); // <select> 요소를 가져옴
                                    select.find("option").each(function () { // <select>의 각 옵션을 순회하면서 선택된 공연의 ID와 일치하는 옵션을 찾음
                                        if ($(this).val() === performance.prfid.toString()) {
                                            $(this).prop("selected", true); // 해당 옵션 선택
                                        }
                                    });
                                });
                            resultList.append(li); // 리스트에 추가
                            
                            const existingOption = performanceSelect.find(`option[value='${performance.prfid}']`);
                            if (existingOption.length === 0) {
                                const option = $("<option>")
                                    .val(performance.prfid)
                                    .text(performance.prfnm);
                                performanceSelect.append(option);
                            }
                        });
                        performanceSelect.val(performanceSelect.find("option:first").val());
                    },
                    error: function (xhr, status, error) {
                        console.error("AJAX Error:", error);
                    }
                });
            }
        });
    });
    </script>
    <script>
	    $(document).ready(function () {
	        $(".reservation_button").on("click", function (e) {
	            e.preventDefault(); // 기본 폼 제출 방지
	
	            // 값 확인
	            const performanceId = $(".performance_select").val();
	            const date = $("#date").val();
	            const time1 = $("input[name='time']").val();
	            const time2 = $("input[name='time2']").val();
	
	            // 유효성 검사
	            if (!performanceId) {
	                alert("공연을 선택해주세요.");
	                return;
	            }
	            if (!date) {
	                alert("날짜를 선택해주세요.");
	                return;
	            }
	            if (!time1) {
	                alert("첫 번째 회차 시간을 입력해주세요.");
	                return;
	            }
	
	            // 모든 값이 유효하면 폼 제출
	            $("form").submit();
	        });
	    });
    </script>
    <script>
	    function fetchUnavailableDates(prfid, callback) {
	    	console.log("Fetching unavailable dates for prfid:", prfid);
	        $.ajax({
	            url: contextPath+"/getUnavailableDates",
	            type: "GET",
	            data: { prfid: prfid },
	            dataType: "json",
	            success: function (data) {
	                callback(data); // 비활성화할 날짜 리스트를 콜백으로 전달
	                console.log("Unavailable dates received:", data);
	            },
	            error: function (xhr, status, error) {
	                console.error("Error fetching unavailable dates:", error);
	                callback([]); // 오류 발생 시 빈 리스트 반환
	            },
	        });
	    }
    </script>
    <script>
	    $(document).ready(function() {
	        $('.performance_select').select2();
	    });
    </script>