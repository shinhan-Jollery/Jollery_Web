<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="<c:url value='/resources/assets/css/vendor.css' />" />
<link rel="stylesheet"
	href="<c:url value='/resources/assets/css/style.css' />" />
<style>
#email-otp-code {
	width: 200px;
}
/* Reset */
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f9f9f9;
}

/* Main layout */
main {
	flex: 1;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 150px 0 50px; /* 헤더 높이와 하단 여백 */
}

.header {
	background-color: #000000;
}

.container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 20px;
}

.container-signup {
	max-width: 800px;
	width: 50%;
	padding: 50px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
}

h2 {
	margin-bottom: 20px;
}

/* Buttons */
.btn-submit {
	display: block;
	width: calc(100% - 10px);
	padding: 10px;
	background-color: #000;
	color: #fff;
	text-align: center;
	border-radius: 3px;
	text-decoration: none;
}

button:hover {
	background-color: #f0f0f0;
}

/* Form Elements */
.form-group {
	margin-bottom: 30px; /* 입력 섹션 간의 간격 */
}

.form-group input, .form-group select, .form-group textarea {
	width: calc(100% - 10px);
	padding: 10px;
	font-size: 14px;
	border: 1px solid #ddd;
	border-radius: 3px;
	margin-bottom: 5px;
}

.form-group textarea {
	resize: none;
}

input[type="text"]:focus {
	border-color: #007bff;
}

label {
	display: block;
	font-size: 14px;
	margin-bottom: 5px;
}

/* Phone Row */
.phone-row {
	margin-right: 150px;
	display: flex;
	gap: 10px; /* 각 요소 간격 */
	align-items: center; /* 수직 가운데 정렬 */
}

.id-row {
	margin-right: 150px;
	display: flex;
	gap: 10px; /* 각 요소 간격 */
	align-items: center; /* 수직 가운데 정렬 */
}

.phone-row select {
	width: 80px;
	height: 38px;
	padding: 5px;
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.id-row button {
	margin-left: 15px;
	padding: 8px 12px;
	font-size: 14px;
	border: 1px solid #ccc;
	background-color: #fff;
	cursor: pointer;
	height: 53px;
	width: 110px;
	margin-bottom: 5px;
}

.phone-row input {
	width: 120px;
	height: 38px;
	padding: 5px;
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.phone-row button {
	margin-left: 15px;
	padding: 8px 12px;
	font-size: 14px;
	border: 1px solid #ccc;
	background-color: #fff;
	cursor: pointer;
	height: 38px;
	margin-bottom: 5px;
}

.email-row {
	margin-right: 150px;
	display: flex;
	gap: 10px; /* 각 요소 간격 */
	align-items: center; /* 수직 가운데 정렬 */
}

.email-row select {
	width: 80px;
	height: 38px;
	padding: 5px;
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.email-row input {
	width: 120px;
	height: 38px;
	padding: 5px;
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.email-row button {
	margin-left: 15px;
	padding: 8px 12px;
	font-size: 14px;
	border: 1px solid #ccc;
	background-color: #fff;
	cursor: pointer;
	height: 38px;
	margin-bottom: 5px;
}

/* OTP Row */
.otp-row {
	display: flex;
	margin-top: 10px;
	gap: 10px;
}
/* OTP Row */
.emailotp-row {
	display: flex;
	margin-top: 10px;
	gap: 10px;
}

.otp-row input {
	height: 38px;
	font-size: 14px;
	width: 200px;
	padding: 5px;
}

.otp-row button {
	height: 38px;
	font-size: 14px;
	padding: 5px 10px;
}

/* Address Row */
.address-row {
	display: flex;
	align-items: center;
	gap: 10px;
}

.address-row input[type="text"] {
	flex: 1;
	padding: 8px;
	font-size: 14px;
	margin-bottom: 10px;
}

.address-row button {
	margin-left: 10px;
	padding: 8px 12px;
	font-size: 14px;
	border: 1px solid #ccc;
	background-color: #fff;
	cursor: pointer;
	margin-bottom: 10px;
}

/* Checkbox and Radio Buttons */
.checkbox-group, .radio-group {
	display: flex;
	gap: 20px;
	align-items: center;
}

.checkbox-group label, .radio-group label {
	font-size: 14px;
	white-space: nowrap;
}

.checkbox-group input[type="checkbox"], .radio-group input[type="radio"]
	{
	margin-left: 10px;
}
</style>
</head>
<body>
	<c:choose>
		<c:when test="${not empty userId}">
			<%@ include file="/WEB-INF/views/common/userheader.jsp"%>
		</c:when>
		<c:otherwise>
			<%@ include file="/WEB-INF/views/common/guestheader.jsp"%>
		</c:otherwise>
	</c:choose>
	<main>
		<!-- 회원가입 폼 -->
		<div class="container-signup">
			<form id="signup-form">
				<!-- 아이디 -->
				<div class="form-group">
					<label for="username">아이디*</label>
					<div class="id-row">
						<input type="text" id="username" name="username"
							class="form-control" placeholder="영문소문자/숫자, 4~16자" required>
						<button type="button" id="auth-button"
							onclick="duplicateChecker()">중복 체크</button>
					</div>
				</div>
				<script>
    // 아이디 중복 체크 함수
    async function duplicateChecker() {
        const userId = document.getElementById("username").value;
		console.log(JSON.stringify({ userId }));
        try {
            const response = await fetch('/jollery/auth/idchecker', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ userId }),
            });
			console.log(response);
            // 응답 처리
            const result = await response.json(); // JSON 파싱

            if (response.status === "success") {
                alert(result.message); 
            } else {
                alert(result.message); 
            }
        } catch (error) {
            console.error('중복 체크 요청 중 오류 발생:', error);
            alert('서버와 통신 중 문제가 발생했습니다. 나중에 다시 시도해주세요.');
        }
    }
</script>

				<!-- 비밀번호 -->
				<div class="form-group">
					<label for="password">비밀번호*</label> <input type="password"
						id="password" name="password" class="form-control"
						placeholder="영문 대소문자/숫자/특수문자 중 조합, 8~16자" required>
				</div>

				<!-- 비밀번호 확인 -->
				<div class="form-group">
					<label for="confirm-password">비밀번호 확인*</label> <input
						type="password" id="confirm-password" name="confirm-password"
						class="form-control" placeholder="비밀번호를 다시 입력하세요" required>
				</div>

				<!-- 이름 -->
				<div class="form-group">
					<label for="name">이름*</label> <input type="text" id="name"
						name="name" class="form-control" placeholder="이름을 입력하세요" required>
				</div>

				<!-- 주소 -->
				<div class="form-group">
					<label for="address-line1">주소 *</label>
					<div class="address-row">
						<input type="text" id="address-line1" name="address-line1"
							placeholder="도로명 주소를 입력하세요">
						<button type="button" onclick="execDaumPostcode()">우편번호
							검색</button>
					</div>
					<input type="text" id="address-line2" name="address-line2"
						placeholder="상세 주소를 입력하세요">
				</div>

				<!-- 연락처 -->
				<div class="form-group">
					<label for="phone">휴대폰 번호 *</label>
					<div class="phone-row">
						<select id="phone-part1" name="phone-part1">
							<option value="010" selected>010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="019">019</option>
						</select>
						<!-- 중간 번호 -->
						<input type="text" id="phone-part2" name="phone-part2"
							placeholder="" maxlength="4" oninput="validatePhonePart2(this)">
						<!-- 마지막 번호 -->
						<input type="text" id="phone-part3" name="phone-part3"
							placeholder="" maxlength="4" oninput="validatePhonePart3(this)">
						<button type="button" id="auth-button" onclick="smsPostcode()">휴대폰}
							인증</button>
					</div>
					<div class="phone-row2">
						<!-- 인증번호 입력 영역 -->
						<div class="otp-row" style="display: none; margin-top: 20px;">
							<input type="text" id="otp-code" placeholder="인증번호 입력 (6자리)"
								maxlength="6">
							<button type="button" id="otp-submit-button"
								onclick="submitOTP()">제출</button>
						</div>
					</div>
				</div>

				<!-- 이메일 입력 -->
				<div class="form-group">
					<label for="customer-email">이메일</label>
					<div class="email-row">
						<!-- 이메일 앞부분 -->
						<input type="text" id="email-prefix" name="email-prefix"
							placeholder="Email" style="flex-grow: 1; height: 40px;">
						<span style="line-height: 1;">@</span>
						<!-- 이메일 도메인 선택 -->
						<select id="email-domain" name="email-domain"
							style="flex-grow: 1; height: 40px;">
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="daum.net">daum.net</option>
							<option value="custom">직접 입력</option>
						</select>
						<!-- 인증 버튼 -->
						<button type="button" id="email-auth-button" onclick="sendEmail()">이메일
							인증</button>
					</div>
					<div class="email-row">
						<!-- 사용자 입력 -->
						<input type="text" id="custom-email-domain"
							name="custom-email-domain" placeholder="직접 입력"
							style="margin-top: 10px; display: none;">
						<script>
        document.getElementById("email-domain").addEventListener("change", function() {
            const customField = document.getElementById("custom-email-domain");
            if (this.value === "custom") {
                customField.style.display = "block";
            } else {
                customField.style.display = "none";
            }
        });
    </script>



						<!-- 인증번호 입력 영역 -->
						<div class="emailotp-row" style="display: none; margin-top: 20px;">
							<input type="text" id="email-otp-code"
								placeholder="인증번호 입력 (6자리)" maxlength="6">
							<button type="button" id="email-otp-submit-button"
								onclick="submitEmailOTP()">제출</button>
						</div>
					</div>
				</div>
				<!-- 약관 동의 -->
				<div class="form-group">
					<label>이용약관 및 개인정보 수집에 동의.*</label>
					<div class="checkbox-group">
						<label for="terms-agree">[필수] 이용약관 동의</label> <input
							type="checkbox" id="terms-agree" name="terms-agree" required>
					</div>
					<div class="checkbox-group">
						<label for="privacy-agree">[필수] 개인정보 수집 및 이용 동의</label> <input
							type="checkbox" id="privacy-agree" name="privacy-agree" required>
					</div>
					<div class="checkbox-group">
						<label for="marketing-agree">[선택] 쇼핑정보 수신 동의</label> <input
							type="checkbox" id="marketing-agree" name="marketing-agree">
					</div>
				</div>



				<!-- 제출 버튼 -->
				<button type="submit" class="btn-submit">회원가입</button>
			</form>
		</div>
	</main>
	<script>
document.getElementById("signup-form").addEventListener("submit", function(event) {
    event.preventDefault();

    // 폼 데이터
    const formData = new FormData(this);

    // 전화번호
    const phonePart1 = formData.get("phone-part1");
    const phonePart2 = formData.get("phone-part2");
    const phonePart3 = formData.get("phone-part3");
    const phone = `\${phonePart1}-\${phonePart2}-\${phonePart3}`;

    // 이메일 
    const emailPrefix = formData.get("email-prefix");
    let emailDomain = formData.get("email-domain");
    if (emailDomain === "custom") {
        emailDomain = formData.get("custom-email-domain");
    }

    const jsonData = {
        username: formData.get("username"),
        password: formData.get("password"),
        confirmPassword: formData.get("confirm-password"),
        name: formData.get("name"),
        address: `\${formData.get("address-line1")} \${formData.get("address-line2")}`,
        phone: phone,
        emailPrefix: emailPrefix,
        emailDomain: emailDomain,
        termsAgree: formData.get("termsAgree") === "on",
        privacyAgree: formData.get("privacyAgree") === "on",
        marketingAgree: formData.get("marketingAgree") === "on"
    };

    console.log(jsonData);


    fetch("/jollery/auth/register", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(jsonData)
    })
    .then(response => response.json())
    .then(data => {
        console.log(data);
        alert(data.status === "success" ? "회원가입 성공!" : "회원가입 실패!");
    })
    .catch(error => {
        console.error(error);
        alert("오류가 발생했습니다.");
    });
});
</script>

	<!-- footer -->
	<footer class="bg-dark text-white py-0">
		<div class="container">
			<div class="row separated">
				<div class="col-lg-6 py-10">
					<div class="row">
						<div class="col-md-8">
							<p>
								졸업작품의 새로운 가치를 발견하다 !<br>JOLLERY는 졸업작품과 갤러리의 의미를 담아, 대학생들의
								졸업 작품이 단순한 전시로 끝나지 않고 지속적인 예술적 가치를 인정받을 수 있도록 돕는 플랫폼입니다. 버려지거나
								방치되는 졸업작품에 새 생명을 불어넣고, 자원 순환과 창작의 가치를 함께 만들어갑니다. 지금 바로 JOLLERY와
								함께하세요!
							</p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-9">
							<ul class="list-group list-group-columns">
								<li class="list-group-item"><a href="about.html">더 알아보기</a></li>
								<li class="list-group-item"><a href="contact.html">고객센터</a></li>
								<li class="list-group-item"><a href="faq.html">FAQ</a></li>
								<li class="list-group-item"><a href="blog.html">블로그</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-6 py-10">
					<div class="row justify-content-end">
						<div class="col-lg-10">
							<h4 class="eyebrow mb-2">구독하기</h4>
							<div class="input-group">
								<input type="text" class="form-control form-control-lg"
									placeholder="Email" aria-label="Subscribe"
									aria-describedby="button-addon2">
								<div class="input-group-append">
									<button class="btn btn-white" type="button" id="button-addon2">구독</button>
								</div>
							</div>
						</div>
					</div>
					<div class="row justify-content-end">
						<div class="col-lg-10">
							<h4 class="eyebrow mb-2">팔로우</h4>
							<nav class="nav nav-icons">
								<a class="nav-link" href="#!"><i class="icon-facebook-o"></i></a>
								<a class="nav-link" href="#!"><i class="icon-twitter-o"></i></a>
								<a class="nav-link" href="#!"><i class="icon-youtube-o"></i></a>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<script src="<c:url value='/resources/assets/js/vendor.min.js' />"></script>
	<script src="<c:url value='/resources/assets/js/app.js' />"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
    function execDaumPostcode() {
        var width = 500; // 팝업의 너비
        var height = 600; // 팝업의 높이

        new daum.Postcode({
            oncomplete: function(data) {
                // 도로명 주소 or 지번 주소 
                const roadAddr = data.roadAddress; // 도로명
                const jibunAddr = data.jibunAddress; // 지번
                document.getElementById('address-line1').value = roadAddr || jibunAddr;

                // 상세 주소 입력으로 focus
                document.getElementById('address-line2').focus();
            }
        }).open({
            left: (window.screen.width / 2) - (width / 2),
            top: (window.screen.height / 2) - (height / 2)
        });
    }
    
</script>
	<script>
    // 이메일 인증 요청
    async function sendEmail() {
        // 이메일 조합
        const emailPrefix = document.getElementById("email-prefix").value;
        const emailDomain = document.getElementById("email-domain").value;
        const customDomain = document.getElementById("custom-email-domain").value;

        const email = `\${emailPrefix}@\${customDomain}\${emailDomain}`;

        if (!emailPrefix || !email) {
            alert("올바른 이메일 주소를 입력해주세요.");
            return;
        }

        const response = await fetch('/jollery/auth/sendEmail', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ email }),
        });

        const result = await response.json();
        alert(result.message);
        

        if (result.status === "success") {
            // 인증번호 입력 필드 보이기
        	document.querySelector('.emailotp-row').style.display = 'flex';
        }
    }

    // 인증 코드 제출
    async function submitEmailOTP() {
        const emailPrefix = document.getElementById("email-prefix").value;
        const emailDomain = document.getElementById("email-domain").value;
        const customDomain = document.getElementById("custom-email-domain").value;

        const email = `\${emailPrefix}@\${customDomain}\${emailDomain}`;
        const code = document.getElementById("email-otp-code").value;

        if (!email || !code) {
            alert("이메일과 인증 코드를 모두 입력해주세요.");
            return;
        }

        const response = await fetch('/jollery/auth/verifyCode', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ email, code }),
        });

        const result = await response.json();
        
        if (result.status === "success") {
            // 인증번호 입력 필드 보이기
            
        	document.querySelector('.emailotp-row').style.display = 'none';
        	document.getElementById('email-auth-button').style.display = 'none';
            document.getElementById('email-prefix').disabled = true;
            document.getElementById('email-domain').disabled = true;
        }
        alert(result.message);
    }
</script>
	<script>
    function smsPostcode() {
        // 전화번호 합치기
        const phonePart1 = document.getElementById('phone-part1').value; // 앞자리
        const phonePart2 = document.getElementById('phone-part2').value; // 중간 번호
        const phonePart3 = document.getElementById('phone-part3').value; // 끝 번호
        const fullPhoneNumber = `\${phonePart1}-\${phonePart2}-\${phonePart3}`;
        
        const isConfirmed = confirm(`입력한 전화번호가 ${fullPhoneNumber}이 맞습니까?`);
        if (!isConfirmed) {
            alert('전화번호 인증이 취소되었습니다.');
            return;
        }

        // 인증 버튼 비활성화
        const authButton = document.getElementById('auth-button');
        authButton.disabled = true;
        authButton.textContent = '인증 요청 중'; // 버튼 텍스트 변경

        // 서버로 전화번호 전송
        fetch('/jollery/auth/sms', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                phoneNumber: fullPhoneNumber,
            }),
        })
            .then((response) => {
                if (!response.ok) {
                    throw new Error('서버 응답 실패');
                }
                return response.json();
            })
            .then((data) => {
                if (data.success) {
                    alert('인증 코드가 전송되었습니다.');
                    // 인증번호 입력 칸과 제출 버튼 표시
                    document.querySelector('.otp-row').style.display = 'flex';
                } else {
                    alert('인증 코드 전송에 실패했습니다.');
                    authButton.disabled = false;
                    authButton.textContent = '휴대폰 인증';
                }
            })
            .catch((error) => {
                console.error('에러 발생:', error);
                alert('문제가 발생했습니다. 다시 시도해주세요.');
                authButton.disabled = false;
                authButton.textContent = '휴대폰 인증';
            });
    }

    function submitOTP() {
        const otpCode = document.getElementById('otp-code').value; // 사용자가 입력한 OTP 코드
        const phonePart1 = document.getElementById('phone-part1').value; // 앞자리
        const phonePart2 = document.getElementById('phone-part2').value; // 중간 번호
        const phonePart3 = document.getElementById('phone-part3').value; // 끝 번호
        const fullPhoneNumber = `\${phonePart1}\${phonePart2}\${phonePart3}`;

        if (otpCode.length !== 6 || isNaN(otpCode)) {
            alert('6자리 숫자 인증번호를 정확히 입력해주세요.');
            return;
        }

        // 서버로 OTP 검증 요청
        fetch('/jollery/auth/otp', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                phoneNumber: fullPhoneNumber,
                code: otpCode,
            }),
        })
            .then((response) => response.json()) // 상태 코드와 상관없이 JSON 파싱
            .then((data) => {
                console.log('서버 응답 데이터:', data);

                if (data.status === 'success') {
                    alert('인증이 완료되었습니다.');
                    // UI 업데이트 로직

                    // 전화번호 입력 칸 비활성화
                    document.getElementById('phone-part1').disabled = true;
                    document.getElementById('phone-part2').disabled = true;
                    document.getElementById('phone-part3').disabled = true;

                    // 인증번호 입력 칸과 제출 버튼 숨기기
                    document.querySelector('.otp-row').style.display = 'none';

                    // 휴대폰 인증 버튼도 숨기기
                    
                    document.getElementById('auth-button').style.display = 'none';
                } else {
                    alert('인증에 실패했습니다. 다시 시도해주세요.');
                }
            })
            .catch((error) => {
                console.error('에러 발생:', error);
                alert('문제가 발생했습니다. 다시 시도해주세요.');
            });
    }

    // 유효성 검사 함수 (중간 번호)
    function validatePhonePart2(input) {
        input.value = input.value.replace(/[^0-9]/g, '').slice(0, 4); // 숫자만 허용, 최대 4자리
    }

    // 유효성 검사 함수
    function validatePhonePart3(input) {
        input.value = input.value.replace(/[^0-9]/g, '').slice(0, 4); // 숫자만 허용, 최대 4자리
    }
</script>
</body>
</html>
