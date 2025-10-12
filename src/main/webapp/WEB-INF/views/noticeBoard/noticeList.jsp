<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
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
table{
    border-color: black;
    border-top: 1px solid black;
    border-bottom: 1px solid black;
    width: 1130px;
    text-align: center;
    border-collapse: separate;
    border-spacing: 15px 15px;
}
.bnt1{
    width: 70px;
    height: 40px;
    margin-top: 30px;
    margin-bottom: 30px;
    border-radius: 2px;
    color:white;
    background-color: darkgray;
    margin-left: 1050px;
    font-size: 20px;
   
}
button a{
    text-decoration-line: none;
    color:white;
}
.searchType {
	width:100px;
	height:40px;
	margin-top: 30px;
	
}

.bnt2 {
	width: 100px;
    height: 40px;
    margin-bottom: 30px;
    
}
.serchInput{
	width:80%;
	height:40px;
	

}
.paging{
	margin-top:30px;
	 text-align: center;
}

    </style>
    <section>
        <div class="noticeInner">
            <h2>공지사항</h2>
            <form action="noticeList.do" method="get">
			<select name="searchType" class="searchType">
				<option value="title" <c:if test="${param.searchType eq 'title'}">selected </c:if>>제목</option>
				<option value="content" <c:if test="${param.searchType eq 'content'}">selected </c:if>>내용</option>
			</select>
			<input type="text" name="searchValue" value="${param.searchValue}" class="serchInput">
			<button class="bnt2">검색</button>
	</form>
        </div>
        <div class="noticeList">
            <table>
                <tr>
                    <th>NO</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>등록일</th>
                </tr>
                <c:forEach items="${noticeList}" var="vo">
                <tr>
                    <td>${vo.nno }</td>
                    <td><a href="noticeView.do?nno=${vo.nno }">${vo.title}</a></td>
                    <td>${vo.userid }</td>
                    <td>${vo.rdate }</td>
                </tr>
                </c:forEach>
            </table>
        </div>
        <div >
        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <button class="bnt1"><a href="noticeWrite.do">등록</a></button>
         </sec:authorize>
        </div>
        <div class="paging">
        <c:if test="${paging.startPage > 1 }">
		<a href="noticeList.do?nowpage=${paging.startPage-1 }">&lt;</a>	
		</c:if>

		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="cnt">
		
			<c:if test="${paging.nowPage eq cnt }">
				<b>${cnt }</b>
			</c:if>
		    <c:if test="${paging.nowPage ne cnt }">
		    <a href="noticeList.do?nowpage=${cnt}">${cnt}</a>
		    </c:if>		
		</c:forEach>
		<c:if test="${paging.endPage < paging.lastPage }">
			<a href="noticeList.do?nowpage=${paging.endPage+1 }">&gt;</a>
		</c:if>
		</div>
    </section>
    
<%@ include file="/WEB-INF/views/include/footer.jsp" %>