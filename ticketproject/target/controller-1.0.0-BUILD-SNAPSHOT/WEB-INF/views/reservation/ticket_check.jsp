<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
          <div class="ticket"><img src="1번공연.jpg"></div>
          <div class="ticket_content">
              <div class="ticket_box">
                  <div>공연명 : 1승</div>
                  <div>좌석번호 : A열 2번</div>
                  <div>공연장 : 이젠컴퓨터학원</div>
                  <div>공연일 : 2024-12-02</div>
                  <div>금액 : 18,000원</div>
              </div>
          </div>
          <div class="ticket_button">
              <form>
              <button class="payment" id="kaobtn">결제</button>
              </form>
              <button class="back">취소</button>
          </div>
        </div>
      </section>
      <script>
      	$("#kaobtn").click(function (){
      		$.ajax({
      			type: 'POST',
      			url: 'payReady.do',
      			data: {
      				item_name : "1승",
      				quantity: "1",
      				total_amount : "18000",
      				tax_free_amount : "0"
      				
      			},
      			success:function(res){
      				location.href = res.next_redirect_pc_url;
      			}
      		})
      	})
      </script>