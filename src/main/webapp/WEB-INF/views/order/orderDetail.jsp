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
    
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        } 

        .section {
            margin-bottom: 20px;
        }

        .section-header {
        	background-color: #a2abb99e;
       		//background-color: #f9f9f9;
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
            border-bottom: 2px solid #ddd;
            padding-bottom: 5px;
        }

        .product-list {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 10px;
        }

        .product-item {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }

        .product-item:last-child {
            border-bottom: none;
        }

        .product-image {
            width: 80px;
            height: 80px;
            margin-right: 20px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .product-details {
            flex-grow: 1;
        }

        .product-title {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .product-price {
            font-size: 14px;
            color: #888;
        }

        .order-info,
        .payment-info {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 10px;
        }

        .info-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 5px;
        }

        .info-row:last-child {
            margin-bottom: 0;
        }

        .info-label {
            font-weight: bold;
            color: #555;
        }

        .info-value {
            color: #333;
        }

        .total-price {
            font-size: 18px;
            font-weight: bold;
            color: #333;
            text-align: right;
        }
    </style>
</head>
<body>

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
				    <div class="nav nav-pills flex-column lavalamp" id="sidebar-1" role="tablist">
				        <a class="nav-link" data-toggle="tab" href="#sidebar-1-1" role="tab" aria-controls="sidebar-1-1">회원정보</a>
				        <a class="nav-link" data-toggle="tab" href="#sidebar-1-2" role="tab" aria-controls="sidebar-1-2">주문내역</a>
				        <a class="nav-link" data-toggle="tab" href="#sidebar-1-3" role="tab" aria-controls="sidebar-1-3">관심상품</a>
				        <a class="nav-link" data-toggle="tab" href="#sidebar-1-4" role="tab" aria-controls="sidebar-1-4">판매자 인증</a>
				    </div>
				
				</aside>

 



                <!-- Content -->
                <div class="col-lg-9">
                    <div class="tab-content">
                        <!-- Order Details -->
                        <div class="container">
                            <!-- Order Information -->
                            <div class="section">
                                <h4>주문 내역</h4>
                                <!-- Order details to be dynamically inserted -->
                            </div>
                            <!-- <div class="section" style="background-color:#b7d0dfdb"> 주문날짜(주문번호)</div> -->
                            <c:set var="orderDate" value="${orderDetails[0]}" />
                            <div class="section" style="background-color:#b7d0dfdb; padding: 13px; font-size: 18px; font-weight: bold; ">
    						${orderDate.order_date} (주문번호 - J10000123${orderDate.order_ID}) 
							</div>
                            
                            
                            <!-- Product Information -->
                            <div class="section">
                                <div class="section-header">상품 정보</div>
                                <div class="product-list">
                                    <c:forEach var="product" items="${orderDetails}">
                                        <div class="product-item">
                                            <img src="${product.art_thumbnail_image}" alt="상품 이미지" class="product-image">
                                            <div class="product-details">
                                                <div class="product-title">${product.art_title}</div>
                                                <div class="product-category">${product.category_type} / ${product.mini_category_type}</div>
                                                <div class="product-price">${product.art_price} ₩</div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            
                            
                            

                            <!-- Shipping Information -->
                            <div class="section">
                                <div class="section-header">배송 정보</div>
                                 <div class="order-info">
                                    <c:set var="orderInfo" value="${orderDetails[0]}" />
                                    <div class="info-row">
                                        <span class="info-label">받는 사람:</span>
                                        <span class="info-value">${orderInfo.member_name}</span>
                                    </div>
                                    <div class="info-row">
                                        <span class="info-label">연락처:</span>
                                        <span class="info-value">${orderInfo.member_phone}</span>
                                    </div>
                                    <div class="info-row">
                                        <span class="info-label">우편번호:</span>
                                        <span class="info-value">\${orderInfo.???}</span>
                                    </div>
                                    <div class="info-row">
                                        <span class="info-label">주소:</span>
                                        <span class="info-value">${orderInfo.member_address}</span>
                                    </div>
                                    <div class="info-row">
                                        <span class="info-label">상세 주소:</span>
                                        <span class="info-value">${orderInfo.member_address_detail}</span>
                                    </div>
                                    <div class="info-row">
                                        <span class="info-label">배송 메시지:</span>
                                        <span class="info-value">${orderInfo.order_request}</span>
                                    </div>
                            </div>
                            </div>
                            

                            <!-- Payment Information -->
                            <div class="section">
                                <div class="section-header">결제 정보</div>
                                <div class="payment-info">
                                    <div class="info-row">
                                        <span class="info-label">결제 수단:</span>
                                        <span class="info-value">\${orderDetails.paymentMethod}</span>
                                    </div>
                                    <div class="info-row">
                                        <span class="info-label">총 상품 금액:</span>
                                        <span class="info-value">\${orderDetails.totalPrice} ₩</span>
                                    </div>
                                    <div class="info-row">
                                        <span class="info-label">배송비:</span>
                                        <span class="info-value">\${orderDetails.shippingFee} ₩</span>
                                    </div>
                                    <hr>
                                    <div class="total-price">총 결제 금액: \${orderDetails.finalPrice} ₩</div>
                                </div>
                            </div>
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
				<div class="col-lg-6 py-6">
					<div class="row">
						<div class="col-md-8">
							<p><strong>
								졸업작품의 새로운 가치를 발견하다 !</strong><br>JOLLERY는 졸업작품과 갤러리의 의미를 담아, 대학생들의
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
								<a href="cart.html" class="btn btn-lg btn-block btn-secondary">장바구니 보기</a>
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
