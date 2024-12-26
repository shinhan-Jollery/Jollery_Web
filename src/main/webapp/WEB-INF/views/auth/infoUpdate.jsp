<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="<c:url value='/resources/assets/css/vendor.css' />" />
<link rel="stylesheet"
	href="<c:url value='/resources/assets/css/style.css' />" />


<title>Profile</title>
<style>
.form-group .form-control {
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.form-group button {
	height: 40px;
	padding: 0 15px;
}

.form-group select {
	padding: 8px;
}

.col {
	max-width: 65%;
}
</style>

</head>
<body>

	<!-- header -->
	<header class="header header-dark header-sticky">
		<div class="container">
			<div class="row">
				<nav class="navbar navbar-expand-lg navbar-dark">
					<a href="index.html" class="navbar-brand order-1 order-lg-2">JOLLERY</a>
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
							<li class="nav-item"><a class="nav-link"
								href="/jollery/like.do"><i class="icon-heart"></i></a></li>
							<li class="nav-item cart"><a data-toggle="modal"
								data-target="#cart" class="nav-link"><span>Cart</span><span>2</span></a>
							</li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
	</header>

	<!-- hero -->
	<section class="hero hero-small bg-dark text-white py-5"></section>

	<!-- listing -->
	<section class="pt-5">
		<div class="container">
			<div class="row gutter-4 justify-content-between">

				<!--  sidebar -->
				<aside class="col-lg-3">
					<div class="nav nav-pills flex-column lavalamp" id="sidebar-1"
						role="tablist">
						<a class="nav-link" href="auth/infoUpdate"
							role="tab" aria-controls="sidebar-1-1">회원정보</a> <a
							class="nav-link" data-toggle="tab" href="#sidebar-1-2" role="tab"
							aria-controls="sidebar-1-2">주문내역</a> <a class="nav-link"
							href="/jollery/like.do" role="tab"
							aria-controls="sidebar-1-3">관심상품</a> <a class="nav-link"
							data-toggle="tab" href="#sidebar-1-4" role="tab"
							aria-controls="sidebar-1-4">판매자 인증</a>
					</div>

				</aside>


				<!-- / sidebar -->

				<!-- Button to trigger modal -->
				<button type="button" id="passwordModalTrigger" data-toggle="modal"
					data-target="#passwordModal" style="display: none;"></button>

				<!-- Modal -->
				<div class="modal fade" id="passwordModal" tabindex="-1"
					role="dialog" aria-labelledby="passwordModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="passwordModalLabel">비밀번호 확인</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form id="passwordCheckForm">
									<div class="form-group">
										<label for="password">비밀번호</label> <input type="password"
											class="form-control" id="password" name="password" required>
									</div>
									<button type="submit" class="btn btn-primary">확인</button>
								</form>
							</div>
						</div>
					</div>
				</div>
				<script>
				document.addEventListener("DOMContentLoaded", function () {
				    const modalTrigger = document.getElementById("passwordModalTrigger");
				    if (modalTrigger) {
				        modalTrigger.click(); // 자동으로 모달 트리거 클릭
				    }
				});
				document.getElementById('submitPasswordCheck').addEventListener('click', function() {
					  const password = document.getElementById('password').value;

					  // AJAX 요청으로 비밀번호 확인
					  fetch('/auth/checkPassword', {
					    method: 'POST',
					    headers: {
					      'Content-Type': 'application/json',
					    },
					    body: JSON.stringify({ password }),
					  })
					  .then(response => response.json())
					  .then(data => {
					    if (data.success) {
					      // 비밀번호가 맞으면 모달 닫고 수정 페이지로 이동
					      $('#passwordCheckModal').modal('hide');
					      window.location.href = '/auth/updateInfo';
					    } else {
					      // 비밀번호가 틀리면 에러 메시지 표시
					      document.getElementById('passwordCheckError').style.display = 'block';
					    }
					  })
					  .catch(error => console.error('Error:', error));
					});

				</script>


				<!-- content -->
				<div class="col-lg-9" id="container-info">
					<div class="row">
						<div class="col">
							<div class="tab-content" id="myTabContent">

								<!-- profile -->
								<div class="container-signup">
									<form id="signup-form">
										<!-- 아이디 -->
										<div class="form-group">
											<label for="username">아이디*</label> <input type="text"
												id="username" name="username" class="form-control"
												placeholder="영문소문자/숫자, 4~16자" required>
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
												type="password" id="confirm-password"
												name="confirm-password" class="form-control"
												placeholder="비밀번호를 다시 입력하세요" required>
										</div>

										<!-- 이름 -->
										<div class="form-group">
											<label for="name">이름*</label> <input type="text" id="name"
												name="name" class="form-control" placeholder="이름을 입력하세요"
												required>
										</div>

										<!-- 주소 -->
										<div class="form-group">
											<label for="address-line1">주소 *</label>
											<div style="display: flex; align-items: center; gap: 10px;">
												<input type="text" id="address-line1" name="address-line1"
													class="form-control" placeholder="도로명 주소를 입력하세요"
													style="flex: 1;">
												<button type="button" class="btn btn-secondary"
													onclick="execDaumPostcode()">우편번호 검색</button>
											</div>
											<input type="text" id="address-line2" name="address-line2"
												class="form-control" placeholder="상세 주소를 입력하세요"
												style="margin-top: 10px;">
										</div>

										<!-- 연락처 -->
										<div class="form-group">
											<label for="phone">연락처 *</label>
											<div style="display: flex; gap: 10px;">
												<select id="phone-part1" name="phone-part1"
													class="form-control" style="width: 20%;">
													<option value="010" selected>010</option>
													<option value="011">011</option>
													<option value="016">016</option>
													<option value="019">019</option>
												</select> <input type="text" id="phone-part2" name="phone-part2"
													class="form-control" placeholder="" style="flex: 1;">
												<input type="text" id="phone-part3" name="phone-part3"
													class="form-control" placeholder="" style="flex: 1;">
											</div>
										</div>

										<!-- 이메일 입력 -->
										<div class="form-group">
											<label for="customer-email">이메일</label>
											<div style="display: flex; align-items: center; gap: 10px;">
												<input type="text" id="email-prefix" name="email-prefix"
													class="form-control" placeholder="Email" style="flex: 1;">
												<span>@</span> <select id="email-domain" name="email-domain"
													class="form-control" style="flex: 1;">
													<option value="naver.com">naver.com</option>
													<option value="gmail.com">gmail.com</option>
													<option value="daum.net">daum.net</option>
													<option value="custom">직접 입력</option>
												</select>
											</div>
											<!-- 직접 입력 필드 -->
											<input type="text" id="custom-email-domain"
												name="custom-email-domain" class="form-control"
												placeholder="직접 입력" style="margin-top: 10px; display: none;">
											<script>
												document
														.getElementById(
																"email-domain")
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

										<!-- 제출 버튼 -->
										<button type="submit" class="btn btn-light">회원정보수정</button>
										<button type="submit" class="btn btn-light">회원삭제</button>
									</form>
								</div>











							</div>
						</div>
					</div>
				</div>
				<!-- / content -->

			</div>
		</div>
	</section>
	<!-- listing -->



	<!-- footer -->
	<footer class="bg-dark text-white py-0">
		<div class="container">
			<div class="row separated">
				<div class="col-lg-6 py-6">
					<div class="row">
						<div class="col-md-8">
							<p>
								<strong> 졸업작품의 새로운 가치를 발견하다 !</strong><br>JOLLERY는 졸업작품과
								갤러리의 의미를 담아, 대학생들의 졸업 작품이 단순한 전시로 끝나지 않고 지속적인 예술적 가치를 인정받을 수 있도록
								돕는 플랫폼입니다. 버려지거나 방치되는 졸업작품에 새 생명을 불어넣고, 자원 순환과 창작의 가치를 함께
								만들어갑니다. 지금 바로 JOLLERY와 함께하세요!
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
				<div class="col-lg-6 py-6">
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


	<!-- cart -->
	<div class="modal fade sidebar" id="cart" tabindex="-1" role="dialog"
		aria-labelledby="cartLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="cartLabel">Cart</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<div class="row gutter-3">
						<div class="col-12">
							<div class="cart-item cart-item-sm">
								<div class="row align-items-center">
									<div class="col-lg-9">
										<div class="media media-product">
											<a href="#!"><img src="assets/images/demo/product-3.jpg"
												alt="Image"></a>
											<div class="media-body">
												<h5 class="media-title">Black IC Pendant Light</h5>
												<span class="media-subtitle">Black, Steel</span>
											</div>
										</div>
									</div>
									<div class="col-lg-3 text-center text-lg-right">
										<span class="cart-item-price">$90</span>
									</div>
									<a href="#!" class="cart-item-close"><i class="icon-x"></i></a>
								</div>
							</div>
						</div>
						<div class="col-12">
							<div class="cart-item cart-item-sm">
								<div class="row align-items-center">
									<div class="col-lg-9">
										<div class="media media-product">
											<a href="#!"><img src="assets/images/demo/product-4.jpg"
												alt="Image"></a>
											<div class="media-body">
												<h5 class="media-title">Red Analog Magazine Rack</h5>
												<span class="media-subtitle">Red</span>
											</div>
										</div>
									</div>
									<div class="col-lg-3 text-center text-lg-right">
										<span class="cart-item-price">$120</span>
									</div>
									<a href="#!" class="cart-item-close"><i class="icon-x"></i></a>
								</div>
							</div>
						</div>
						<div class="col-12">
							<div class="cart-item cart-item-sm">
								<div class="row align-items-center">
									<div class="col-lg-9">
										<div class="media media-product">
											<a href="#!"><img src="assets/images/demo/product-24.jpg"
												alt="Image"></a>
											<div class="media-body">
												<h5 class="media-title">Closca Helmet</h5>
												<span class="media-subtitle">Black</span>
											</div>
										</div>
									</div>
									<div class="col-lg-3 text-center text-lg-right">
										<span class="cart-item-price">$132</span>
									</div>
									<a href="#!" class="cart-item-close"><i class="icon-x"></i></a>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<div class="container-fluid">
						<div class="row gutter-0">
							<div class="col d-none d-md-block">
								<a href="cart.html" class="btn btn-lg btn-block btn-secondary">장바구니
									보기</a>
							</div>
							<div class="col">
								<a href="checkout.html" class="btn btn-lg btn-block btn-primary">주문하기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- search -->
	<div class="modal fade search" id="search" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<input type="text" class="form-control"
						placeholder="Type your search here"
						aria-label="Type your search here"
						aria-describedby="button-addon2">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			</div>
		</div>
	</div>



	<script src="<c:url value='/resources/assets/js/vendor.min.js' />"></script>
	<script src="<c:url value='/resources/assets/js/app.js'/>"></script>

</body>
</html>