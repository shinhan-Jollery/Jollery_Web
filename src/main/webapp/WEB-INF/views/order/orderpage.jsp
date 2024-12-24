<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Order Page</title>
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

.header {
	background-color: #000000;
}

.container {
	max-width: 1200px;
	margin: 0px auto;
	padding: 20px;
}

.order-section {
	display: flex;
	justify-content: space-between;
	gap: 20px;
	margin-top: 150px;
}

.order-form {
	flex: 2;
	background: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.order-summary {
	flex: 1;
	background: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

h2 {
	margin-bottom: 20px;
}

.form-group {
	margin-bottom: 5px;
}

.form-group input, .form-group select, .form-group textarea {
	width: calc(100% - 10px);
	padding: 10px;
	border-radius: 3px;
	border: 1px solid #ddd;
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

.form-group textarea {
	resize: none;
	margin-bottom: 5px;
}
.form-group buttonarea {
	resize: none;
	margin-bottom: 5px;
}

.form-group label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

.form-group input, 
.form-group select, 
.form-group textarea {
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
    align-items: center; /* 요소를 수직 가운데 정렬 */
    gap: 10px; /* 입력 필드와 버튼 간격 */
}

.address-row input[type="text"] {
    flex: 1; /* 입력 필드가 버튼과 균형 있게 배치됨 */
    font-size: 14px;
    border: 1px solid #ccc; /* 입력 필드 테두리 */
    border-radius: 4px;
    margin-bottom: 10px;
}

.address-row button {
    padding: 8px 12px; 
    font-size: 14px;
    border: 3px solid black; /* 검정 테두리 */
    background-color: #fff;
    cursor: pointer;
    border-radius: 4px; 
    margin-bottom: 10px;
}

.address-row button:hover {
    background-color: #f0f0f0; /* 호버 시 배경색 변경 */
}

.summary-item {
	display: flex;
	justify-content: space-between;
	margin-bottom: 15px;
}

.summary-total {
	font-weight: bold;
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
.address-row {
    display: flex;
    align-items: center;
}

.address-row input[type="text"] {
    flex: 1; /* 입력 필드가 버튼과 균형 있게 배치됨 */
    padding: 8px;
    font-size: 14px;
}
.address-row button {
    margin-left: 10px; /* 버튼과 입력 필드 간격 */
    padding: 8px 12px;
    font-size: 14px;
    border: 1px solid #ccc;
    background-color: #fff;
    cursor: pointer;
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
    display: flex; /* Flexbox로 한 줄에 배치 */
    gap: 10px; /* 각 요소 간격 */
    align-items: center; /* 수직 가운데 정렬 */
}

.phone-row select,
.phone-row input {
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
    font-size: 14px; /* 글씨 크기 조정 */
}

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

	<div class="container">
		<!-- 주문 페이지 -->
		<div class="order-section">

			<!-- 주문 정보 입력 -->
			<div class="order-form">
				<h2>주문자 정보</h2>

				<!-- 이메일 입력 -->
				<div class="form-group">
					<label for="customer-email">이메일</label>
					<div style="display: flex; align-items: center; gap: 10px;">
				    <input type="text" id="email-prefix" name="email-prefix"
				           placeholder="Email" style="flex-grow: 1; height: 40px;">
				    <span style="line-height: 1;">@</span>
					    <select id="email-domain" name="email-domain"
					            style="flex-grow: 1; height: 40px;">
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
						document
								.getElementById("email-domain")
								.addEventListener(
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

				<!-- 배송 정보 -->
				<!-- 배송지 정보 -->
				<h3>배송지 정보</h3>

				<!-- 배송지 선택 -->
				<div class="radio-group">
				    <label>
				        <input type="radio" name="address-option" value="same" checked> 회원 정보와 동일
				    </label>
				    <label>
				        <input type="radio" name="address-option" value="new"> 새로운 배송지
				    </label>
				</div>

				<!-- 배송지 입력 폼 -->
				<div id="address-form">

					<!-- 받으시는 분 -->
					<div class="form-group">
						<label for="recipient-name">받으시는 분 *</label> <input type="text"
							id="recipient-name" name="recipient-name"
							value="${recipientName}" placeholder="받으시는 분 이름을 입력하세요">
					</div>

					<!-- 주소 -->
					<div class="form-group">
						<label for="address-line1">주소 *</label>
						<div class="address-row">
							<input type="text" id="address-line1" name="address-line1"
								placeholder="도로명 주소를 입력하세요">
							<button type="button" onclick="execDaumPostcode()">우편번호	검색</button>
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
				        </select>
				        <input type="text" id="phone-part2" name="phone-part2" placeholder="">
				        <input type="text" id="phone-part3" name="phone-part3" placeholder="">
				    </div>
				</div>

					<!-- 배송 메시지 -->
					<div class="form-group">
						<label for="delivery-message">배송 메시지</label>
						<textarea id="delivery-message" name="delivery-message" rows="4">${deliveryMessage}</textarea>
					</div>

				</div>

			</div>

			<script>
    // 초기 값 설정
    const recipientNameField = document.getElementById("recipient-name");
    const addressLine1Field = document.getElementById("address-line1");
    const addressLine2Field = document.getElementById("address-line2");
    const phonenumber = document.getElementById("phonenumber");
    const deliveryMessageField = document.getElementById("delivery-message");

    // 라디오 버튼 이벤트 리스너
    document.querySelectorAll('input[name="address-option"]').forEach(radio => {
        radio.addEventListener("change", function () {
            if (this.value === "new") {
                // 새로운 배송지를 선택한 경우 모든 필드 비우기
                recipientNameField.value = "";
                addressLine1Field.value = "";
                addressLine2Field.value = "";
                phonenumber.value = "";
                deliveryMessageField.value = "";
            } else if (this.value === "same") {
                // 회원 정보와 동일을 선택한 경우 서버에서 받은 값으로 초기화
                recipientNameField.value = "${recipientName}";
                addressLine1Field.value = "${addressLine1}";
                addressLine2Field.value = "${addressLine2}";
                phonenumber.value = "${phonenumber}";
                deliveryMessageField.value = "${deliveryMessage}";
            }
        });
    });
</script>

			<!-- 주문 요약 -->
			<div class="order-summary">
				<h2>주문상품 정보</h2>

				<!-- 상품 목록 -->
				<div class="summary-item product-image">
					<!-- 상품 이미지 -->
					<div style="display: flex; align-items: center; gap: 15px;">
						<img src="<c:url value='/resources/obb88125/twice.jpg' />"
							alt="상품 이미지"
							style="width: 120px; height: auto; border-radius: 5px;">

						<!-- 상품 정보 -->
						<div>
							<span style="font-weight: bold;">Olivia over the wall</span><br>
							<span>(full moon, cerulean blue sky, dark gray wall)</span><br>
							<span style="font-size: 18px; font-weight: bold;">300,000원</span>
						</div>
					</div>
				</div>

				<!-- 금액 요약 -->
				<hr />
				<div class="summary-item">
					총 주문금액 <span>300,000원</span>
				</div>
				<div class="summary-item">
					상품금액 <span>300,000원</span>
				</div>
				<div class="summary-item">
					배송비 <span>3000원</span>
				</div>
				<hr />
				<div class="summary-item summary-total">
					총 결제예정 금액 <span>303,000원</span>
				</div>

				<!-- 결제 버튼 -->
				<button id="open-popup" class="btn-submit">결제하기</button>
			</div>

		</div>
	</div>
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
	<script>
		document.getElementById("open-popup").addEventListener("click", function () {
		    const popupWidth = Math.min(window.innerWidth *0.8, 1500);
		    const popupHeight = Math.min(window.innerHeight * 0.8, 1500);
		    const left = window.screenX + (window.innerWidth - popupWidth) / 2;
		    const top = window.screenY + (window.innerHeight - popupHeight) / 2;
		    const popup = window.open(
		        "<c:url value='/resources/toss/checkout.jsp' />",
		        "결제 페이지",
		        `width=\${popupWidth},height=\${popupHeight},top=\${top},left=\${left},resizable=yes`
		    );
		
		    if (!popup) {
		        alert("팝업이 차단되었습니다. 브라우저 설정을 확인해주세요.");
		    }
		});
	</script>
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
