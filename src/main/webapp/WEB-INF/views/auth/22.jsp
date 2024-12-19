<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">
<link rel="stylesheet"
	href="<c:url value='/resources/assets/css/vendor.css' />" />
<link rel="stylesheet"
	href="<c:url value='/resources/assets/css/style.css' />" />

<title>Profile</title>
<style>
/* 기본적으로 서브메뉴 숨기기 */
.submenu {
	display: none;
	opacity: 0;
	transition: opacity 0.3s ease-in-out;
	background-color: #f8f9fa;
	border: 1px solid #ddd;
	margin-top: 5px;
	border-radius: 5px;
	padding: 0;
}

/* 판매자 페이지에 마우스 올리면 서브메뉴 표시 */
.seller:hover .submenu {
	display: block;
	opacity: 1;
}

/* 서브메뉴 항목 스타일 */
.submenu a {
	display: block;
	padding: 10px;
	text-decoration: none;
	color: #333;
	transition: all 0.2s ease-in-out;
}

/* 선택된 메뉴 항목 강조 스타일 */
.submenu a.active {
	border: 2px solid #007bff;
	color: #007bff;
	font-weight: bold;
	background-color: #e9f5ff;
}

/* 호버 시 스타일 */
.submenu a:hover {
	background-color: #ddd;
	color: #333;
}

/* 활성화 시 슬라이드 다운 */
.nav-link.seller:hover .submenu {
	display: block;
	opacity: 1;
	max-height: 500px; /* 적절히 큰 값 */
	padding: 10px;
}

.custom-table {
	border-collapse: collapse;
}

.custom-table th, .custom-table td {
	text-align: center;
	vertical-align: middle;
}

.custom-table thead th {
	border-top: 2px solid #dee2e6;
	border-bottom: 2px solid #dee2e6;
}

.custom-table tbody td {
	border-bottom: 1px solid #dee2e6;
}

.custom-table th:first-child, .custom-table td:first-child {
	border-left: none;
}

.custom-table th:last-child, .custom-table td:last-child {
	border-right: none;
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

	<!-- hero -->
	<section class="hero hero-small bg-dark text-white py-5"></section>

	<!-- listing -->
	<section class="pt-5">
		<div class="container">
			<div class="row gutter-4 justify-content-between">


				<!-- sidebar -->
				<aside class="col-lg-3">
					<div class="nav nav-pills flex-column lavalamp" id="sidebar-1"
						role="tablist">
						<a class="nav-link" data-toggle="tab" href="#sidebar-1-1"
							role="tab" aria-controls="sidebar-1" aria-selected="false">회원정보</a>
						<a class="nav-link" data-toggle="tab" href="#sidebar-1-2"
							role="tab" aria-controls="sidebar-1-2" aria-selected="false">주문
							내역</a> <a class="nav-link" data-toggle="tab" href="#sidebar-1-3"
							role="tab" aria-controls="sidebar-1-3" aria-selected="false">관심
							상품</a>
						<div class="nav-link seller" role="tab">
							판매자 페이지
							<div class="submenu">
								<a href="#sidebar-1-4" class="submenu-item" id="menu-register"
									aria-controls="sidebar-1-4" >작품 등록</a> <a
									href="#sidebar-1-5" class="submenu-item" id="menu-sales"
									aria-controls="sidebar-1-5" >판매 내역</a> <a
									href="#sidebar-1-6" class="submenu-item" data-toggle="tab" role="tab" id="menu-settle"
									aria-controls="sidebar-1-6" >정산</a>
							</div>
						</div>
					</div>
				</aside>
				<!-- / sidebar -->
				
				

				<!-- content -->
				<div class="col-lg-9">
					<div class="row">
						<div class="col">
							<div class="tab-content" id="myTabContent">

								<!-- profile -->
								<div class="tab-pane fade" id="sidebar-1-1" role="tabpanel"
									aria-labelledby="sidebar-1-1">
									<div class="row mb-2">
										<div class="col-12">
											<h3>회원 정보</h3>
										</div>
									</div>
									<div class="row gutter-1">
										<div class="col-md-6">
											<div class="form-group">
												<label for="exampleInput1">First Name</label> <input
													id="exampleInput1" type="text" class="form-control"
													placeholder="First name">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="exampleInput2">Last Name</label> <input
													id="exampleInput2" type="text" class="form-control"
													placeholder="Last name">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="exampleInput3">계좌번호</label> <input
													id="exampleInput3" type="text" class="form-control"
													placeholder="Account">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="exampleInput4">주소</label> <input
													id="exampleInput4" type="text" class="form-control"
													placeholder="Street">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="exampleInput6">전화번호</label> <input
													id="exampleInput6" type="text" class="form-control"
													placeholder="Telephone">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="exampleInput7">Email</label> <input
													id="exampleInput7" type="text" class="form-control"
													placeholder="Email">
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col">
											<a href="#!" class="btn btn-primary">회원정보 수정</a>
										</div>
									</div>


									<div class="row mb-2 mt-6">
										<div class="col-12">
											<h3>비밀번호 변경</h3>
										</div>
									</div>
									<div class="row gutter-1">
										<div class="col-md-6">
											<div class="form-group">
												<label for="exampleInput9">새 비밀번호</label> <input
													id="exampleInput9" type="password" class="form-control"
													placeholder="비밀번호">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="exampleInput10">새 비밀번호 확인</label> <input
													id="exampleInput10" type="password" class="form-control"
													placeholder="비밀번호 확인">
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col">
											<a href="#!" class="btn btn-primary">비밀번호 변경</a>
										</div>
									</div>
									<div class="row mt-4">
										<div class="col d-flex justify-content-end">
											<a href="#!" class="btn btn-secondary">회원 탈퇴</a>
										</div>
									</div>
								</div>


								<!-- orders -->
								<div class="tab-pane fade" id="sidebar-1-2" role="tabpanel"
									aria-labelledby="sidebar-1-2">
									<div class="row">
										<div class="col-12">
											<h3 class="mb-0">주문 내역</h3>
											<span class="eyebrow">산 물품수 나와야함</span>
										</div>
									</div>
									<div class="row gutter-2">
										<div class="col-12">
											<div class="order">
												<div class="row align-items-center">
													<div class="col-lg-4">
														<h3 class="order-number">날짜(주문번호)</h3>
														<a href="#!" class="action eyebrow underline">상세보기</a>
													</div>
													<div class="col-lg-4">
														<span class="order-status sent">배송상태 나타내기</span>
													</div>
													<div class="col-lg-4">
														<ul class="order-preview justify-content-end">
															<li><a href="product-1.html"
																title="Fawn Wool / Natural Mammoth Chair"
																data-toggle="tooltip" data-placement="top"><img
																	src="assets/images/demo/product-1.jpg"
																	alt="Fawn Wool / Natural Mammoth Chair"></a></li>
															<li><a href="product-1.html"
																title="Dark Stained NY11 Dining Chair"
																data-toggle="tooltip" data-placement="top"><img
																	src="assets/images/demo/product-2.jpg"
																	alt="Dark Stained NY11 Dining Chair"></a></li>
														</ul>
													</div>
												</div>
											</div>
										</div>
										<div class="col-12">
											<div class="order">
												<div class="row align-items-center">
													<div class="col-lg-4">
														<h3 class="order-number">날짜(주문번호)</h3>
														<a href="#!" class="action eyebrow underline">상세보기</a>
													</div>
													<div class="col-lg-4">
														<span class="order-status canceled">배송상태 나타내기</span>
													</div>
													<div class="col-lg-4">
														<ul class="order-preview justify-content-end">
															<li><a href="product-1.html"
																title="Red Analog Magazine Rack" data-toggle="tooltip"
																data-placement="top"><img
																	src="assets/images/demo/product-4.jpg"
																	alt="Red Analog Magazine Rack"></a></li>
															<li><a href="product-1.html"
																title="Black Piani Table Lamp" data-toggle="tooltip"
																data-placement="top"><img
																	src="assets/images/demo/product-5.jpg"
																	alt="Black Piani Table Lamp"></a></li>
															<li><a href="product-1.html"
																title="Grey Pendant Bell Lamp" data-toggle="tooltip"
																data-placement="top"><img
																	src="assets/images/demo/product-6.jpg"
																	alt="Grey Pendant Bell Lamp"></a></li>
														</ul>
													</div>
												</div>
											</div>
										</div>
										<div class="col-12">
											<div class="order">
												<div class="row align-items-center">
													<div class="col-lg-4">
														<h3 class="order-number">날짜(주문번호)</h3>
														<a href="#!" class="action eyebrow underline">상세보기</a>
													</div>
													<div class="col-lg-4">
														<span class="order-status">배송상태 나타내기</span>
													</div>
													<div class="col-lg-4">
														<ul class="order-preview justify-content-end">
															<li><a href="product-1.html"
																title="Black Low Curve Iceman Trimix Sneakers"
																data-toggle="tooltip" data-placement="top"><img
																	src="assets/images/demo/product-11.jpg"
																	alt="Black Low Curve Iceman Trimix Sneakers"></a></li>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<ul class="pagination">
												<li class="page-item active"><a class="page-link"
													href="#!">1 <span class="sr-only">(current)</span></a></li>
												<li class="page-item" aria-current="page"><a
													class="page-link" href="#!">2</a></li>
												<li class="page-item"><a class="page-link" href="#!">3</a></li>
												<li class="page-item"><a class="page-link" href="#!">4</a></li>
											</ul>
										</div>
									</div>
								</div>

								<!-- wishlist -->
								<div class="tab-pane fade" id="sidebar-1-3" role="tabpanel"
									aria-labelledby="sidebar-1-3">
									<div class="row">
										<div class="col">
											<h3 class="mb-0">관심 상품</h3>
											<span class="eyebrow">총 갯수 나오기</span>
										</div>
									</div>
									<div class="row gutter-2">
										<div class="col-md-6 col-lg-4">
											<div class="product">
												<div class="product-options">
													<select id="inputState" class="custom-select">
														<option selected>Color</option>

													</select> <select id="inputState2" class="custom-select">
														<option selected>Size</option>

													</select>
												</div>
												<figure class="product-image">
													<a href="#!" class="btn btn-ico btn-rounded btn-white"><i
														class="icon-x"></i></a>
													<a href="#!"> <img
														src="assets/images/demo/product-1.jpg" alt="Image">
														<img src="assets/images/demo/product-1-2.jpg" alt="Image">
													</a>
												</figure>
												<div class="product-meta">
													<h3 class="product-title">
														<a href="#!">Fawn Wool / Natural Mammoth Chair </a>
													</h3>
													<div class="product-price">
														<span>$2,268</span> <span class="product-action"> <a
															href="#!">Add to cart</a>
														</span>
													</div>
													<a href="#!" class="product-like"></a>
												</div>
											</div>
										</div>
										<div class="col-md-6 col-lg-4">
											<div class="product">
												<div class="product-options">
													<select id="inputState3" class="custom-select">
														<option selected>Color</option>
														<option>Black</option>
														<option>Blue</option>
													</select> <select id="inputState4" class="custom-select">
														<option selected>Size</option>
														<option>Large</option>
														<option>Small</option>
													</select>
												</div>
												<figure class="product-image">
													<a href="#!" class="btn btn-ico btn-rounded btn-white"><i
														class="icon-x"></i></a>
													<div class="owl-carousel" data-nav="true" data-loop="true">
														<a href="#!"> <img
															src="assets/images/demo/product-2.jpg" alt="Image">
														</a> <a href="#!"> <img
															src="assets/images/demo/product-2-2.jpg" alt="Image">
														</a> <a href="#!"> <img
															src="assets/images/demo/product-2-3.jpg" alt="Image">
														</a>
													</div>
												</figure>
												<div class="product-meta">
													<h3 class="product-title">
														<a href="#!">Dark Stained NY11 Dining Chair</a>
													</h3>
													<div class="product-price">
														<span>$504</span> <span class="product-action"> <a
															href="#!">Add to cart</a>
														</span>
													</div>
													<a href="#!" class="product-like"></a>
												</div>
											</div>
										</div>
										<div class="col-md-6 col-lg-4">
											<div class="product">
												<div class="product-options">
													<select id="inputState5" class="custom-select">
														<option selected>Color</option>
														<option>Black</option>
														<option>Blue</option>
													</select> <select id="inputState6" class="custom-select">
														<option selected>Size</option>
														<option>Large</option>
														<option>Small</option>
													</select>
												</div>
												<figure class="product-image">
													<a href="#!" class="btn btn-ico btn-rounded btn-white"><i
														class="icon-x"></i></a>
													<a href="#!"> <img
														src="assets/images/demo/product-3.jpg" alt="Image">
														<img src="assets/images/demo/product-3-2.jpg" alt="Image">
													</a>
												</figure>
												<div class="product-meta">
													<h3 class="product-title">
														<a href="#!">Black IC Pendant Light</a>
													</h3>
													<div class="product-price">
														<span>$410</span> <span class="product-action"> <a
															href="#!">Add to cart</a>
														</span>
													</div>
													<a href="#!" class="product-like"></a>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- payments -->
								<div class="tab-pane fade show active" id="sidebar-1-6"
									role="tabpanel" aria-labelledby="sidebar-1-6">
									<div class="row">
										<div class="col">
											<h3 class="mb-0">정산</h3>

										</div>
									</div>
									<div class="row gutter-2 mb-6">
										<div class="col-md-6">
											<div class="card card-data">
												<div class="card-header card-header-options">
													<div class="row align-items-center">
														<div class="col">
															<h3 class="card-title">등록 계좌</h3>
														</div>
														<div class="col text-right">
															<div class="dropdown">
																<button id="dropdownMenu2" data-toggle="dropdown"
																	aria-haspopup="true" aria-expanded="false"
																	type="button" class="btn btn-lg btn-secondary btn-ico">
																	<i class="icon-more-vertical"></i>
																</button>
																<ul class="dropdown-menu"
																	aria-labelledby="dropdownMenu2">
																	<li><a class="dropdown-item" href="#!">계좌 수정</a></li>
																	<li><a class="dropdown-item" href="#!">계좌 삭제</a></li>
																</ul>
															</div>
														</div>
													</div>
												</div>
												<div class="card-body w-75">
													<h5 class="eyebrow text-muted">은행, 계좌번호</h5>
													<p class="card-text">
														<b>농협</b> 3333-01-3892-112
													</p>
													<h5 class="eyebrow text-muted">등록 날짜</h5>
													<p class="card-text">2024/12/11</p>
												</div>
											</div>
										</div>

									</div>

									<div class="row">
										<div class="col">
											<h3 class="mb-0">정산 내역</h3>
										</div>
									</div>
									<div class="row mt-3">
										<div class="col">
											<table class="table table-bordered custom-table">
												<thead>
													<tr>
														<th>정산 고유번호</th>
														<th>정산 금액</th>
														<th>정산 날짜</th>
														<th>정산 상태</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>001</td>
														<td>₩1,000,000</td>
														<td>2024-11-01</td>
														<td>정산 완료</td>
													</tr>
													<tr>
														<td>002</td>
														<td>₩500,000</td>
														<td>2024-12-01</td>
														<td>정산 대기중</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
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
				<div class="col-lg-6 py-10">
					<div class="row">
						<div class="col-md-8">
							<p>
								Thanks to <a href="https://www.opumo.com" class="underline">Opumo</a>
								for the images used in this demo theme. Head over to <a
									href="https://www.opumo.com" class="underline">their store</a>
								to get these products.
							</p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-10">
							<h4 class="eyebrow mb-2">Quick Links</h4>
							<ul class="list-group list-group-columns">
								<li class="list-group-item"><a href="about.html">About</a></li>
								<li class="list-group-item"><a href="contact.html">Contact
										Us</a></li>
								<li class="list-group-item"><a href="faq.html">FAQ</a></li>
								<li class="list-group-item"><a href="blog.html">Blog</a></li>
								<li class="list-group-item"><a href="text.html">Terms
										of Use</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-6 py-10">
					<div class="row justify-content-end">
						<div class="col-lg-10">
							<h4 class="eyebrow mb-2">Subscribe</h4>
							<div class="input-group">
								<input type="text" class="form-control form-control-lg"
									placeholder="Email" aria-label="Subscribe"
									aria-describedby="button-addon2">
								<div class="input-group-append">
									<button class="btn btn-white" type="button" id="button-addon2">Subscribe</button>
								</div>
							</div>
						</div>
					</div>
					<div class="row justify-content-end">
						<div class="col-lg-10">
							<h4 class="eyebrow mb-2">Follow us</h4>
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
								<a href="cart.html" class="btn btn-lg btn-block btn-secondary">View
									Cart</a>
							</div>
							<div class="col">
								<a href="checkout.html" class="btn btn-lg btn-block btn-primary">Checkout</a>
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



	<script src="resources/assets/js/vendor.min.js"></script>
	<script src="resources/assets/js/app.js"></script>
</body>
</html>