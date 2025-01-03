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
	<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css" rel="stylesheet">
	


<title>Profile</title>

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

				<!--  sidebar -->
				<aside class="col-lg-3">
					<div class="nav nav-pills flex-column lavalamp" id="sidebar-1"
						role="tablist">
						<a class="nav-link" href="auth/infoUpdate" role="tab"
							aria-controls="sidebar-1-1">회원정보</a> <a class="nav-link"
							data-toggle="tab" href="#sidebar-1-2" role="tab"
							aria-controls="sidebar-1-2">주문내역</a> <a class="nav-link"
							data-toggle="tab" href="#sidebar-1-3" role="tab"
							aria-controls="sidebar-1-3">관심상품</a> <a class="nav-link"
							data-toggle="tab" href="#sidebar-1-4" role="tab"
							aria-controls="sidebar-1-4">판매자 인증</a>
					</div>

				</aside>


				<!-- / sidebar -->

				<!-- content -->
				<div class="col-lg-9">
					<div class="row">
						<div class="col">
							<div class="tab-content" id="myTabContent">


								<!-- wishlist -->
								<div class="tab-pane fade show active" id="sidebar-1-3"
									role="tabpanel" aria-labelledby="sidebar-1-3">
									<div class="row">
										<div class="col">
											<h3 class="mb-0">관심 상품</h3>
											<span class="eyebrow">총 갯수: ${likedArts.size()}</span>
										</div>
									</div>
									<div class="row gutter-2">
										<c:forEach var="art" items="${likedArts}">
											<div class="col-md-6 col-lg-4">
												<!-- 부트스트랩 카드 컴포넌트 -->
												<div class="card">
													<!-- 카테고리 -->
													<div class="card-header text-left">
														${art.category_id}</div>

													<!-- 작가 이름 -->
													<div class="card-body text-left">
														<p class="card-text font-weight-bold">${art.member_id}</p>
													</div>

													<!-- 이미지 -->
													<div class="card-body text-center">
														<img src="${art.art_thumbnail_image}" class="img-fluid"
															alt="Artwork Thumbnail">
													</div>

													<!-- 제목, 가격, 하트 -->
													<div class="card-footer">
														<div
															class="d-flex justify-content-between align-items-center">
															<!-- 제목과 가격 -->
															<div>
																<h5 class="card-title mb-0">${art.art_title}</h5>
																<p class="card-text mb-0">${art.art_price}원</p>
															</div>

															<!-- 하트 이모티콘 -->
															<a href="#!" class="text-danger like-icon"
																data-member-id="${userId}"
																data-art-id="${art.art_id}"> <i class="bi bi-heart"
																style="font-size: 1.5rem;"></i>
															</a>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
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
	<script>
	document.addEventListener('DOMContentLoaded', function() {
	    // 좋아요 상태 확인
	    document.querySelectorAll('.like-icon').forEach(icon => {
	        const memberId = icon.dataset.memberId;
	        const artId = icon.dataset.artId;
	        const heartIcon = icon.querySelector('i');

	        // 서버에 상태 확인 요청
	        fetch(`/jollery/api/likes/check`, {
	            method: 'POST',
	            headers: { 'Content-Type': 'application/json' },
	            body: JSON.stringify({ member_id: memberId, art_id: artId })
	        })
	            .then(response => response.json())
	            .then(isLiked => {
	                if (isLiked) {
	                    heartIcon.classList.remove('bi-heart');
	                    heartIcon.classList.add('bi-heart-fill');
	                } else {
	                    heartIcon.classList.remove('bi-heart-fill');
	                    heartIcon.classList.add('bi-heart');
	                }
	            })
	            .catch(error => console.error('Error:', error));
	    });

	    // 좋아요 상태 변경 처리
	    document.querySelectorAll('.like-icon').forEach(icon => {
	        icon.addEventListener('click', function (e) {
	            e.preventDefault();

	            const memberId = this.dataset.memberId;
	            const artId = this.dataset.artId;
	            const heartIcon = this.querySelector('i');

	            // 서버에 상태 변경 요청
	            fetch(`/jollery/api/likes/toggle`, {
	                method: 'POST',
	                headers: { 'Content-Type': 'application/json' },
	                body: JSON.stringify({ member_id: memberId, art_id: artId })
	            })
	                .then(response => response.json())
	                .then(newStatus => {
	                    if (newStatus) {
	                        heartIcon.classList.remove('bi-heart');
	                        heartIcon.classList.add('bi-heart-fill');
	                    } else {
	                        heartIcon.classList.remove('bi-heart-fill');
	                        heartIcon.classList.add('bi-heart');
	                    }
	                })
	                .catch(error => console.error('Error:', error));
	        });
	    });
	});

	</script>
</body>
</html>