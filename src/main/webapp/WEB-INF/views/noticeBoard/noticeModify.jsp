<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 등록</title>
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

section{
    width: 1200px;
    margin: auto;
    flex: 1;
    margin-bottom: 30px;
}
.noticeInner{
    border-bottom: 1px solid black;
    margin-top: 80px;
    margin-bottom: 30px;
    width: 1130px;
}
h2{
    margin-bottom: 30px;
}
.noticeList{
    margin-top: 40px;
    width: 1130px;
}
.noticeInnerTitle{
  border-bottom: 1px solid black;
  margin-top: 30px;
  margin-bottom: 40px;
}
h3{
  margin-bottom: 30px;
}
h3 input{
	margin-left: 20px;
	width:94%;
	height:50px;
}
textarea{
  width: 100%;
  height: 400px;
  resize: none;
}
button{
    width: 70px;
    height: 40px;
    margin-top: 30px;
    border-radius: 2px;
    background-color: darkgray;
    font-size: 20px;
    display: inline-block;
   
}
button a{
    text-decoration-line: none;
    color:white;
}
.bnt_box{
  text-align: right;
  margin-right: 80px;
}
    </style>
    <section>
        <div class="noticeInner">
            <h2>공지사항 수정</h2>
        </div>
        <div class="noticeList">
          <form action="noticeModifyOk.do"  method="post">
            <div class="noticeInnerTitle">
            	<input type="hidden" name="nno" value="${vo.nno }">
              <h3>제목:<input type="text" id="title" name="title" value="${vo.title }"></h3>
            </div>
            <div>
              <textarea id="content" name="content"  >${vo.content }</textarea>
            </div>
            </div>
            <div class="bnt_box">
                <button type="submit">수정</button>
                <button><a href="noticeList.do">취소</a></button>
            </div>
          </form>
    </section>
    
<%@ include file="/WEB-INF/views/include/footer.jsp" %>