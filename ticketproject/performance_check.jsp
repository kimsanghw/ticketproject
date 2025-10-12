<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
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
  padding-bottom: 100px;
}
section{
    width: 1200px;
    margin: auto;
    padding: 40px 0px;
    flex: 1;
}
.view_img{
    float: left;
    margin: 0px 50px 0px 0px;
}
.view_img img{
	width: 295px;
  	height: 400px;
}
.view_view{
    padding-top: 15px;
}
.view_view div{
    margin-bottom: 50px;
}
.view_comment{
    margin-top: 10px;
    width: 100%;
}
.button{
    width: 295px;
    margin-bottom: 10px;
    background-color: #0078d4;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
    border-radius: 5px;
}
a{
    text-decoration: none;
    color: black;
}
.tab-container {
    display: flex;
    border-bottom: 2px solid black;
    margin-bottom: 20px;
}
.content{
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
    border: 1px solid white;
    padding: 20px;
}
.tab-content.active {
    display: block;
}
.view_Information{
    margin-top: 20px;
    margin-bottom: 20px;
    
}
.view_Information p {
    text-align: center; /* 텍스트와 이미지 가운데 정렬 */
}

.view_Information img {
    display: inline-block; /* 이미지가 한 줄로 정렬되도록 설정 */
    margin: 10px; /* 이미지 간의 간격 추가 (선택 사항) */
    max-width: 100%; /* 반응형 이미지 (선택 사항) */
    height: auto;
   
}

/*별점*/
.star {
    position: relative;
    font-size: 2rem;
    color: #ddd;
  }
  
.star input {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    opacity: 0;
    cursor: pointer;
}

.star span {
    width: 0;
    position: absolute; 
    left: 0;
    color: red;
    overflow: hidden;
    pointer-events: none;
}
.comment_box{
    margin-top: 30px;
}
#review{
    border: 1px solid black;
    border-radius: 20px;
}
#info{
    border: 1px solid black;
    border-radius: 20px;
    overflow: hidden;
}
/*#info img{
        max-width: 100%;
        height: auto;
        display: block;
        margin-bottom: 10px;
        
}
#info img src{
	 align-items: center;
}*/
.review_comment{
    width: 1140px;
    height: 100px;
    margin-top: 15px;
    resize: none;
}
.comment_button{
    text-align: right;
}
.comment_button button{
    background-color: white;
    color: black;
    width: 70px;  /* 버튼 너비 조정 */
    height: 35px;  /* 버튼 높이 조정 */
    border-radius: 5px;
    cursor: pointer;
    border: 1px solid #ddd;  /* 테두리 추가 */
    margin-right:20px;
}
.review_box{
    border-radius: 10px;
    background-color: beige;
    padding: 10px 10px 10px 10px;
    margin-top: 30px;
}
.review_id{
    margin-right: 10px;
    font-size: 15px;
    color: gray;
}
.button_modify{
    background-color: white;
    color: black;
    width: 50px;
    height: 30px;
    border-radius: 5px;
    cursor: pointer;
}
.button_delete{
    background-color: white;
    color: black;
    width: 50px;
    height: 30px;
    border-radius: 5px;
    cursor: pointer;
}
.button_declaration{
    background-color: white;
    color: black;
    width: 50px;
    height: 30px;
    border-radius: 5px;
    cursor: pointer;
}

.review_button{
    text-align: right;
    margin-top: 10px;
}
.review_idBox{
    display: flex;
}
.review_rdate{
    margin-left: 10px;
    font-size: 15px;
    color: gray;
}
*/
.review_button {
    display: flex;  /* 버튼을 가로로 정렬 */
    align-items: center;  /* 버튼들이 세로 중앙 정렬 */
    gap: 10px;  /* 버튼 간 간격 */
}

.inline_form {
    display: inline;  /* 폼을 인라인으로 설정해 버튼과 나란히 표시 */
}

.button_modify,
.button_delete,
.button_declaration {
    background-color: white;
    color: black;
    width: 70px;  /* 버튼 너비 조정 */
    height: 35px;  /* 버튼 높이 조정 */
    border-radius: 5px;
    cursor: pointer;
    border: 1px solid #ddd;  /* 테두리 추가 */
}

.button_modify:hover,
.button_delete:hover,
.button_declaration:hover {
    background-color: #f4f4f4;  /* 마우스 오버 효과 */
}

.review_content{
    margin-top: 15px;
}
    </style>
      <section>
        <div class="section_view">
            <h1 class="content">상세정보</h1>
            <div class="view_img"><img src="${prfImg.poster}"></div>
            <div class="view_view">
                <div>　</div>
                <div>공연명 : ${prfCheck.prfnm }</div>
				<c:if test="${empty prfCheck.prfpdfrom or empty prfCheck.prfpdto or prfCheck.prfpdfrom == '' or prfCheck.prfpdto == ''}">
				    <div>공연기간 : <c:out value="미정" /></div>
				</c:if>
				<c:if test="${not empty prfCheck.prfpdfrom and not empty prfCheck.prfpdto and prfCheck.prfpdfrom != '' and prfCheck.prfpdto != ''}">
				    <div>공연기간 : ${prfCheck.prfpdfrom} ~ ${prfCheck.prfpdto}</div>
				</c:if>
				<c:if test="${empty prfCheck.prfruntime or prfCheck.prfruntime.trim() == ''}">
				    <div>공연시간 : <c:out value="미정" /></div>
				</c:if>
				<c:if test="${not empty prfCheck.prfruntime and prfCheck.prfruntime.trim() != ''}">
				    <div>공연시간 : ${prfCheck.prfruntime}</div>
				</c:if>
				
				<c:if test="${empty prfCheck.pcseguidance or prfCheck.pcseguidance.trim() == ''}">
				    <div>공연가격 : <c:out value="미정" /></div>
				</c:if>
				<c:if test="${not empty prfCheck.pcseguidance and prfCheck.pcseguidance.trim() != ''}">
				    <div>공연가격 : ${prfCheck.pcseguidance}</div>
				</c:if>
                <div>　</div>
            </div>
        </div>
        <c:if test="${rprfid != 0}">
        <button class="button"><a href="${pageContext.request.contextPath}/reservation?prfid=${prfCheck.prfid}">예매하기</a></button>
        </c:if>
        <c:if test="${rprfid == 0}">
         <button  type="button" style="display:none;"><a href="${pageContext.request.contextPath}/reservation?prfid=${prfCheck.prfid}" >예매하기</a></button>
         </c:if>
        <div class="view_comment">
            <div class="tab-container">
                <div class="tab active" onclick="openTab(event, 'info')">주요정보</div>
                <div class="tab" onclick="openTab(event, 'review')">리뷰</div>
            </div>
            <div id="info" class="tab-content active">
                <h2>주요정보</h2>
                <div class="view_Information">
                    <p>
	                    <img src="${prfImg.styuri1}" >
	                    <img src="${prfImg.styuri2}">
	                    <img src="${prfImg.styuri3}">
	                    <img src="${prfImg.styuri4}">
                    </p>
                </div>
                <h2>출연진</h2>
                <c:if test="${empty prfCheck.prfcrew}">
				    <div>공연 제작진 : <c:out value="미정" /></div>
				</c:if>
                <c:if test="${not empty prfCheck.prfcrew}">
                	<div>공연 제작진 : ${prfCheck.prfcrew}</div>
                </c:if>
                <c:if test="${empty prfCheck.prfcast}">
                	<div>공연 출연진 : 미정</div>
                </c:if>
                <c:if test="${not empty prfCheck.prfcast}">
                	<div>공연 출연진 : ${prfCheck.prfcast}</div>
                </c:if>
            </div>
            <div id="review" class="tab-content">
            <sec:authorize access="isAuthenticated()">
            <c:if test="${rprfid != 0}">
                <h2>리뷰</h2>
               <form action="${pageContext.request.contextPath}/reviewinsert" method="post" onsubmit="return validateReviewForm(this);">
				    <!-- prfid가 null이면 기본값을 설정 -->
				    <input type="hidden" value="${prfCheck != null ? prfCheck.prfid : ''}" name="prfid">
				    <div class="comment_box">
				        <span class="star">
				            ★★★★★
				            <span>★★★★★</span>
				            <input type="range" oninput="drawStar(this)" value="0" step="1" min="0" max="5" name="rating" id="rating">
				        </span>
				        <div>
				            <textarea class="review_comment" placeholder="리뷰를 입력해주세요" name="content"></textarea>
				        </div>
				        <div class="comment_button">
				            <button>등록</button>
				        </div>
				    </div>
				</form>
				</c:if>
				<c:if test="${rprfid == 0}">
					<h2>리뷰</h2>
	               <form action="${pageContext.request.contextPath}/reviewinsert" method="post" style="display:none;">
					    <!-- prfid가 null이면 기본값을 설정 -->
					    <input type="hidden" value="${prfCheck != null ? prfCheck.prfid : ''}" name="prfid">
					    <div class="comment_box">
					        <span class="star">
					            ★★★★★
					            <span>★★★★★</span>
					            <input type="range" oninput="drawStar(this)" value="0" step="1" min="0" max="5" name="rating" id="rating">
					        </span>
					        <div>
					            <textarea class="review_comment" placeholder="리뷰를 입력해주세요" name="content"></textarea>
					        </div>
					        <div class="comment_button">
					            <button>등록</button>
					        </div>
					    </div>
					</form>
				</c:if>
				</sec:authorize>				
				<c:forEach items="${reviewList}" var="vo">
				<div class="review_box">
				    <div>
				        <div class="review_idBox"  >
				            <div class="review_id">${vo.userid}</div>
				            <div style="color: gray;">|</div>
				            <div class="review_rdate">${vo.rdate}</div>
				        </div>
				        <div>
				            <span class="star">
				                ★★★★★
				                <span style="width: ${vo.rating * 20}%;">★★★★★</span>   
				            </span>
				        </div>
				        <div class="review_content">
							<textarea class="review_comment" readonly="readonly">${vo.content}</textarea>
				        </div>
				    </div>
				    
				    <div class="review_button">
					    <c:if test="${loggedInUser != null && loggedInUser == vo.userid}">
					        <button class="button_modify" onclick="showEditForm(this)">수정</button>
					        <form action="${pageContext.request.contextPath}/reviewRemove" id="removeForm${vo.reviewid}" method="post" class="inline_form">
					            <input type="hidden" value="${prfCheck != null ? prfCheck.prfid : ''}" name="prfid">
					            <input type="hidden" name="reviewid" value="${vo.reviewid}">
					            <button class="button_delete" type="button" onclick="confirmDelete(this)">삭제</button>
					        </form>
					    </c:if>
					    <sec:authorize access="isAuthenticated()">
					        <button class="button_declaration" onclick="declarationPopup('${vo.reviewid != null ? vo.reviewid : 0}')">신고</button>
					    </sec:authorize>
					</div>
				   
				    <!-- 수정 폼 -->
				<form action="${pageContext.request.contextPath}/reviewModify" method="post">
					<input type="hidden" value="${prfCheck != null ? prfCheck.prfid : ''}" name="prfid">
				    <input type="hidden" name="reviewid" value="${vo.reviewid}">
				    <input type="hidden" name="rdate" value="${vo.rdate}">
				    <input type="hidden" name="rating" value="${vo.rating}">
				    <div class="edit_form" style="display: none;">
				        <textarea class="review_comment" name="content">${vo.content}</textarea>
				        <div class="comment_button">
				            <button onclick="submitEdit(this)">저장</button>
				            <button onclick="cancelEdit(this)">취소</button>
				        </div>
				    </div>
				</form>
				</div>
				</c:forEach>
        </div>
      </section>
      <script>
        function openTab(evt, tabId) {
            // 모든 탭과 컨텐츠 숨기기
            const tabs = document.querySelectorAll('.tab');
            const contents = document.querySelectorAll('.tab-content');
            tabs.forEach(tab => tab.classList.remove('active'));
            contents.forEach(content => content.classList.remove('active'));
    
            // 클릭된 탭과 해당 컨텐츠 보이기
            evt.currentTarget.classList.add('active');
            document.getElementById(tabId).classList.add('active');
        }
    </script>
    <script>
    function validateReviewForm(form) {
        const content = form.querySelector('textarea[name="content"]').value.trim();
        const rating = form.querySelector('input[name="rating"]').value;

        // 리뷰 내용이 비어 있는 경우
        if (content === "") {
            alert("리뷰 내용을 입력해 주세요.");
            return false;  // 폼 제출 중단
        }

        // 별점이 0인 경우
        if (rating == 0) {
            const confirmSubmit = confirm("별점을 등록하지 않으시겠습니까?");
            if (!confirmSubmit) {
                return false;  // 폼 제출 중단
            }
        }

        return true;  // 폼 제출 진행
    }
    
    document.addEventListener("DOMContentLoaded", function () {
        drawStarInit(); // 페이지 로드 시 별점 초기화
    });
 // JAVASCRIPT CODE
    const drawStar = (target) => {
        $(target).parent().find("span").css("width",`\${target.value * 20}%`);
    //document.querySelector(`.star span`).style.width = `${target.value * 20}%`;
    }

    function drawStarInit(){
        $(".reviewStar").each(function(){
            const value = $(this).val(); // 각 input의 value를 가져옴
            $(this).parent().find("span").css("width", `${value * 20}%`);
        });
    }
    function drawStarInit() {
        $(".reviewStar").each(function () {
            const value = $(this).val(); // 각 input의 value를 가져옴
            console.log(`Initializing star width: ${value * 20}%`); // 디버깅용
            $(this).parent().find("span").css("width", `${value * 20}%`);
        });
    }
        
    </script>
    <script>
        function declarationPopup(reviewid){
            const popupWidth = 1000;
            const popupHeight = 900;
            const popupX = (window.screen.width / 2) - (popupWidth / 2);
            const popupY = (window.screen.height / 2) - (popupHeight / 2);
            const delPopupwindow = open('${pageContext.request.contextPath}/declaration.do?reviewid=' + reviewid, 'declarationPopup', `width=${popupWidth}, height=${popupHeight}, top=${popupY}, left=${popupX}, resizable=no`);
            
            if (delPopupwindow) {
            	delPopupwindow.moveTo(popupX, popupY);
            	delPopupwindow.resizeTo(popupWidth, popupHeight); // 팝업 크기 강제 조정
            	delPopupwindow.focus();
            } else {
                alert("팝업 차단 설정을 확인해주세요.");
            }
        }
    </script>
    <script>
	    window.onload = function() {
	        var message = "${message}";
	        if(message) {
	            alert(message);
	        }
	    };
	</script>
	<script>
        function showEditForm(button) {
        // 부모 요소에서 `.edit_form` 찾기
        const reviewBox = button.closest('.review_box');
        const editForm = reviewBox.querySelector('.edit_form');
        const reviewContent = reviewBox.querySelector('.review_content');

        // 기존 리뷰 내용을 폼에 넣기
        const textarea = editForm.querySelector('.review_comment');
        textarea.value = reviewContent.textContent.trim();

        // 폼 보이기, 기존 내용 숨기기
        editForm.style.display = 'block';
        reviewContent.style.display = 'none';
    }

    function cancelEdit(button) {
        // 부모 요소에서 `.edit_form` 숨기기
        const editForm = button.closest('.edit_form');
        const reviewBox = editForm.closest('.review_box');
        const reviewContent = reviewBox.querySelector('.review_content');

        // 폼 숨기기, 기존 내용 보이기
        editForm.style.display = 'none';
        reviewContent.style.display = 'block';
    }

    function submitEdit(button) {
        // 부모 요소에서 수정된 내용을 저장
        const editForm = button.closest('.edit_form');
        const textarea = editForm.querySelector('.review_comment');
        const reviewBox = editForm.closest('.review_box');
        const reviewContent = reviewBox.querySelector('.review_content');

        // 수정된 내용을 기존 리뷰 영역에 반영
        reviewContent.textContent = textarea.value;

        // 폼 숨기기, 기존 내용 보이기
        editForm.style.display = 'none';
        reviewContent.style.display = 'block';
    }
    
    function confirmDelete(button) {
        if (confirm("정말로 삭제하시겠습니까?")) {
            // 버튼의 부모 폼을 찾아 제출
            button.closest('form').submit();
        }
    }
    </script>
</body>
</html>