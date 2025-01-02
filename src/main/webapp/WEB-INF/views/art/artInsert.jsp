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

<!-- 스마트 에디터 JS -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/se2/js/service/HuskyEZCreator.js"
	src="${pageContext.request.contextPath}/resources/se2/js/service/SE2BasicCreator.js"
	charset="utf-8"></script>
	

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
	<c:choose>
		<c:when test="${not empty userId}">
			<%@ include file="/WEB-INF/views/common/userheader.jsp"%>
		</c:when>
		<c:otherwise>
			<%@ include file="/WEB-INF/views/common/guestheader.jsp"%>
		</c:otherwise>
	</c:choose>

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
							role="tab" aria-controls="sidebar-1-4" aria-selected="false"
							onclick="aa()">작품 등록</a> <a class="nav-link" data-toggle="tab"
							href="#sidebar-1-5" role="tab" aria-controls="sidebar-1-5"
							aria-selected="false">작품정보 수정</a> <a class="nav-link"
							data-toggle="tab" href="#sidebar-1-6" role="tab"
							aria-controls="sidebar-1-6" aria-selected="false">판매 내역</a> <a
							class="nav-link" data-toggle="tab" href="#sidebar-1-7" role="tab"
							aria-controls="sidebar-1-7" aria-selected="false">정산</a>
					</div>
				</aside>
				<!-- / sidebar -->



				<!-- content -->
				<div class="col-lg-9">
					<div class="row">
						<div class="col">
							<div class="tab-content" id="myTabContent">

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
												<!-- 스마트 에디터 텍스트 영역 -->
												<textarea name="ir1" id="ir1" rows="10" cols="100"></textarea>

											</div>
											<div class="form-group">
												<label for="upload">사진 업로드</label> <input type="file"
													id="upload">
											</div>
										</form>
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
		function aa() {
			/* alert("aa"); */
			var oEditors = [];
			nhn.husky.EZCreator
					.createInIFrame({
						oAppRef : oEditors,
						elPlaceHolder : "ir1",
						sSkinURI : "${pageContext.request.contextPath}/resources/se2/SmartEditor2Skin.html",
						fCreator : "createSEditor2"
					});
		}
	</script>

</body>
</html>
