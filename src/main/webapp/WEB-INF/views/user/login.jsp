<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <style>
body {
    font-family: Arial, sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    background-color: #f4f4f4;
}

.login-container {
    background-color: #fff;
    padding: 20px 30px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    text-align: center;
    width: 300px;
}

h2 {
    margin-bottom: 20px;
}

label {
    display: block;
    margin-top: 10px;
    margin-bottom: 5px;
}

input[type="text"], input[type="password"] {
    width: 100%;
    padding: 8px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.join{
    top: 10px;
}

button {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

button:hover {
    background-color: #0056b3;
}

button:last-child {
    margin-top: 10px;
    background-color: #f44336;
}

button:last-child:hover {
    background-color: #d32f2f;
}

    </style>
</head>
<body>
    <div class="login-container">
        <h2>로그인</h2>
        <form action="loginOk.do" method="POST">
            <label for="username">아이디</label>
            <input type="text" id="userId" name="userId" placeholder="아이디를 입력하세요" required>
            <div></div>

            <label for="password">비밀번호</label>
            <input type="password" id="upassword" name="upassword" placeholder="비밀번호를 입력하세요" required>
            <div></div>
            <button type="submit">로그인</button>
        </form>
        <button onclick="window.close()">닫기</button>
        <a href="#" class="join">회원가입</a>
    </div>
</body>
</html>

