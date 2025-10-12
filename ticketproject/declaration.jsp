<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>신고 창</title>
    <script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.1.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fdf5e6;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .report-container {
            background-color: #fff1f3;
            border: 1px solid #ffc0cb;
            border-radius: 10px;
            width: 300px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .report-header {
            text-align: center;
            background-color: #ffc0cb;
            color: black;
            font-size: 14px;
            padding: 8px;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .report-item {
            display: flex;
            margin-bottom: 10px;
            font-size: 14px;
        }

        .reason-selection {
            margin: 20px 0;
        }

        .reason-selection label {
            display: block;
            font-size: 14px;
            margin: 5px 0;
        }

        .reason-selection input[type="radio"] {
            margin-right: 10px;
        }

        textarea {
            width: 100%;
            height: 60px;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 5px;
            font-size: 14px;
            resize: none;
            margin-top: 10px;
        }

        .submit-button {
            display: block;
            width: 100%;
            background-color: #00bfff;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            padding: 10px;
            cursor: pointer;
            margin-top: 15px;
        }

        .submit-button:hover {
            background-color: #009acd;
        }
        
        .report{
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <form class="report-container" id="reportForm">
    	<input type="hidden" id = "reviewid" name="reviewid" value="${vo.reviewid}">
        <!-- 신고 제목 -->
        <div class="report-header">
            신고 사유를 선택해주세요
        </div>
        <!-- 작성자와 내용 -->
        <div class="report-item">
            <span>작성자</span>
            <span class="report_name report" id="userid" name="userid">${vo.userid}</span>
        </div>
        <div class="report-item">
            <span>내용</span>
            <span class="report_content report" id="content" name="content">${vo.content}</span>
        </div>
        <!-- 신고 사유 선택 -->
        <div class="reason-selection">
            <label>
                <input type="radio" id="reporttype" name="reporttype" value="spam" required> 스팸/광고
            </label>
            <label>
                <input type="radio" id="reporttype" name="reporttype" value="abuse"> 욕설 또는 비속어
            </label>
            <label>
                <input type="radio" id="reporttype" name="reporttype" value="false"> 허위 리뷰 도배
            </label>
            <label>
                <input type="radio" id="reporttype" name="reporttype" value="other"> 기타
            </label>
            <textarea name="content" id="content2" placeholder="추가 내용을 입력하세요..."></textarea>
        </div>
        <!-- 제출 버튼 -->
        <button type="submit" class="submit-button" >신고하기</button>
    </form>
	<script>
		$(document).ready(function() {
		    $("#reportForm").submit(function(e) {
		        e.preventDefault(); // 폼의 기본 제출 막기
		
		        let reviewid = $("#reviewid").val();
		        let userid = $(".report_name").text();
		        let content = $("#content2").val();
		        let reporttype = $("input[name='reporttype']:checked").val();
		
		        $.ajax({
		            url: "/controller/reportInsert",
		            type: "POST",
		            data: {
		                reviewid: reviewid,
		                userid: userid,
		                content: content,
		                reporttype: reporttype
		            },
		            success: function(data) {
		                if(window.name == 'declarationPopup') {
		                    window.opener.location.reload();
		                    window.close(); 
		                    alert("신고가 정상적으로 접수되었습니다");
		                } else {
		                    window.location.href = '/controller/';
		                    
		                }
		            },
		            error: function(xhr) {
		                console.log(xhr);
		                alert("신고 접수 중 오류가 발생했습니다.");
		            }
		        });
		    });
		});
	</script>
</body>
</html>
