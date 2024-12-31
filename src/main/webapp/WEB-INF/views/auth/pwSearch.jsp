<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>본인확인 인증</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      background-color: #f9f9f9;
    }

    .verification-container {
      background-color: white;
      padding: 20px 40px;
      border-radius: 8px;
      box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
      text-align: center;
    }

    .verification-container h2 {
      margin-bottom: 20px;
    }

    .radio-group {
      margin-bottom: 20px;
    }

    .radio-group label {
      margin-right: 10px;
    }

    .input-group {
      margin-bottom: 15px;
    }

    input[type="text"], input[type="password"] {
      width: calc(100% - 20px);
      padding: 10px;
      margin-top: 5px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    button {
      background-color: black;
      color: white;
      border: none;
      padding: 10px 20px;
      border-radius: 4px;
      cursor: pointer;
    }

    button:hover {
      background-color: #333;
    }
  </style>
</head>
<body>
  <div class="verification-container">
    <h2>본인확인 인증</h2>
    
    <div class="radio-group">
      <label><input type="radio" name="verification" value="email" checked> 이메일</label>
      <label><input type="radio" name="verification" value="phone"> 휴대폰번호</label>
    </div>

    <div class="input-group">
      <label for="name">이름</label><br>
      <input type="text" id="name" placeholder="이름을 입력하세요">
    </div>

    <div class="input-group">
      <label for="password">비밀번호 찾기</label><br>
      <input type="password" id="password" placeholder="비밀번호를 입력하세요">
    </div>

    <button type="button">확인</button>
  </div>

</body>
</html>