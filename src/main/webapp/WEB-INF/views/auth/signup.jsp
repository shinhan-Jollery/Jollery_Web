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
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f9f9f9;
}

main {
	flex: 1; /* 메인 컨텐츠가 남은 공간을 차지 */
	display: flex; /* Flexbox 활성화 */
	justify-content: center; /* 가로 중앙 정렬 */
	align-items: center; /* 세로 중앙 정렬 */
	padding-top: 150px; /* 헤더 높이만큼 여백 추가 */
	padding-bottom: 50px; /* 헤더 높이만큼 여백 추가 */
}

.header {
	background-color: #000000;
}

.container {
	max-width: 1200px;
	margin: 0px auto;
	padding: 20px;
}

.container-signup {
	max-width: 800px;
	width: 50%;
	padding: 50px;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
}

h2 {
	margin-bottom: 20px;
}

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

.checkbox-group {
  display: flex; /* Flexbox로 한 줄에 배치 */
  justify-content: space-between; /* 텍스트와 체크박스를 양 끝으로 배치 */
  align-items: center; /* 체크박스와 텍스트를 수직 가운데 정렬 */
  margin-bottom: 10px; /* 각 항목 간격 */
}

.checkbox-group label {
  white-space: nowrap; /* 텍스트 줄바꿈 방지 */
}

.checkbox-group input[type="checkbox"] {
  margin-left: 10px; /* 체크박스와 텍스트 사이 간격 */
}

/* 추가 입력 필드 스타일 */
input[type="text"] {
	width: 100%;
	padding: 8px;
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

input[type="text"]:focus {
	border-color: #007bff; /* 포커스 시 파란색 테두리 */
}

button:hover {
	background-color: #f0f0f0; /* 호버 시 배경색 변경 */
}

.form-group {
	margin-bottom: 5px;
}

.form-group input, .form-group select, .form-group textarea {
	width: calc(100% - 10px);
	padding: 10px;
	border-radius: 3px;
	border: 1px solid #ddd;
	margin-bottom: 5px; /* 아래 요소와 간격 */
}

.form-group textarea {
	resize: none;
}

.address-row {
	display: flex;
	align-items: center;
	gap: 10px;
}

.address-row input[type="text"] {
	flex: 1; /* 입력 필드가 버튼과 균형 있게 배치됨 */
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

/* 추가 입력 필드 스타일 */
input[type="text"] {
	width: 100%;
	padding: 8px;
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

input[type="text"]:focus {
	border-color: #007bff; /* 포커스 시 파란색 테두리 */
}

/* 버튼 스타일 */
button:hover {
	background-color: #f0f0f0; /* 호버 시 배경색 변경 */
}

.form-group {
	margin-bottom: 5px;
}

label {
	display: block;
	font-size: 14px;
	margin-bottom: 5px;
}

.phone-row {
	margin-right: 150px;
	display: flex; /* Flexbox로 한 줄에 배치 */
	gap: 10px; /* 각 요소 간격 */
	align-items: center; /* 수직 가운데 정렬 */
}

.phone-row select, .phone-row input {
	height: 38px; /* 높이를 통일 */
	padding: 5px;
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.phone-row select {
	width: 80px; /* 드롭다운 너비 고정 */
}

.phone-row input {
	flex-grow: 1; /* 입력 필드가 남은 공간을 균등하게 차지 */
}

.radio-group {
	display: flex; /* Flexbox로 한 줄에 배치 */
	gap: 20px; /* 라디오 버튼 사이 간격 */
	align-items: center; /* 수직 가운데 정렬 */
}

.radio-group label {
	display: flex;
	align-items: center; /* 라벨과 라디오 버튼 수직 정렬 */
	font-size: 14px; /* 글씨 크기 조정 */ label { display : block;
	font-size: 14px;
	margin-bottom: 5px;
}
</style>
</style>
</head>
<body>
	<!-- header -->
	<header class="header header-dark header-sticky">
		<div class="container">
			<div class="row">
				<nav class="navbar navbar-expand-lg navbar-dark">
					<a href="main.do" class="navbar-brand order-1 order-lg-2">JOLLERY</a>
					<button class="navbar-toggler order-2" type="button"
						data-toggle="collapse" data-target=".navbar-collapse"
						aria-controls="navbarMenu" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse order-3 order-lg-1"
						id="navbarMenu">
						<ul class="navbar-nav mr-auto">
							<li class="nav-item dropdown megamenu"><a
								class="nav-link dropdown-toggle" href="#!" id="navbarDropdown-4"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">CATEGORIES</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown-4">
									<div class="row">
										<ul class="col-6 col-md-3 col-lg-2">
											<li><span class="megamenu-title">회화</span></li>
											<li><a class="dropdown-item" href="index.html">동양화</a></li>
											<li><a class="dropdown-item" href="index-carousel.html">서양화</a></li>
											<li><a class="dropdown-item"
												href="index-categories.html">판화</a></li>
											<li><a class="dropdown-item" href="index-modern.html">혼합(기타)</a></li>
										</ul>
										<ul class="col-6 col-md-3 col-lg-2">
											<li><span class="megamenu-title">조소</span></li>
											<li><a class="dropdown-item" href="product-classic.html">석재</a></li>
											<li><a class="dropdown-item" href="product-scroll.html">목재</a></li>
											<li><a class="dropdown-item" href="product-masonry.html">금속</a></li>
											<li><a class="dropdown-item" href="product-modern.html">3D프린팅</a></li>
											<li><a class="dropdown-item" href="product-promo.html">혼합재료(기타)</a></li>
										</ul>
										<ul class="col-6 col-md-3 col-lg-2">
											<li><span class="megamenu-title">공예</span></li>
											<li><a class="dropdown-item" href="portal.html">도예</a></li>
											<li><a class="dropdown-item" href="profile.html">유리공예</a></li>
											<li><a class="dropdown-item" href="profile-orders.html">금속공예</a></li>
											<li><a class="dropdown-item"
												href="profile-addresses.html">목공예</a></li>
											<li><a class="dropdown-item"
												href="profile-payments.html">혼합재료(기타)</a></li>
										</ul>
										<ul class="col-6 col-md-3 col-lg-2">
											<li><span class="megamenu-title">기타</span></li>
											<li><a class="dropdown-item" href="about.html">사진</a></li>
											<li><a class="dropdown-item" href="contact.html">설치미술</a></li>
											<li><a class="dropdown-item" href="faq.html">서예</a></li>
											<li><a class="dropdown-item" href="text.html">실험예술(기타)</a></li>
										</ul>
									</div>
								</div></li>
							<!-- 검색창 추가 -->
							<form class="search-bar" action="/search" method="GET">
								<div class="search-container">
									<i class="icon-search"></i> <input type="text" name="query"
										placeholder="Search..." />
								</div>
							</form>
						</ul>
					</div>

					<div class="collapse navbar-collapse order-4 order-lg-3"
						id="navbarMenu2">
						<ul class="navbar-nav ml-auto">
							<li class="nav-item"><a class="nav-link" href="portal.html">로그인</a></li>
							<li class="nav-item"><a class="nav-link" href="관심목록"><i
									class="icon-heart"></i></a></li>
							<li class="nav-item cart"><a data-toggle="modal"
								data-target="#cart" class="nav-link"><span>Cart</span><span>2</span></a>
							</li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
	</header>
	<main>
		<!-- 회원가입 폼 -->
		<div class="container-signup">
			<form id="signup-form">
				<!-- 아이디 -->
				<div class="form-group">
					<label for="username">아이디*</label> <input type="text" id="username"
						name="username" class="form-control" placeholder="영문소문자/숫자, 4~16자"
						required>
				</div>

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
					<label for="phone">연락처 *</label>
					<div class="phone-row">
						<select id="phone-part1" name="phone-part1">
							<option value="010" selected>010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="019">019</option>
						</select> <input type="text" id="phone-part2" name="phone-part2"
							placeholder=""> <input type="text" id="phone-part3"
							name="phone-part3" placeholder="">
					</div>
				</div>
				<!-- 이메일 입력 -->
				<div class="form-group">
					<label for="customer-email">이메일</label>
					<div style="display: flex; align-items: center; gap: 10px;">
						<input type="text" id="email-prefix" name="email-prefix"
							placeholder="Email" style="flex-grow: 1; height: 40px;">
						<span style="line-height: 1;">@</span> <select id="email-domain"
							name="email-domain" style="flex-grow: 1; height: 40px;">
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="daum.net">daum.net</option>
							<option value="custom">직접 입력</option>
						</select>
					</div>
					<!-- 직접 입력 필드 -->
					<input type="text" id="custom-email-domain"
						name="custom-email-domain" placeholder="직접 입력"
						style="margin-top: 10px; display: none;">
					<script>
					document.getElementById("email-domain").addEventListener(
							"change",
							function() {
								const customField = document
										.getElementById("custom-email-domain");
								if (this.value === "custom") {
									customField.style.display = "block";
								} else {
									customField.style.display = "none";
								}
							});
				</script>
				</div>
				<!-- 약관 동의 -->
				<div class="form-group">
				    <label>이용약관 및 개인정보 수집에 동의.*</label>
				    <div class="checkbox-group">
				        <label for="terms-agree">[필수] 이용약관 동의</label>
				        <input type="checkbox" id="terms-agree" name="terms-agree" required>
				    </div>
				    <div class="checkbox-group">
				        <label for="privacy-agree">[필수] 개인정보 수집 및 이용 동의</label>
				        <input type="checkbox" id="privacy-agree" name="privacy-agree" required>
				    </div>
				    <div class="checkbox-group">
				        <label for="marketing-agree">[선택] 쇼핑정보 수신 동의</label>
				        <input type="checkbox" id="marketing-agree" name="marketing-agree">
				    </div>
				</div>



				<!-- 제출 버튼 -->
				<button type="submit" class="btn-submit">회원가입</button>
			</form>
		</div>
	</main>
<script>
document.getElementById("signup-form").addEventListener("submit", function(event) {
    event.preventDefault(); // 기본 폼 제출 동작 방지

    // 폼 데이터 가져오기
    const formData = new FormData(this);

    // 전화번호 조합
    const phonePart1 = formData.get("phone-part1");
    const phonePart2 = formData.get("phone-part2");
    const phonePart3 = formData.get("phone-part3");
    const phone = `\${phonePart1}-\${phonePart2}-\${phonePart3}`;

    // 이메일 조합
    const emailPrefix = formData.get("email-prefix");
    let emailDomain = formData.get("email-domain");
    if (emailDomain === "custom") {
        emailDomain = formData.get("custom-email-domain");
    }
    const addressLine1 = formData.get("address-line1"); // 도로명 주소
    const addressLine2 = formData.get("address-line2"); // 상세 주소
    const address = `\${addressLine1} \${addressLine2}`.trim(); // 공백 제거
    
    const email = `\${emailPrefix}@\${emailDomain}`;


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
                // 도로명 주소와 지번 주소 가져오기
                const roadAddr = data.roadAddress; // 도로명 주소
                const jibunAddr = data.jibunAddress; // 지번 주소
                
                // 도로명 주소 또는 지번 주소를 address-line1에 설정
                document.getElementById('address-line1').value = roadAddr || jibunAddr;

                // 상세 주소 입력 필드로 포커스 이동
                document.getElementById('address-line2').focus();
            }
        }).open({
            left: (window.screen.width / 2) - (width / 2),
            top: (window.screen.height / 2) - (height / 2)
        });
    }
    
</script>
</body>
</html>
