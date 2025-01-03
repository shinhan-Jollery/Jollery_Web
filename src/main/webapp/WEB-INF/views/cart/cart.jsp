<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.servletContext.contextPath}" />
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no">

<link rel="stylesheet" href="${path}/resources/assets/css/vendor.css" />
<link rel="stylesheet" href="${path}/resources/assets/css/style.css" />


<title>Profile</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4; /* 페이지 배경: 밝은 회색 */
	color: #333; /* 기본 글자 색상 */
}

.cart-container {
	display: flex;
	justify-content: space-between;
	gap: 30px;
	padding: 20px;
	max-width: 1200px;
	margin: 0 auto;
}

.cart-items {
	width: 70%;
	margin-right: 70px;
}

.cart-items h3 {
	text-align: center;
	margin-bottom: 20px;
	font-size: 24px;
	color: #333; /* 기본 텍스트 색상 */
}

.cart-items table {
	text-align: center;
	width: 100%;
	border-collapse: collapse;
	margin-top: 10px;
	background-color: #fff; /* 테이블 배경: 흰색 */
	border: 1px solid #ddd; /* 테두리 */
	border-radius: 8px;
	overflow: hidden;
	box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
}

.cart-items th {
	background-color: #333; /* 헤더 배경: 어두운 회색 */
	color: white; /* 헤더 글자 색상 */
	font-weight: bold;
	font-size: 16px;
	padding: 15px;
	text-transform: uppercase;
	border-bottom: 2px solid #444; /* 헤더 하단 테두리 */
}

.cart-items td {
	padding: 15px;
	border-bottom: 1px solid #ddd;
	text-align: center;
	vertical-align: middle;
	font-size: 14px;
	color: #555; /* 셀 텍스트 색상 */
}

.cart-items td:first-child {
	display: flex;
	align-items: center;
	justify-content: flex-start;
}

.cart-items td img {
	width: 70px;
	height: 70px;
	object-fit: cover;
	margin-right: 15px;
	border-radius: 5px; /* 이미지 둥글게 */
	border: 1px solid #ddd; /* 이미지 테두리 */
}

.cart-items tr:nth-child(even) {
	background-color: #f9f9f9; /* 교차 행 배경 */
}

.cart-items tr:hover {
	background-color: #f1f1f1; /* hover 효과 */
	transition: all 0.2s ease;
}

.price {
	font-size: 16px;
	font-weight: bold;
	color: #007bff; /* 포인트 색상 */
}

.delete {
	text-align: center;
}

.delete button {
	text-align: right;
	background-color: #a2abb99e; /* 버튼 배경 색상 */
	height: 18px; /* 버튼 높이 */
	width: 18px; /* 버튼 너비 (동그랗게 만들기 위해 높이와 동일) */
	border-radius: 50%; /* 동그란 모양 */
	border: none; /* 테두리 제거 */
	color: #dc3545; /* X 표시 색상 */
	font-size: 10px; /* X 표시 크기 (작게 조정) */
	/* display: flex; /* 중앙 정렬을 위해 flexbox 사용 */ */
	justify-content: center; /* 가로 중앙 정렬 */
	align-items: center; /* 세로 중앙 정렬 */ */
	cursor: pointer; /* 클릭 가능한 커서 표시 */
	box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1); /* 약간의 그림자 효과 */
}

.delete button:hover {
	background-color: #dc3545; /* hover 시 배경색 변경 */
	color: white; /* hover 시 X 색상 변경 */
	transition: background-color 0.3s ease, color 0.3s ease; /* 부드러운 전환 */
}

.cart-summary {
	width: 30%;
	border: 1px solid #ddd;
	border-radius: 8px;
	padding: 10px;
	background-color: #fff; /* 요약 배경: 흰색 */
	box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
	margin-top: 30px; /* 표와 간격 추가 */
}

.cart-summary h3 {
	font-size: 22px;
	font-weight: bold;
	margin-bottom: 20px;
	color: #007bff; /* 포인트 색상 */
}

.cart-summary .total {
	font-size: 24px;
	font-weight: bold;
	margin: 20px 0;
	color: #4f4c4c; /* 포인트 색상 */
}

.cart-summary p {
	margin: 8px 0;
	font-size: 16px;
	color: #555; /* 텍스트 색상 */
}

.cart-summary button {
	width: 100%;
	padding: 12px;
	font-size: 16px;
	cursor: pointer;
	border: none;
	border-radius: 5px;
	margin-bottom: 5px; /* 버튼 간 여백 */
}

.cart-summary button:first-of-type {
	background-color: #28a745; /* 주문하기 버튼 */
	color: white;
}

.cart-summary button:first-of-type:hover {
	background-color: #0056b3;
}

.cart-summary button:last-of-type {
	background-color: #6c757d; /* 관심 상품 버튼 */
	color: white;
}

.cart-summary button:last-of-type:hover {
	background-color: #5a6268;
}

.cart-summary .content-wrapper {
	background-color: #abbcd185; /* 배경 강조 */
	padding: 20px; /* 내용 여백 추가 */
	border-radius: 5px;
	margin-bottom: 20px; /* 아래와 간격 추가 */
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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

	<!-- Hero Section -->
	<section class="hero hero-small bg-dark text-white py-5"></section>

	<!-- Cart Section -->
	<section class="pt-5">
		<div class="cart-container">
			<div class="cart-items">
				<h3>장바구니</h3>
				<table>
					<thead>
						<tr>
							<th>PRODUCT</th>
							<th></th>
							<th class="price">PRICE</th>
							<th class="delete">DELETE</th>
						</tr>
					</thead>
					<tbody>


						<c:forEach items="${cartList}" var="cart">
							<tr>
								<td><img src="${cart.art_thumbnail_image}"
									alt="Product Image"> ${cart.art_title} 
									<br>
									${cart.category_type} / ${cart.mini_category_type}
								</td>
								<td><img src="#" alt="like Image"></td>
								<td class="price">${cart.art_price}₩</td>
								<td class="delete" style="text-align: center;">
									<button onclick="deleteCart(${cart.art_id})">&times;</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="cart-summary">
				<div class="content-wrapper">
					<!-- <div style="background-color : #68738142">  -->
					<div>
						<h3>
							<font color="#007bff">결제 예정 금액</font>
						</h3>


						<c:set var="sum" value="0" />
						<c:forEach var="p" items="${cartList}">
							<c:set var="sum" value="${sum + p.art_price}" />
						</c:forEach>
						<%-- <c:out value="${sum} ₩" /> --%>
						<span style="font-size: 24px; font-weight: bold;">${sum} ₩</span>
						<br>


					</div>

					<hr>

					<c:set var="totalItems" value="0" />
					<c:forEach var="c" items="${cartList}">
						<c:set var="totalItems" value="${totalItems + 1}" />
					</c:forEach>
					<p>- 총 상품 수: ${totalItems}개</p>
					<p>- 배송비: Free</p>
					<hr>
					<button onclick="location.href='#order'">상품 주문하기</button>
					<button onclick="location.href='#like'">관심 상품</button>
				</div>
			</div>
		</div>
	</section>




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
										<span class="cart-item-price">$1 32</span>
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


	<script>							
document.addEventListener('DOMContentLoaded', function () {
    function deleteCart(art_ID) {
    	console.log(art_ID);
        $.ajax({
            url:  '${path}/cart/delete/' + art_ID,  // RESTful DELETE URL
            type: 'DELETE',
            success: function (response) {
                alert(response);  // 서버 응답 메시지 표시
                location.reload();  // 페이지를 리로드하여 장바구니 목록 갱신
            },
            error: function (xhr, status, error) {
                alert("삭제 실패: " + error);  // 삭제 실패 시 알림
                console.error("Error details:", xhr, status, error);  // 추가 디버깅 정보 출력

            }
        });
    }

    // Ensure the function is globally accessible
    window.deleteCart = deleteCart;
});
</script>

</body>
</html>
