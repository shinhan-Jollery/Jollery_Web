<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="<c:url value='/resources/assets/css/vendor.css' />" />
<link rel="stylesheet"
	href="<c:url value='/resources/assets/css/style.css' />" />

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
							        <i class="icon-search"></i>
							        <input type="text" name="query" placeholder="Search..." />
							    </div>
							</form>
						</ul>
					</div>

					<div class="collapse navbar-collapse order-4 order-lg-3"
						id="navbarMenu2">
						<ul class="navbar-nav ml-auto">
							<li class="nav-item"><a class="nav-link" href="portal.html">로그인</a></li>
							<li class="nav-item"><a class="nav-link" href="관심목록"><i class="icon-heart"></i></a></li>
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
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<div class="image image-overlay image-zoom"
					style="background-image: url(resources/assets/images/demo/background-1.jpg)"></div>
				<div class="container">
					<div class="row align-items-center vh-100">
						<div class="col-lg-8 text-white" data-swiper-parallax-x="-100%">
							<h1 class="display-1 mt-1 mb-3 font-weight-light">
								2025년 상반기 <b class="d-block">졸업 전시회</b>
							</h1>
							<a href="listing-full.html"
								class="btn btn-sm btn-white btn-action">더 알아보기<span
								class="icon-arrow-right"></span></a>
						</div>
					</div>
				</div>
			</div>
			<div class="swiper-slide">
				<div class="image image-overlay image-zoom"
					style="background-image: url(assets/images/background-2.jpg)"></div>
				<div class="container">
					<div class="row align-items-end align-items-center vh-100">
						<div class="col-lg-8 text-white" data-swiper-parallax-x="-100%">
							<h1 class="display-1 mb-2 font-weight-light">
								Brand New <b>Sunglasses</b>
							</h1>
							<a href="listing-full.html"
								class="btn btn-sm btn-white btn-action">Shop Now <span
								class="icon-arrow-right"></span></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="swiper-footer">
			<div class="container">
				<div class="row align-items-center mb-5">
					<div class="col-lg-6">
						<div class="swiper-pagination"></div>
					</div>
					<div class="col-lg-6 text-right">
						<div class="swiper-navigation">
							<div class="swiper-button-prev"></div>
							<div class="swiper-button-next"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- latest products -->
	<section>
		<div class="container">
			<div class="row gutter-1 align-items-end">
				<div class="col-md-6">
					<h2>Featured Products</h2>
				</div>
				<div class="col-md-6 text-md-right">
					<ul class="nav nav-tabs lavalamp" id="myTab" role="tablist">
						<li class="nav-item"><a class="nav-link active" id="home-tab"
							data-toggle="tab" href="#home" role="tab" aria-controls="home"
							aria-selected="true">Best Sellers</a></li>
						<li class="nav-item"><a class="nav-link" id="profile-tab"
							data-toggle="tab" href="#profile" role="tab"
							aria-controls="profile" aria-selected="false">New Arrivals</a></li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade show active" id="home" role="tabpanel">
							<div class="row gutter-2 gutter-md-3">

								<div class="col-6 col-lg-4">
									<div class="product">
										<figure class="product-image">
											<a href="product-classic.html"> <img
												src="resources/assets/images/demo/product-15.jpg" alt="Image"> <img
												src="resources/assets/images/demo/product-15-2.jpg" alt="Image">
											</a>
										</figure>
										<div class="product-meta">
											<h3 class="product-title">
												<a href="product-classic.html">Original Wool Herringbone
													Overshirt</a>
											</h3>
											<div class="product-price">
												<span>$183</span> <span class="product-action"> <a
													href="#!">Add to cart</a>
												</span>
											</div>
											<a href="#!" class="product-like"></a>
										</div>
									</div>
								</div>
								<div class="col-6 col-lg-4">
									<div class="product">
										<figure class="product-image">
											<span class="product-promo bg-red">sale</span>
											<a href="product-classic.html"> <img
												src="resources/assets/images/demo/product-16.jpg" alt="Image"> <img
												src="resources/assets/images/demo/product-16-2.jpg" alt="Image">
											</a>
										</figure>
										<div class="product-meta">
											<h3 class="product-title">
												<a href="product-classic.html">Black Chadwick Sandals</a>
											</h3>
											<div class="product-price">
												<span>$176</span> <span class="product-action"> <a
													href="#!">Add to cart</a>
												</span>
											</div>
											<a href="#!" class="product-like"></a>
										</div>
									</div>
								</div>
								<div class="col-6 col-lg-4">
									<div class="product">
										<figure class="product-image">
											<a href="product-classic.html"> <img
												src="resources/assets/images/demo/product-17.jpg" alt="Image"> <img
												src="resources/assets/images/demo/product-17-2.jpg" alt="Image">
											</a>
										</figure>
										<div class="product-meta">
											<h3 class="product-title">
												<a href="product-classic.html">Navy Lind Wax Sweatshirt</a>
											</h3>
											<div class="product-price">
												<span>$101</span> <span class="product-action"> <a
													href="#!">Add to cart</a>
												</span>
											</div>
											<a href="#!" class="product-like"></a>
										</div>
									</div>
								</div>

								<div class="col-6 col-lg-3">
									<div class="product">
										<figure class="product-image">
											<a href="product-classic.html"> <img
												src="resources/assets/images/demo/product-18.jpg" alt="Image"> <img
												src="resources/assets/images/demo/product-18-2.jpg" alt="Image">
											</a>
										</figure>
										<div class="product-meta">
											<h3 class="product-title">
												<a href="product-classic.html">Black Karlo Backpack</a>
											</h3>
											<div class="product-price">
												<span>$88</span> <span class="product-action"> <a
													href="#!">Add to cart</a>
												</span>
											</div>
											<a href="#!" class="product-like"></a>
										</div>
									</div>
								</div>
								<div class="col-6 col-lg-3">
									<div class="product">
										<figure class="product-image">
											<a href="product-classic.html"> <img
												src="resources/assets/images/demo/product-19.jpg" alt="Image"> <img
												src="resources/assets/images/demo/product-19-2.jpg" alt="Image">
											</a>
										</figure>
										<div class="product-meta">
											<h3 class="product-title">
												<a href="product-classic.html">Light Marl Grey Davis
													Polo</a>
											</h3>
											<div class="product-price">
												<span>$107</span> <span class="product-action"> <a
													href="#!">Add to cart</a>
												</span>
											</div>
											<a href="#!" class="product-like"></a>
										</div>
									</div>
								</div>
								<div class="col-6 col-lg-3">
									<div class="product">
										<figure class="product-image">
											<a href="product-classic.html"> <img
												src="resources/assets/images/demo/product-20.jpg" alt="Image"> <img
												src="resources/assets/images/demo/product-20-2.jpg" alt="Image">
											</a>
										</figure>
										<div class="product-meta">
											<h3 class="product-title">
												<a href="product-classic.html">Green Organic Cotton
													Hoodie</a>
											</h3>
											<div class="product-price">
												<span>$95</span> <span class="product-action"> <a
													href="#!">Add to cart</a>
												</span>
											</div>
											<a href="#!" class="product-like"></a>
										</div>
									</div>
								</div>
								<div class="col-6 col-lg-3">
									<div class="product">
										<figure class="product-image">
											<span class="product-promo">-25%</span>
											<a href="product-scroll.html"> <img
												src="resources/assets/images/demo/product-21.jpg" alt="Image"> <img
												src="resources/assets/images/demo/product-21-2.jpg" alt="Image">
											</a>
										</figure>
										<div class="product-meta">
											<h3 class="product-title">
												<a href="product-scroll.html">Peach Low Curve Iceman
													Trimix Sneakers</a>
											</h3>
											<div class="product-price">
												<span>$271</span> <span class="product-action"> <a
													href="#!">Add to cart</a>
												</span>
											</div>
											<a href="#!" class="product-like"></a>
										</div>
									</div>
								</div>

							</div>
						</div>
						<div class="tab-pane fade" id="profile" role="tabpanel">
							<div class="row gutter-2 gutter-md-3">

								<div class="col-6 col-lg-4">
									<div class="product">
										<figure class="product-image">
											<a href="product-scroll.html"> <img
												src="resources/assets/images/demo/product-6.jpg" alt="Image"> <img
												src="resources/assets/images/demo/product-6-2.jpg" alt="Image">
											</a>
										</figure>
										<div class="product-meta">
											<h3 class="product-title">
												<a href="product-scroll.html">Grey Pendant Bell Lamp</a>
											</h3>
											<div class="product-price">
												<span>$258</span> <span class="product-action"> <a
													href="#!">Add to cart</a>
												</span>
											</div>
											<a href="#!" class="product-like"></a>
										</div>
									</div>
								</div>

								<div class="col-6 col-lg-4">
									<div class="product">
										<figure class="product-image">
											<a href="product-masonry.html"> <img
												src="resources/assets/images/demo/product-3.jpg" alt="Image"> <img
												src="resources/assets/images/demo/product-3-2.jpg" alt="Image">
											</a>
										</figure>
										<div class="product-meta">
											<h3 class="product-title">
												<a href="product-masonry.html">Black IC Pendant Light</a>
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

								<div class="col-6 col-lg-4">
									<div class="product">
										<figure class="product-image">
											<span class="product-promo">-25%</span>
											<a href="product-modern.html"> <img
												src="resources/assets/images/demo/product-4.jpg" alt="Image"> <img
												src="resources/assets/images/demo/product-4-2.jpg" alt="Image">
											</a>
										</figure>
										<div class="product-meta">
											<h3 class="product-title">
												<a href="product-modern.html">Red Analog Magazine Rack</a>
											</h3>
											<div class="product-price">
												<span>$120</span> <span class="product-action"> <a
													href="#!">Add to cart</a>
												</span>
											</div>
											<a href="#!" class="product-like"></a>
										</div>
									</div>
								</div>

								<div class="col-6 col-lg-3">
									<div class="product">
										<figure class="product-image">
											<div class="owl-carousel" data-nav="true" data-loop="true">
												<a href="product-scroll.html"> <img
													src="resources/assets/images/demo/product-2.jpg" alt="Image">
												</a> <a href="product-scroll.html"> <img
													src="assets/images/demo/product-2-2.jpg" alt="Image">
												</a> <a href="product-scroll.html"> <img
													src="resources/assets/images/demo/product-2-3.jpg" alt="Image">
												</a>
											</div>
										</figure>
										<div class="product-meta">
											<h3 class="product-title">
												<a href="product-scroll.html">Dark Stained NY11 Dining
													Chair</a>
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

								<div class="col-6 col-lg-3">
									<div class="product">
										<figure class="product-image">
											<a href="product-promo.html"> <img
												src="resources/assets/images/demo/product-5.jpg" alt="Image"> <img
												src="resources/assets/images/demo/product-5-2.jpg" alt="Image">
											</a>
										</figure>
										<div class="product-meta">
											<h3 class="product-title">
												<a href="product-promo.html">Black Piani Table Lamp</a>
											</h3>
											<div class="product-price">
												<span>$290</span> <span class="product-action"> <a
													href="#!">Add to cart</a>
												</span>
											</div>
											<a href="#!" class="product-like"></a>
										</div>
									</div>
								</div>


								<div class="col-6 col-lg-3">
									<div class="product">
										<figure class="product-image">
											<a href="product-scroll.html"> <img
												src="resources/assets/images/demo/product-1.jpg" alt="Image"> <img
												src="resources/assets/images/demo/product-1-2.jpg" alt="Image">
											</a>
										</figure>
										<div class="product-meta">
											<h3 class="product-title">
												<a href="product-scroll.html">Fawn Wool / Natural
													Mammoth Chair </a>
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

								<div class="col-6 col-lg-3">
									<div class="product">
										<figure class="product-image">
											<a href="product-classic.html"> <img
												src="resources/assets/images/demo/product-7.jpg" alt="Image"> <img
												src="resources/assets/images/demo/product-7-2.jpg" alt="Image">
											</a>
										</figure>
										<div class="product-meta">
											<h3 class="product-title">
												<a href="product-classic.html">Garnet Must Sofa</a>
											</h3>
											<div class="product-price">
												<span>$4,668</span> <span class="product-action"> <a
													href="#!">Add to cart</a>
												</span>
											</div>
											<a href="#!" class="product-like"></a>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col text-center">
					<a href="#!" class="btn btn-outline-secondary">Load More</a>
				</div>
			</div>
		</div>
	</section>


	<!-- categories -->
	<section class="bg-white">
		<div class="container">
			<div class="row gutter-1 text-black">
				<div class="col-lg-5">
					<h2>인기 카테고리</h2>
				</div>
				
			</div>
			<div class="row masonry gutter-1 collage">
				<div class="col-lg-6">
					<a href="listing-full.html" class="card card-equal card-scale">
						<span class="image"
						style="background-image: url(resources/assets/images/look-1.jpg)"></span>
						<div class="card-footer text-white">
							<span class="btn btn-white btn-action">동양화 <span
								class="icon-arrow-right"></span></span>
						</div>
					</a>
				</div>
				<div class="col-lg-6">
					<a href="listing-full.html"
						class="card card-equal equal-50 card-scale"> <span
						class="image"
						style="background-image: url(resources/assets/images/look-2.jpg)"></span>
						<div class="card-footer text-white">
							<span class="btn btn-white btn-action">서양화 <span
								class="icon-arrow-right"></span></span>
						</div>
					</a>
				</div>
				<div class="col-lg-6">
					<a href="listing-full.html"
						class="card card-equal equal-50 card-scale"> <span
						class="image"
						style="background-image: url(resources/assets/images/look-3.jpg)"></span>
						<div class="card-footer text-white">
							<span class="btn btn-white btn-action">도예 <span
								class="icon-arrow-right"></span></span>
						</div>
					</a>
				</div>
			</div>
		</div>
	</section>



	<!-- instagram -->
	<section class="pb-1 no-overflow">
		<div class="container">
			<div class="row gutter-1">
				<div class="col-md-6 col-lg-4 level-1">
					<div class="card card-equal bg-primary text-white">
						<div class="card-header p-4">
							<i class="icon-instagram fs-30"></i>
						</div>
						<div class="card-footer p-4">
							<h2 class="card-title fs-30 w-75">
								We are active on <a href="#!" class="font-weight-bold underline">Instagram</a>
							</h2>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-8">
					<div class="owl-carousel owl-carousel-alt visible"
						data-items="[2,2,1,1]" data-margin="10" data-loop="true"
						data-nav="true">
						<figure class="equal">
							<a class="image image-fade" href="#!"
								style="background-image: url(resources/assets/images/instagram-1.jpg)"></a>
						</figure>
						<figure class="equal">
							<a class="image image-fade" href="#!"
								style="background-image: url(resources/assets/images/instagram-2.jpg)"></a>
						</figure>
						<figure class="equal">
							<a class="image image-fade" href="#!"
								style="background-image: url(resources/assets/images/instagram-3.jpg)"></a>
						</figure>
						<figure class="equal">
							<a class="image image-fade" href="#!"
								style="background-image: url(resources/assets/images/instagram-4.jpg)"></a>
						</figure>
						<figure class="equal">
							<a class="image image-fade" href="#!"
								style="background-image: url(resources/assets/images/instagram-5.jpg)"></a>
						</figure>
					</div>
				</div>
			</div>
		</div>
	</section>


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