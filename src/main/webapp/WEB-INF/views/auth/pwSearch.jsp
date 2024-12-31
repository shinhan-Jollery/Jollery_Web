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
	margin-bottom: 10px;
	width: 300px;
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
		<h2>이메일로 비밀번호 찾기</h2>

		<div class="input-group">
			<label for="name">이름</label><br> <input type="text"
				id="membername" placeholder="이름을 입력하세요">
		</div>

		<div class="input-group">
			<label for="userid">아이디</label><br> <input type="text"
				id="memberid" placeholder="아이디를 입력하세요">
		</div>

		<button type="button" id="auth-button" onclick="sendMemberEmail()">이메일
			인증</button>
	</div>
	<!-- 인증번호 입력 영역 -->
	<div class="input-group" style="display: none; margin-top: 20px;">
		<input type="text" id="memberemail-otp-code" placeholder="인증번호 입력 (6자리)"
			maxlength="6">
		<button type="button" id="member-otp-submit-button"
			onclick="submitMemberEmailOTP()">제출</button>
	</div>
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
            body: JSON.stringify({ bodydata }),
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
        

        if (!email || !code) {
            alert("이메일과 인증 코드를 모두 입력해주세요.");
            return;
        }

        const response = await fetch('/jollery/auth/verifyCode', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ bodydata }),
        });

        const result = await response.json();
        
        if (result.status === "success") {
            // 인증번호 입력 필드 보이기
            //임시 번호 발송?
            

        }
        alert(result.message);
    }
</script>
</body>
</html>