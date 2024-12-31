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

<!-- 스마트 에디터 CSS -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/static/workspace/static/css/ko_KR/smart_editor2.css" />
<!-- 스마트 에디터 JS -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/static/workspace/static/js/service/HuskyEZCreator.js"></script>

<title>Profile</title>
<style>

body{
border: 0px;
}

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

/* 추가 */
.WritingHeader {
	margin-bottom: 20px;
	border-bottom: 2px solid #323232;
	padding-bottom: 10px;
}

.WritingHeader .title {
	font-size: 24px;
	font-weight: bold;
}

.tool_area {
	margin-top: 10px;
	text-align: right;
}

.tool_area .BaseButton {
	text-decoration: none;
	display: inline-block;
	background-color: #28a745;
	color: #fff;
	padding: 10px 20px;
	border-radius: 10px;
	font-size: 14px;
}

.tool_area .BaseButton:hover {
	background-color: #218838;
}

.WritingContent {
	background-color: #fff;
	padding: 30px;
	border: 1px solid #e5e5e5;
	border-radius: 10px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.form-group {
	margin-bottom: 15px;
	overflow: auto; /* 스크롤이 필요한 경우 나타나도록 */
}

input {
	border: 0px;
}

.form-group label {
	/* display: block; */
	font-size: 14px;
	font-weight: bold;
	margin-bottom: 5px;
}

.form-group textarea, .form-group select {
	width: 100%;
	padding: 10px;
	font-size: 14px;
	border: 1px solid #dcdcdc;
	border-radius: 10px;
}

.form-group input {
	width: 100%;
	padding: 10px;
	font-size: 14px;
	border-radius: 10px;
}

/* .form-group #description {
	resize: vertical;
	height: 300px;
} */



.form-group .btn-upload {
	background-color: #007bff;
	color: #fff;
	padding: 10px 15px;
	border: none;
	border-radius: 10px;
	cursor: pointer;
}

.form-group .btn-upload:hover {
	background-color: #0056b3;
}

.form-group #title, .form-group #price, .form-group #size {
	background-color: #efefef;
}

.category-row {
	display: flex;
	gap: 10px;
}

.form-group.price-and-size {
	display: flex;
	gap: 10px;
}

.price-wrapper, .size-wrapper {
	display: flex;
	align-items: center;
	background-color: #efefef;
	/* padding: 10px; */
	border-radius: 10px;
	flex: 1;
}

.price-wrapper input, .size-wrapper input {
	border: none;
	background: none;
	flex: 1;
	font-size: 14px;
}

.price-wrapper .suffix, .size-wrapper .suffix {
	margin-left: 10px;
	margin-right: 15px;
	white-space: nowrap;
	font-size: 14px;
	color: #333;
	white-space: nowrap;
}
</style>
</head>
<body>

	<!-- header -->
	<header class="header header-dark header-sticky">
		<div class="container">
			<div class="row">
				<nav class="navbar navbar-expand-lg navbar-dark">
					<a href="/jollery/main.do" class="navbar-brand order-1 order-lg-2">JOLLERY</a>
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
							상품</a> <a class="nav-link" data-toggle="tab" href="#sidebar-1-4"
							role="tab" aria-controls="sidebar-1-4" aria-selected="false">작품
							등록</a> <a class="nav-link" data-toggle="tab" href="#sidebar-1-5"
							role="tab" aria-controls="sidebar-1-5" aria-selected="false">작품정보
							수정</a> <a class="nav-link" data-toggle="tab" href="#sidebar-1-6"
							role="tab" aria-controls="sidebar-1-6" aria-selected="false">판매
							내역</a> <a class="nav-link" data-toggle="tab" href="#sidebar-1-7"
							role="tab" aria-controls="sidebar-1-7" aria-selected="false">정산</a>
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
												<label for="exampleInput1">이름</label> <input
													id="exampleInput1" type="text" class="form-control"
													placeholder="name">
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
																	src="resources/assets/images/demo/product-1.jpg"
																	alt="Fawn Wool / Natural Mammoth Chair"></a></li>
															<li><a href="product-1.html"
																title="Dark Stained NY11 Dining Chair"
																data-toggle="tooltip" data-placement="top"><img
																	src="resources/assets/images/demo/product-2.jpg"
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
														src="resources/assets/images/demo/product-1.jpg"
														alt="Image"> <img
														src="resources/assets/images/demo/product-1-2.jpg"
														alt="Image">
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
															src="resources/assets/images/demo/product-2.jpg"
															alt="Image">
														</a> <a href="#!"> <img
															src="resources/assets/images/demo/product-2-2.jpg"
															alt="Image">
														</a> <a href="#!"> <img
															src="resources/assets/images/demo/product-2-3.jpg"
															alt="Image">
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
														src="resources/assets/images/demo/product-3.jpg"
														alt="Image"> <img
														src="resources/assets/images/demo/product-3-2.jpg"
														alt="Image">
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



























								<!-- 작품 등록 -->
								<div class="tab-pane fade" id="sidebar-1-4" role="tabpanel"
									aria-labelledby="sidebar-1-4">
									<div class="WritingHeader">
										<h2 class="title">작품 등록</h2>
										<div class="tool_area">
											<a href="#" type="submit" role="button" class="BaseButton">등록</a>
										</div>
									</div>
									<div class="WritingContent">
										<form action="insert.do" method="post">
											<div class="form-group category-row">
												<select id="category">
													<option value="">카테고리 선택</option>
													<option value="painting">회화</option>
													<option value="sculpture">조소</option>
													<option value="craft">공예</option>
													<option value="etc">기타</option>
												</select> <select id="subcategory">
													<option value="">상세 카테고리 선택</option>
													<option value="oriental-painting">동양화</option>
													<option value="western-painting">서양화</option>
													<option value="engraving">판화</option>
													<option value="mixing materials">혼합재료</option>
												</select>
											</div>
											<div class="form-group">
												<input type="text" id="title" placeholder="제목을 입력해 주세요.">
											</div>
											<div class="form-group price-and-size">
												<div class="price-wrapper">
													<input type="number" id="price" placeholder="가격을 입력해 주세요."
														min="0"> <span class="suffix">원</span>
												</div>
												<div class="size-wrapper">
													<input type="text" id="size" placeholder="크기를 입력해 주세요.">
													<span class="suffix">(가로x세로x높이)</span>
												</div>
											</div>



											<div class="form-group">
												<label>내용을 입력하세요.</label>
												<!-- <textarea id="description" placeholder="작품 내용을 입력해 주세요."></textarea> -->
												<!-- 스마트 에디터 텍스트 영역 -->
												<iframe id="content" style="width: 100%; height: 400px; border: none;"></iframe>
												<br> <input type="submit" value="작성 완료">
											</div>
											<div class="form-group">
												<label for="upload">사진 업로드</label> <input type="file"
													id="upload">
											</div>
										</form>
									</div>
								</div>



								<!-- 작품정보 수정 -->
								<div class="tab-pane fade" id="sidebar-1-5" role="tabpanel"
									aria-labelledby="sidebar-1-5">
									<div class="WritingHeader">
										<h2 class="title">작품 수정</h2>
										<div class="tool_area">
											<a href="#" type="submit" role="button" class="BaseButton">수정</a>
											<a href="#" type="submit" role="button" class="BaseButton">삭제</a>
										</div>
									</div>
									<div class="WritingContent">
										<form>
											<div class="form-group category-row">
												<select id="category">
													<option value="">카테고리 선택</option>
													<option value="painting">회화</option>
													<option value="sculpture">조소</option>
													<option value="craft">공예</option>
													<option value="etc">기타</option>
												</select> <select id="subcategory">
													<option value="">상세 카테고리 선택</option>
													<option value="eastern">동양화</option>
													<option value="western">서양화</option>
													<option value="engraving">판화</option>
													<option value="mixing materials">혼합재료</option>
												</select>
											</div>
											<div class="form-group">
												<input type="text" id="title" placeholder="제목을 입력해 주세요.">
											</div>
											<div class="form-group price-and-size">
												<div class="price-wrapper">
													<input type="number" id="price" placeholder="가격을 입력해 주세요."
														min="0"> <span class="suffix">원</span>
												</div>
												<div class="size-wrapper">
													<input type="text" id="size" placeholder="크기를 입력해 주세요.">
													<span class="suffix">(가로x세로x높이)</span>
												</div>
											</div>



											<div class="form-group">
												<label for="description">내용을 입력하세요.</label>
												<textarea id="description" placeholder="작품 내용을 입력해 주세요."></textarea>
											</div>
											<div class="form-group">
												<label for="upload">사진 업로드</label> <input type="file"
													id="upload">
											</div>
										</form>
									</div>
								</div>


























								<!-- 판매 내역 -->
								<div class="tab-pane fade" id="sidebar-1-6" role="tabpanel"
									aria-labelledby="sidebar-1-6">
									<div class="row mb-4">
										<div class="col-12">
											<h3 class="mb-0">판매 내역</h3>
										</div>
									</div>

									<!-- 현재 판매중인 상품 -->
									<div class="row">
										<div class="col-12">
											<div
												class="d-flex justify-content-between align-items-center bg-light px-3 py-2 rounded mb-3">
												<h5 class="mb-0 text-dark" style="font-size: 16px;">현재
													판매중인 상품</h5>
												<a href="#!" class="text-dark" style="font-size: 14px;">전체보기</a>
											</div>
										</div>
										<div class="col-12">
											<div class="card mb-3">
												<div class="card-body">
													<div class="row align-items-center">
														<div class="col-md-2 text-center">
															<img src="resources/assets/images/demo/product-1.jpg"
																alt="상품 이미지" class="img-fluid rounded">
														</div>
														<div class="col-md-6">
															<h5 class="card-title mb-1">Basilica of the Sacred
																Heart of Montmartre, Paris</h5>
															<p class="card-text text-muted mb-0">회화 / 서양화</p>
														</div>
														<div class="col-md-2 text-end">
															<span class="text-primary fw-bold">110,000 ₩</span>
														</div>
														<div class="col-md-2 text-end">
															<a href="#!" class="btn btn-outline-primary btn-sm">상세
																보기</a>
														</div>
													</div>
												</div>
											</div>

											<div class="card mb-3">
												<div class="card-body">
													<div class="row align-items-center">
														<div class="col-md-2 text-center">
															<img src="resources/assets/images/demo/product-2.jpg"
																alt="상품 이미지" class="img-fluid rounded">
														</div>
														<div class="col-md-6">
															<h5 class="card-title mb-1">new morning</h5>
															<p class="card-text text-muted mb-0">기타 / 사진</p>
														</div>
														<div class="col-md-2 text-end">
															<span class="text-primary fw-bold">85,000 ₩</span>
														</div>
														<div class="col-md-2 text-end">
															<a href="#!" class="btn btn-outline-primary btn-sm">상세
																보기</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>

									<!-- 판매 완료 -->
									<div class="row mt-5">
										<div class="col-12">
											<div
												class="d-flex justify-content-between align-items-center bg-light px-3 py-2 rounded mb-3">
												<h5 class="mb-0 text-dark" style="font-size: 16px;">판매
													완료</h5>
												<a href="#!" class="text-dark" style="font-size: 14px;">전체보기</a>
											</div>
										</div>
										<div class="col-12">
											<div class="card mb-3">
												<div class="card-body">
													<div class="row align-items-center">
														<div class="col-md-2 text-center">
															<img src="resources/assets/images/demo/product-4.jpg"
																alt="상품 이미지" class="img-fluid rounded">
														</div>
														<div class="col-md-6">
															<h5 class="card-title mb-1">Dot Lenin</h5>
															<p class="card-text text-muted mb-0">조소 / 혼합재료(기타)</p>
														</div>
														<div class="col-md-2 text-end">
															<span class="text-muted">150,000 ₩</span>
														</div>
														<div class="col-md-2 text-end">
															<a href="#!" class="btn btn-outline-secondary btn-sm">상세
																보기</a>
														</div>
													</div>
												</div>
											</div>

											<div class="card mb-3">
												<div class="card-body">
													<div class="row align-items-center">
														<div class="col-md-2 text-center">
															<img src="resources/assets/images/demo/product-5.jpg"
																alt="상품 이미지" class="img-fluid rounded">
														</div>
														<div class="col-md-6">
															<h5 class="card-title mb-1">Reborn</h5>
															<p class="card-text text-muted mb-0">회화 / 혼합재료(기타)</p>
														</div>
														<div class="col-md-2 text-end">
															<span class="text-muted">110,000 ₩</span>
														</div>
														<div class="col-md-2 text-end">
															<a href="#!" class="btn btn-outline-secondary btn-sm">상세
																보기</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>




								<!-- payments -->
								<div class="tab-pane fade" id="sidebar-1-7" role="tabpanel"
									aria-labelledby="sidebar-1-7">
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



	<script src="<c:url value='/resources/assets/js/vendor.min.js' />"></script>
	<script src="<c:url value='/resources/assets/js/app.js'/>"></script>
	<!-- 네이버 에디터 2.0 -->
	<script>
		var oEditors = [];
		nhn.husky.EZCreator
				.createInIFrame({
					oAppRef : oEditors,
					elPlaceHolder : "content",
					sSkinURI : "${pageContext.request.contextPath}/resources/static/workspace/static/SmartEditor2Skin.html",
					htParams : {
						bUseToolbar : true,
						bUseVerticalResizer : true,
						bUseModeChanger : true,
						bUseFullScreen: true
					}

				});

		// 폼 제출 시 스마트 에디터 내용을 텍스트 영역에 반영
		document.querySelector("form").addEventListener("submit", function(e) {
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		});
	</script>
</body>
</html>
