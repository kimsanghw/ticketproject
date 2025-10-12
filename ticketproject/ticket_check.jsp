<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
}
.ticket_section{
    width: 600px;
    margin: auto;
    background-color: blanchedalmond;
    border-radius: 30px;
}
.h1{
    text-align: center;
    margin-top: 40px;
    padding-top: 40px;
}
.ticket{
    text-align: center;
    margin-top: 40px;
}
.ticket_content{
    text-align: center;
    font-weight: 700;
}
.ticket_box{
    width: 298px;
    margin: auto;
    text-align: left;
    padding-bottom: 30px;
}
.ticket_box div{
    padding-top: 30px;
}
.ticket img{
	width: 295px;
	height: 400px;
}
.payment{
    width: 295px;
    margin-bottom: 10px;
    background-color: #0078d4;
    color: white;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
    border-radius: 5px;
}
.back{
    width: 295px;
    margin-bottom: 10px;
    background-color: white;
    color: black;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
    border-radius: 5px;
}
.ticket_button{
    text-align: center;
    margin-bottom: 40px;
}
    </style>
      <section>
        <div class="ticket_section">
          <h1 class="h1">예매 확인</h1>
          <div class="ticket"><img src="${prfImg.poster}"></div>
          <div class="ticket_content">
              <div class="ticket_box">
                  <div>공연명 : ${performanceName}</div>
                  <c:forEach var="schedule" items="${schedules}">
				    <div>공연장 : ${schedule.halladdress}</div>
				  </c:forEach>
                  <div>공연일 : ${date} - ${time}</div>
                  <div>금액 : ${totalAmount}</div>
              </div>
          </div>
          <div class="ticket_button">
              
              <button class="payment" id="kaobtn">결제</button>
              
              <button class="back">취소</button>
          </div>
        </div>
      </section>
      <script>
   // 카카오페이 결제 팝업창 연결
      $(function() {
          $("#kaobtn").click(function(e) {
              // 아래 데이터 외에도 필요한 데이터를 원하는 대로 담고, Controller에서 @RequestBody로 받으면 됨
              console.log("${reservationid}");
              var name = "${performanceName}";
              let str = "<c:out value='${totalAmount}'/>";
              console.log('str value:', str);
              let parts = str.split(':');
              let totalPrice = str.replace(/[^0-9]/g, '');
              console.log(totalPrice); // 출력: 숫자만
              let data = {
                  name: name,    // 카카오페이에 보낼 대표 상품명
                  totalPrice: totalPrice, // 총 결제금액
                  quantity: 1,
                  reservationid : ${reservationid}
              };
              $.ajax({
                  type: 'POST',
                  url: '/controller/payment/payReady.do',
                  data: JSON.stringify(data),
                  contentType: 'application/json',
                  success: function(response) {
                	  //console.log("응답을 받았습니다");
                      location.href = response.next_redirect_pc_url;
                  }
              });
          });
      });
      </script>