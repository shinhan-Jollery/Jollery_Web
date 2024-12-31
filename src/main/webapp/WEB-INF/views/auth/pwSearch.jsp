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
	background-color: #white;
}

.verification-container {
	background-color: white;
	padding: 20px 40px;
	text-align: left;
	align-items: center;
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

input[type="text"] {
	margin-bottom: 10px; width : 300px;
	padding: 20px;
	margin-top: 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
	width: 300px;
}

button {
	display: block; /* 버튼을 블록 요소로 변경 */
	margin: 20px auto 0; /* 버튼을 중앙 정렬 (수평) */
	background-color: black;
	color: white;
	border: none;
	padding: 20px 20px;
	border-radius: 4px;
	cursor: pointer;
	width: 345px;
}

button:hover {
	background-color: #333;
}
</style>
</head>
<body>
	<div class="verification-container">
		<h2>비밀번호 찾기</h2>

		<div class="input-group">
			<label for="name">이름</label><br> <input type="text" id="name"
				placeholder="이름을 입력하세요">
		</div>

		<div class="input-group">
			<label for="userid">아이디</label><br> <input type="text" id="name"
				placeholder="아이디를 입력하세요">
		</div>

		<button type="button">확인</button>
	</div>

</body>
</html>