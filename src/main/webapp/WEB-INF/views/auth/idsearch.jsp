<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<meta charset="UTF-8">
<title>ID 찾기</title>
<style>
/* 전체 페이지 스타일 */
.header {
	font-size: 24px;
	background-color: black !important; /* 우선순위 강제 적용 */
}

body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #black;
}

main {
    display: flex; /* Flexbox 활성화 */
    justify-content: center; /* 가로 중앙 정렬 */
    align-items: center; /* 세로 중앙 정렬 */
    min-height: 100vh; /* 화면 전체 높이 */
    background-color: #f7f7f7; /* 배경색 */
    padding: 150px 0 50px; /* 헤더 높이와 하단 여백 */
}
/* 인증 컨테이너 스타일 */
.verification-container {

	max-width: 550px;
	background-color: #ffffff; /* 흰색 배경 */
	padding: 50px;
	border-radius: 10px; /* 둥근 모서리 */
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
	text-align: center; /* 중앙 정렬 */
	display: flex;
	flex-direction: column; /* 세로 방향 배치 */
	align-items: center; /* 가로 중앙 정렬 */
	margin: 20px auto; /* 추가 중앙 정렬 */
	
}

.verification-container h2 {
	font-size: 24px; /* 제목 크기 */
	margin-bottom: 20px; /* 아래 여백 */
}




.input-group label {
    font-size: 14px; /* 글자 크기 */
    margin-bottom: 5px; /* 아래 여백 */
    text-align: left; /* 라벨 텍스트 왼쪽 정렬 */
    font-weight: bold; /* 강조된 스타일 */
    line-height: 1.2; /* 텍스트 간격 조정 */
}
.input-group2{
    font-size: 14px; /* 글자 크기 */
    margin-bottom: 5px; /* 아래 여백 */
    text-align: center; /* 라벨 텍스트 왼쪽 정렬 */
    font-weight: bold; /* 강조된 스타일 */
    line-height: 1.2; /* 텍스트 간격 조정 */
}
/* Form Elements */
.input-group {
    margin-bottom: 20px; /* 그룹 간격 */
    display: flex; /* Flexbox 활성화 */
    flex-direction: column; /* 세로 방향 배치 */
    align-items: flex-start; /* 왼쪽 정렬 */
    width: 100%; /* 부모 요소의 너비를 확장 */
}
.input-group input, .form-group select, .form-group textarea {
	padding: 10px;
	font-size: 14px;
	border: 1px solid #ddd;
	border-radius: 3px;
	margin-bottom: 5px;
}

.input-group textarea {
	resize: none;
}

input[type="text"] {
    width: 300px; /* 입력 필드 너비 */
    padding: 8px; /* 내부 여백 */
    font-size: 14px; /* 글자 크기 */
    border: 1px solid #ccc; /* 테두리 색상 */
    border-radius: 5px; /* 둥근 모서리 */
    margin: 0; /* 추가 여백 제거 */
    box-sizing: border-box; /* 전체 박스 모델 적용 */
}

button {
 
	display: block; /* 블록 요소로 변환 */
	width: 100px;
	padding: 10px; /* 내부 여백 */
	font-size: 16px; /* 글자 크기 */
	background-color: white;
	border: 1px solid #ddd;
	color: black; /* 버튼 글자색 (흰색) */
	border-radius: 5px; /* 둥근 모서리 */
	cursor: pointer; /* 클릭 커서 표시 */
}

button:hover {
	background-color: #f0f0f0; /* 호버 시 버튼 색상 변경 */
}

.phone-row2 {

	display: flex;
	justify-content: space-between;
	align-items: center;
	gap: 10px; /* 입력 필드와 버튼 간격 */
}

.phone-row2 input[type="text"] {
	flex-grow: 1; /* 입력 필드가 남은 공간을 채움 */
}

.phone-row2 button {
	margin-top: 4px;
	margin-left: 15px;
	padding: 8px 12px;
	font-size: 14px;
	border: 1px solid #ccc;
	background-color: #fff;
	cursor: pointer;
	height: 40px;
	margin-bottom: 5px;
	flex-shrink: 0; /* 버튼 크기 고정 */
}
.verification-button {
  display: block; /* 블록 요소로 변환 */
  margin-left: 100px;	`--
  width: 100px;
  padding: 10px;
  font-size: 16px;
  background-color: white;
  border: 1px solid #ddd;
  color: black;
  border-radius: 5px;
  cursor: pointer;
}
</style>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="<c:url value='/resources/assets/css/vendor.css' />" />
<link rel="stylesheet"
	href="<c:url value='/resources/assets/css/style.css' />" />
</head>
<body>
	<%@ include file="/WEB-INF/views/common/guestheader.jsp"%>



	<main>
		<div class="verification-container">
			<h2>내 아이디 찾기</h2>
			<form id="signup-form" style="margin-left: 80px;">
			<!-- 이름 입력 -->
			<div class="input-group" >
				<label for="membername">이름</label> <input type="text"
					id="membername" placeholder="이름을 입력하세요">
			</div>

			<!-- 아이디 입력 -->
			<div class="input-group">
				<label for="memberid">아이디</label> <input type="text" id="memberid"
					placeholder="이메일을 입력하세요">
			</div>

			<!-- 이메일 인증 버튼 -->

			<button class="verification-button" style="width: 150px;" type="button" id="auth-button"
				onclick="sendMemberEmail()">
				이메일 인증</button>

			<!-- 인증번호 입력 -->
			<div class="phone-row2" style="margin-top: 20px;">
				<input type="text" id="memberemail-otp-code"
					placeholder="인증번호 입력 (6자리)" maxlength="6">
				<button type="button" id="member-otp-submit-button"
					onclick="submitMemberEmailOTP()">제출</button>
			</div>
			</form>
		</div>
	
	</main>
</body>
<script>
    // 이메일 인증 요청
    async function sendMemberEmail() {
    	const membername = document.getElementById("membername").value.trim();
        const memberid = document.getElementById("memberid").value.trim();

        // JSON 변환
        const bodydata = {
        		membername,
        		memberid
        };
        const response = await fetch('/jollery/auth/sendMemberEmail', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(bodydata),
        });

        const result = await response.json();
        alert(result.message);
        

        if (result.status === "success") {
            // 인증번호 입력 필드 보이기
        	document.querySelector('.emailotp-row').style.display = 'flex';
        }
    }

    // 인증 코드 제출
    async function submitMemberEmailOTP() {
    	const membername = document.getElementById("membername").value.trim();
        const memberid = document.getElementById("memberid").value.trim();
        const code = document.getElementById("memberemail-otp-code").value;
        // JSON 변환
        const bodydata = {
        		membername,
        		memberid,
        		code
        };
        

        const response = await fetch('/jollery/auth/MemberverifyCode', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify( bodydata ),
        });
	
        const result = await response.json();
        alert(result.message);
        if (result.status === "success") {
            // 인증번호 입력 필드 보이기

        }
    }
</script>
</html>