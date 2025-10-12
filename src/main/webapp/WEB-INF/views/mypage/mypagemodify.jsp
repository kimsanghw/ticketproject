<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
.tab-content.active {
    display: block;
}
.mypage_main {
    border: 1px solid gray;
    width: 1200px;
    margin-top: 50px;
    margin-bottom: 50px;
}
.modify_button{
    padding: 8px 12px;
    border: 1px solid #ccc;
    cursor: pointer;
    border-radius: 4px;
}
</style>
        <main>
            <section>
                <h1 class="mypage_page">내 정보 수정</h1>
                <div>
                    <div id="user" class="tab-content mypage_main active">
                        <h4 style="border-bottom: 1px solid black; padding-bottom: 10px;">내 정보</h4>
                        <div> 
    					<form id="updateForm" action="<%=request.getContextPath()%>/mypage/mypagemodify.do" method="post">
					        <table class="info-table">
					            <tr>
					                <th>아이디 <span class="required">*</span></th>
					                <td>${vo.userId }</td>
					            </tr>
					            <tr>
					                <th>이름 <span class="required">*</span></th>
					                <td><input type="text" name="name" value="${vo.name }" /></td>
					            </tr>
					            <tr>
					                <th>생년월일 <span class="required">*</span></th>
					                <td><input type="date" name="birthDate" value=""  /></td>
					            </tr>
					            <tr>
					               <th>휴대폰 <span class="required">*</span></th>
					                <td><input type="text" name="phone" value=""  /></td>
					            </tr>
					            <tr>
					                <th>이메일 <span class="required">*</span></th>
					                <td><input type="email" name="email" value=""  /></td>
					            </tr>
					        </table>
				        <button type="submit" class="modify_button">저장</button>
				    	</form>
                        </div>
                    </div>
                </div>
            </section>
        </main>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
