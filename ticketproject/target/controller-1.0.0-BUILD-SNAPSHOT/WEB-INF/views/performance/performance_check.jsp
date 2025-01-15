<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/include/header.jsp" %>
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
}
.review_comment{
    width: 1155px;
    height: 200px;
    margin-top: 15px;
    resize: none;
}
.comment_button{
    text-align: right;
}
.comment_button button{
    background-color: white;
    color: black;
    width: 50px;
    height: 30px;
    border-radius: 5px;
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
                <div>공연기간 : ${prfCheck.prfpdfrom } ~ ${prfCheck.prfpdto }</div>
                <div>공연시간 : ${prfCheck.prfruntime}</div>
                <div>가격 : ${prfCheck.pcseguidance }</div>
                <div>　</div>
            </div>
        </div>
        <button class="button"><a href="/">예매하기</a></button>
        <div class="view_comment">
            <div class="tab-container">
                <div class="tab active" onclick="openTab(event, 'info')">주요정보</div>
                <div class="tab" onclick="openTab(event, 'review')">리뷰</div>
            </div>
            <div id="info" class="tab-content active">
                <h2>주요정보</h2>
                <div class="view_Information">
                    <p>
                        지도자 생활 평균 승률 10% 미만! 파직, 파면, 파산, 퇴출, 이혼까지
                        인생에서도 ‘패배’ 그랜드슬램을 달성 중인 배구선수 출신 감독 ‘우진’은
                        해체 직전의 프로 여자배구단 ‘핑크스톰’의 감독을 맡아 달라는 제안을 받는다.

                        에이스 선수의 이적으로 이른바 ‘떨거지’ 선수들만 남은 팀 ‘핑크스톰’은
                        새로운 구단주 ‘정원’의 등장으로 간신히 살아나지만 실력도, 팀워크도 이미 해체 직전 상태.
                        그 와중에 막장, 신파는 옵션, 루저들의 성장 서사에 꽂힌 ‘정원’은
                        ‘핑크스톰’이 딱 한번이라도 1승을 하면 상금 20억을 풀겠다는 파격 공약을 내세운다.

                        모두가 주목하는 구단이 됐지만 압도적인 연패 행진을 이어가는 ‘핑크스톰’.
                        패배가 익숙했던 ‘우진’도 점점 울화통이 치밀고,
                        경험도 가능성도 없는 선수들과 함께 단 한번만이라도 이겨보고 싶은 마음이 생기는데…
                    </p>
                    <p>
                        지도자 생활 평균 승률 10% 미만! 파직, 파면, 파산, 퇴출, 이혼까지
                        인생에서도 ‘패배’ 그랜드슬램을 달성 중인 배구선수 출신 감독 ‘우진’은
                        해체 직전의 프로 여자배구단 ‘핑크스톰’의 감독을 맡아 달라는 제안을 받는다.

                        에이스 선수의 이적으로 이른바 ‘떨거지’ 선수들만 남은 팀 ‘핑크스톰’은
                        새로운 구단주 ‘정원’의 등장으로 간신히 살아나지만 실력도, 팀워크도 이미 해체 직전 상태.
                        그 와중에 막장, 신파는 옵션, 루저들의 성장 서사에 꽂힌 ‘정원’은
                        ‘핑크스톰’이 딱 한번이라도 1승을 하면 상금 20억을 풀겠다는 파격 공약을 내세운다.

                        모두가 주목하는 구단이 됐지만 압도적인 연패 행진을 이어가는 ‘핑크스톰’.
                        패배가 익숙했던 ‘우진’도 점점 울화통이 치밀고,
                        경험도 가능성도 없는 선수들과 함께 단 한번만이라도 이겨보고 싶은 마음이 생기는데…
                    </p>
                </div>
                <h2>출연진</h2>
                <div>감독 : 김동영</div>
                <div>
                    배우 : 123 123 123 123 123 123 123 123 123 123
                </div>
            </div>
            <div id="review" class="tab-content">
                <h2>리뷰</h2>
                <form>
                    <div class="comment_box">
                        <span class="star">
                          		  ★★★★★
                            <span>★★★★★</span>
                            <input type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="5">
                        </span>
                        <div>
                            <textarea class="review_comment" placeholder="리뷰를 입력해주세요" name="review_content"></textarea>
                        </div>
                        <div class="comment_button">
                            <button>등록</button>
                        </div>
                    </div>
                </form>
                <div class="review_box">
                    <div>
                        <div class="review_idBox">
                            <div class="review_id">qortmddn***</div>
                            <div style="color: gray;">|</div>
                            <div class="review_rdate">2024-12-02</div>
                        </div>
                        <div>
                            <span class="star">
                              		  ★★★★★
                                <span>★★★★★</span>
                                <input type="range" class="reviewStar" value="3" step="1" min="0" max="5">
                            </span>
                        </div>
                        <div class="review_content">리뷰 내용입니다.</div>
                    </div>
                </div>
                <div class="review_button">
                    <button class="button_modify">수정</button>
                    <button class="button_delete">삭제</button>
                    <button class="button_declaration" onclick="declarationPopup()">신고</button>
                </div>
            </div>
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
        function openLoginPopup() {
            const popupWidth = 400;
            const popupHeight = 500;
            const popupX = (window.screen.width / 2) - (popupWidth / 2);
            const popupY = (window.screen.height / 2) - (popupHeight / 2);
            window.open('login.html', 'loginPopup', `width=\${popupWidth}, height=\${popupHeight}, top=\${popupY}, left=\${popupX}, resizable=no`);
        }
    </script>
    <script>
        // JAVASCRIPT CODE
        const drawStar = (target) => {
            $(target).parent().find("span").css("width",`\${target.value * 20}%`);
        //document.querySelector(`.star span`).style.width = `${target.value * 20}%`;
        }

        function drawStarInit(){
            $(".reviewStar").each(function(){
                $(this).parent().find("span").css("width",`\${value * 20}%`);
            })
        }
        drawStarInit();
    </script>
    <script>
        function declarationPopup(){
            const popupWidth = 400;
            const popupHeight = 500;
            const popupX = (window.screen.width / 2) - (popupWidth / 2);
            const popupY = (window.screen.height / 2) - (popupHeight / 2);
            window.open('declaration.html', 'declarationPopup', `width=$\{popupWidth}, height=$\{popupHeight}, top=$\{popupY}, left=$\{popupX}, resizable=no`); 
        }
    </script>
</body>
</html>