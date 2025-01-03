<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet"
	href="<c:url value='/resources/assets/css/vendor.css' />" />
<link rel="stylesheet"
	href="<c:url value='/resources/assets/css/style.css' />" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css"
	rel="stylesheet">
<title>판매내역</title>
<style>
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
			<div class="row gutter-4 justify-content-between d-flex">

				<!-- sidebar -->
				<aside class="col-lg-3">
					<div class="nav nav-pills flex-column lavalamp" id="sidebar-1"
						role="tablist">
						<a class="nav-link" data-toggle="tab"
							href="/jollery/auth/infoUpdate" role="tab"
							aria-controls="sidebar-1" aria-selected="false">회원정보</a> <a
							class="nav-link" data-toggle="tab" href="/jollery/order/list"
							role="tab" aria-controls="sidebar-1-2" aria-selected="false">주문
							내역</a> <a class="nav-link" data-toggle="tab" href="/jollery/like"
							role="tab" aria-controls="sidebar-1-3" aria-selected="false">관심
							상품</a> <a class="nav-link" data-toggle="tab" href="#sidebar-1-4"
							role="tab" aria-controls="sidebar-1-4" aria-selected="false">작품
							등록</a> <a class="nav-link" data-toggle="tab"
							href="/jollery/sale/list" role="tab" aria-controls="sidebar-1-5"
							aria-selected="false">판매 내역</a> <a class="nav-link"
							href="/jollery/auth/account" role="tab"
							aria-controls="sidebar-1-6" aria-selected="false">정산</a>
					</div>
				</aside>
				<!-- / sidebar -->

				<!-- 판매 내역 -->
				<div class="tab-pane fade show active col-lg-9" id="sidebar-1-5"
					role="tabpanel" aria-labelledby="sidebar-1-5">
					<!-- 현재 판매중인 상품 -->
					<div class="row">
						
						<div class="col-12">
							<div
								class="d-flex justify-content-between align-items-center bg-light px-3 py-2 rounded mb-3">
								<h5 class="mb-0 text-dark" style="font-size: 16px;">현재 판매중인
									상품</h5>
								<a href="#!" class="text-dark" style="font-size: 14px;">전체보기</a>
							</div>
						</div>
						<div class="col-12">
							<c:forEach var="art" items="${onSaleArts}">
								<div class="card mb-3">
									<div class="card-body">
										<div class="row align-items-center">
											<div class="col-md-2 text-center">
												<img src="${art.art_thumbnail_image}" alt="${art.art_title}"
													class="img-fluid rounded">
											</div>
											<div class="col-md-6">
												<h5 class="card-title mb-1">${art.art_title}</h5>
												<p class="card-text text-muted mb-0">${art.mini_category_id}</p>
											</div>
											<div class="col-md-2 text-end">
												<span class="text-primary fw-bold">${art.art_price} ₩</span>
											</div>
											<div class="col-md-2 text-end">
												<a href="#!" class="btn btn-outline-primary btn-sm">상세
													보기</a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					
					<!-- 배송중 상품 -->
					<div class="row">
						
						<div class="col-12">
							<div
								class="d-flex justify-content-between align-items-center bg-light px-3 py-2 rounded mb-3">
								<h5 class="mb-0 text-dark" style="font-size: 16px;">배송중인
									상품</h5>
								<a href="#!" class="text-dark" style="font-size: 14px;">전체보기</a>
							</div>
						</div>
						<div class="col-12">
							<c:forEach var="art" items="${deliveryArts}">
								<div class="card mb-3">
									<div class="card-body">
										<div class="row align-items-center">
											<div class="col-md-2 text-center">
												<img src="${art.art_thumbnail_image}" alt="${art.art_title}"
													class="img-fluid rounded">
											</div>
											<div class="col-md-6">
												<h5 class="card-title mb-1">${art.art_title}</h5>
												<p class="card-text text-muted mb-0">${art.mini_category_id}</p>
											</div>
											<div class="col-md-2 text-end">
												<span class="text-primary fw-bold">${art.art_price} ₩</span>
											</div>
											<div class="col-md-2 text-end">
												<a href="#!" class="btn btn-outline-primary btn-sm">상세
													보기</a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>

					<!-- 판매 완료 -->
					<div class="row mt-5">
						
						<div class="col-12">
							<div
								class="d-flex justify-content-between align-items-center bg-light px-3 py-2 rounded mb-3">
								<h5 class="mb-0 text-dark" style="font-size: 16px;">판매 완료
									상품</h5>
								<a href="#!" class="text-dark" style="font-size: 14px;">전체보기</a>
							</div>
						</div>
						<div class="col-12">
							<c:forEach var="art" items="${soldArts}">
								<div class="card mb-3">
									<div class="card-body">
										<div class="row align-items-center">
											<div class="col-md-2 text-center">
												<img src="${art.art_thumbnail_image}" alt="${art.art_title}"
													class="img-fluid rounded">
											</div>
											<div class="col-md-6">
												<h5 class="card-title mb-1">${art.art_title}</h5>
												<p class="card-text text-muted mb-0">${art.mini_category_id}</p>
											</div>
											<div class="col-md-2 text-end">
												<span class="text-muted">${art.art_price} ₩</span>
											</div>
											<div class="col-md-2 text-end">
												<a href="#!" class="btn btn-outline-secondary btn-sm">상세
													보기</a>
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

	<script src="<c:url value='/resources/assets/js/vendor.min.js' />"></script>
	<script src="<c:url value='/resources/assets/js/app.js'/>"></script>
</body>
</html>