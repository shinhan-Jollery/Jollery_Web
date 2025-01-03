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

<title>Jollery</title>
<style>
.art-container {
	display: flex;
	flex-direction: column;
	gap: 20px;
	border: 1px solid #ddd;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.main-info {
	display: flex;
	gap: 40px;
}

.main-info .image-section {
	flex: 1;
}

.main-info .image-section img {
	width: 100%;
	border-radius: 8px;
}

.main-info .details-section {
	flex: 1;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.main-info .details-section h1 {
	font-size: 28px;
	margin-bottom: 20px;
}

.main-info .details-section .info {
	margin-bottom: 20px;
}

.main-info .details-section .info p {
	margin: 5px 0;
}

.main-info .details-section .actions button {
	background-color: #28a745;
	color: white;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
	margin-right: 10px;
	font-size: 16px;
}

.description {
	margin-top: 40px;
}

.description h2 {
	font-size: 24px;
	margin-bottom: 10px;
}

.related-products {
	margin-top: 40px;
}

.related-products h2 {
	font-size: 24px;
	margin-bottom: 20px;
}

.related-products .product-list {
	display: flex;
	gap: 20px;
}

.related-products .product-list .item {
	text-align: center;
	flex: 1;
}

.related-products .product-list .item img {
	width: 100%;
	border-radius: 8px;
	margin-bottom: 10px;
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

				<!-- content -->
				<div class="col-lg-9">
					<div class="row">
						<div class="col">
							<div class="tab-content" id="myTabContent">

								<!-- Artwork Details -->
								<div class="art-container">
									<div class="main-info">
										<div class="image-section">
											<img src="/resources/images/artwork.jpg" alt="Artwork">
										</div>
										<div class="details-section">
											<h1>Olivia over the wall</h1>
											<div class="info">
												<p>
													<strong>작가:</strong> 홍수빈
												</p>
												<p>
													<strong>크기:</strong> 30x20x1.0(cm)
												</p>
												<p>
													<strong>가격:</strong> 95,000원
												</p>
											</div>
											<div class="actions">
												<button>바로 구매</button>
												<button>찜하기</button>
											</div>
										</div>
									</div>

									<!-- Description -->
									<div class="description">
										<h2>작품 상세정보</h2>
										<p>행복을 선물하는 작가, 홍수빈의 라이프 에세이다. 작가의 시작은 꽤 긴 어린 시절부터 애니메이션
											'올리비아 아의 이야기'에, 작품성과 감정표현이 담긴 소녀의 독특한 이야기와 사랑스러운 돼지 주인공이
											등장한다.</p>
									</div>

									<!-- Related Products -->
									<div class="related-products">
										<h2>관련 상품</h2>
										<div class="product-list">
											<div class="item">
												<img src="/resources/images/chair.jpg" alt="Chair">
												<p>Fawn Wool Chair</p>
											</div>
											<div class="item">
												<img src="/resources/images/lamp.jpg" alt="Lamp">
												<p>Black IC Pendant Light</p>
											</div>
											<div class="item">
												<img src="/resources/images/rack.jpg" alt="Rack">
												<p>Red Analog Magazine Rack</p>
											</div>
											<div class="item">
												<img src="/resources/images/table.jpg" alt="Table">
												<p>Black Plani Table Lamp</p>
											</div>
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
</body>
</html>
