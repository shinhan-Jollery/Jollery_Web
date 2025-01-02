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
<title>주문내역</title>
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
						<a class="nav-link" href="/jollery/auth/infoUpdate" role="tab"
							aria-controls="sidebar-1-1">회원정보</a> <a class="nav-link"
							data-toggle="tab" href="/jollery/order/list" role="tab"
							aria-controls="sidebar-1-2">주문내역</a> <a class="nav-link"
							data-toggle="tab" href="/jollery/like" role="tab"
							aria-controls="sidebar-1-3">관심상품</a> <a class="nav-link"
							data-toggle="tab" href="#sidebar-1-4" role="tab"
							aria-controls="sidebar-1-4">판매자 인증</a>
					</div>
				</aside>
				<!-- / sidebar -->

				<!-- orders -->
				<div class="tab-pane fade show active col-lg-9" id="sidebar-1-2"
					role="tabpanel" aria-labelledby="sidebar-1-2">
					<div class="row">
						<div class="col-12">
							<h3 class="mb-0">주문 내역</h3>
							<span class="eyebrow">${orderWithArts.size()}개의 주문이 있습니다.</span>
							<!-- 주문한 상품 수 -->
						</div>
					</div>
					<div class="row gutter-2">
						<c:forEach var="item" items="${orderWithArts}">
							<div class="col-12">
								<div class="order">
									<div class="row align-items-center">
										<div class="col-lg-4">
											<h3 class="order-number">
												${item.artTitleList[0]}
												<c:if test="${fn:length(item.artTitleList) > 1}">
											        외 ${fn:length(item.artTitleList) - 1}개
											    </c:if>
												<br>(${fn:substring(item.order_date, 0, 10)})
												<!-- 주문날짜와 첫 번째 작품 제목 -->
											</h3>
											<a href="#!" class="action eyebrow underline">상세보기</a>
										</div>
										<div class="col-lg-4">
											<span
												class="order-status ${item.artStatusList[0] == '배송중' ? 'sent' : 'canceled'}">
												${item.artStatusList[0]} <!-- 첫 번째 작품 상태 -->
											</span>
										</div>
										<div class="col-lg-4">
											<ul class="order-preview justify-content-end">
												<li><a href="product-${item.art_id}.html"
													title="${item.art_title}" data-toggle="tooltip"
													data-placement="top"> <img
														src="${item.art_thumbnail_image}" alt="${item.art_title}">
												</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="row">
						<div class="col">
							<ul class="pagination">
								<li class="page-item active"><a class="page-link" href="#!">1
										<span class="sr-only">(current)</span>
								</a></li>
								<li class="page-item" aria-current="page"><a
									class="page-link" href="#!">2</a></li>
								<li class="page-item"><a class="page-link" href="#!">3</a></li>
								<li class="page-item"><a class="page-link" href="#!">4</a></li>
							</ul>
						</div>
					</div>
				</div>


				<!-- / orders -->
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