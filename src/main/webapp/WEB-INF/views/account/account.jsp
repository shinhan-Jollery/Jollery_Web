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


<title>정산</title>
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
					<div class="nav nav-pills flex-column lavalamp" role="tablist">
						<a class="nav-link" href="/jollery/auth/infoUpdate" role="tab"
							aria-controls="sidebar-1" aria-selected="false">회원정보</a> <a
							class="nav-link" data-toggle="tab" href="#sidebar-1-2" role="tab"
							aria-controls="sidebar-1-2" aria-selected="false">주문 내역</a> <a
							class="nav-link" href="/jollery/like.do" role="tab"
							aria-controls="sidebar-1-3" aria-selected="false">관심 상품</a> <a
							class="nav-link" data-toggle="tab" href="#sidebar-1-4" role="tab"
							aria-controls="sidebar-1-4" aria-selected="false">작품 등록</a> <a
							class="nav-link" data-toggle="tab" href="#sidebar-1-5" role="tab"
							aria-controls="sidebar-1-5" aria-selected="false">판매 내역</a> <a
							class="nav-link" href="/jollery/auth/account" role="tab"
							aria-controls="sidebar-1-6" aria-selected="false">정산</a>
					</div>
				</aside>
				<!-- / sidebar -->



				<!-- content -->
				<div class="col-lg-9">
					<div class="row">
						<div class="col">
							<div class="tab-content" id="myTabContent">

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
																	<li><a class="dropdown-item" href="#!"
																		id="update-account-btn">계좌 수정</a></li>
																	<li><a class="dropdown-item" href="#!"
																		id="delete-account-btn">계좌 삭제</a></li>
																</ul>
															</div>
														</div>
													</div>
												</div>
												<div id="account-container" class="card w-90">
													<div class="card-body">
														<!-- 계좌 정보를 JavaScript로 동적으로 표시 -->
														<div id="account-info" style="display: none;">
															<h5 class="text-muted">은행, 계좌번호</h5>
															<p class="card-text">
																<b id="account-bank"></b> <span id="account-number"></span>
															</p>
															<h5 class="text-muted">등록 날짜</h5>
															<p class="card-text" id="account-register-date"></p>
														</div>

														<!-- 계좌 등록 폼 -->
														<form id="account-form" style="display: none;"
															method="post">
															<div class="form-group">
																<label for="account_bank">은행명</label> <input type="text"
																	class="form-control" id="account_bank"
																	name="account_bank" placeholder="은행명을 입력하세요" required>
															</div>
															<div class="form-group">
																<label for="account_number">계좌번호</label> <input
																	type="text" class="form-control"
																	id="account_number_input" name="account_number"
																	placeholder="계좌번호를 입력하세요" required>
															</div>
															<br>
															<button type="button" class="btn btn-light btn-sm"
																id="register-account">계좌 등록</button>
														</form>
														<!-- 계좌 수정 폼 -->
														<form id="account-update-form" style="display: none;">
															<div class="form-group">
																<label for="account_bank">은행명</label> <input type="text"
																	class="form-control" id="update-account-bank"
																	placeholder="은행명을 입력하세요" required>
															</div>
															<div class="form-group">
																<label for="account_number">계좌번호</label> <input
																	type="text" class="form-control"
																	id="update-account-number" placeholder="계좌번호를 입력하세요"
																	required>
															</div>
															<br>
															<button type="button" class="btn btn-light btn-sm"
																id="submit-update-btn">수정 완료</button>
														</form>

														<!-- 계좌 삭제 확인 모달 -->
														<div class="modal" tabindex="-1" id="delete-confirm-modal">
															<div class="modal-dialog">
																<div class="modal-content">
																	<div class="modal-header">
																		<h5 class="modal-title">계좌 삭제</h5>
																		<button type="button" class="btn-close"
																			data-bs-dismiss="modal" aria-label="Close"></button>
																	</div>
																	<div class="modal-body">
																		<p>계좌를 삭제하려면 비밀번호를 입력하세요.</p>
																		<input type="password" class="form-control"
																			id="delete-password" placeholder="비밀번호">
																	</div>
																	<div class="modal-footer">
																		<button type="button"
																			class="btn btn-secondary cancel-btn"
																			data-bs-dismiss="modal">취소</button>
																		<button type="button" class="btn btn-danger"
																			id="confirm-delete-btn">계좌 삭제</button>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<script>
												document.addEventListener("DOMContentLoaded", function () {
												    // 계좌 정보를 가져오는 AJAX 요청
												    fetch('/jollery/auth/account/data', {
												        method: 'GET',
												        headers: {
												            'Content-Type': 'application/json',
												        }
												    })
												    .then(response => {
												        if (!response.ok) {
												            throw new Error("HTTP 상태 코드 오류: " + response.status);
												        }
												        return response.json();
												    })
												    .then(data => {
												    	console.log(data);
												        if (data.success) {
												            if (data.account) {
												                // 계좌 정보가 있을 경우
												                const account = data.account;
												                document.getElementById("account-bank").textContent = account.account_bank;
												                document.getElementById("account-number").textContent = account.account_number;

												                const timestamp = account.account_register_date;
												                const date = new Date(timestamp);
												                const formattedDate = date.toLocaleDateString("en-CA");
												                document.getElementById("account-register-date").textContent = formattedDate;

												                document.getElementById("account-info").style.display = "block"; // 계좌 정보 표시
												                document.getElementById("account-form").style.display = "none"; // 계좌 등록 폼 숨김
												            } else {
												                // 계좌 정보가 없을 경우
												                document.getElementById("account-form").style.display = "block"; // 폼 표시
												                document.getElementById("account-info").style.display = "none"; // 계좌 정보 숨김
												            }
												        } else {
												            console.error("서버 응답 오류:", data.message);
												        }
												    })
												    .catch(error => {
												        console.error("계좌 정보를 불러오는 중 오류 발생:", error);
												    });
												});

										    document.addEventListener("DOMContentLoaded", function () {
										        // 계좌 정보가 없으면 폼 표시
										        fetch('/jollery/auth/account/data')
										            .then(response => response.json())
										            .then(data => {
										                if (!data.success || !data.account) {
										                    document.getElementById("account-form").style.display = "block"; // 계좌 등록 폼 표시
										                } else {
										                    document.getElementById("account-info").style.display = "block"; // 계좌 정보 표시
										                    document.getElementById("account-bank").textContent = data.account.account_bank;
										                    document.getElementById("account-number").textContent = data.account.account_number;
										                    document.getElementById("account-register-date").textContent = new Date(data.account.account_register_date).toLocaleDateString();
										                }
										            })
										            .catch(error => console.error("계좌 정보를 불러오는 중 오류 발생:", error));
										
										        // 계좌 등록 버튼 클릭 시 AJAX 요청
										        document.getElementById("register-account").addEventListener("click", function () {
										            const accountBank = document.getElementById("account_bank").value;
										            const accountNumber = document.getElementById("account_number_input").value;
										
										            // 유효성 검사
										            if (!accountBank || !accountNumber) {
										                alert("은행명과 계좌번호를 모두 입력해주세요.");
										                return;
										            }
										
										            const accountData = {
										                account_bank: accountBank,
										                account_number: accountNumber
										            };
										
										            // 계좌 등록 요청
										            fetch('/jollery/auth/account/register', {
										                method: 'POST',
										                headers: {
										                    'Content-Type': 'application/json'
										                },
										                body: JSON.stringify(accountData)
										            })
										            .then(response => response.json())
										            .then(data => {
										                if (data.success) {
										                    alert("계좌 등록이 완료되었습니다.");
										                    location.reload();  // 새로 고침하여 최신 계좌 정보 로드
										                } else {
										                    alert("계좌 등록에 실패했습니다.");
										                }
										            })
										            .catch(error => console.error("계좌 등록 중 오류 발생:", error));
										        });
										    });
										    
										 // 계좌 수정 버튼 클릭 시
									        document.getElementById("update-account-btn").addEventListener("click", () => {
									            document.getElementById("account-info").style.display = "none";
									            document.getElementById("account-update-form").style.display = "block";
									        });

									        // 계좌 수정 제출
									        document.getElementById("submit-update-btn").addEventListener("click", () => {
									            const updatedBank = document.getElementById("update-account-bank").value;
									            const updatedNumber = document.getElementById("update-account-number").value;

									            fetch('/jollery/auth/account/update', {
									                method: 'PUT',
									                headers: { 'Content-Type': 'application/json' },
									                body: JSON.stringify({
									                    account_bank: updatedBank,
									                    account_number: updatedNumber
									                })
									            })
									            .then(response => {
									                if (!response.ok) {
									                    throw new Error("HTTP 상태 코드 오류: " + response.status);
									                }
									                return response.json();
									            })
									            .then(data => {
									                if (data.success) {
									                    alert("계좌가 수정되었습니다.");
									                    location.reload();
									                } else {
									                    alert(data.message || "계좌 수정 중 오류가 발생했습니다.");
									                }
									            })
									            .catch(error => console.error("계좌 수정 중 오류 발생:", error));
									        });

									        document.addEventListener("DOMContentLoaded", function () {
									            const deleteModalElement = document.getElementById("delete-confirm-modal");
									            const deleteModal = new bootstrap.Modal(deleteModalElement);

									            // 계좌 삭제 버튼 클릭 시 모달 표시
									            document.getElementById("delete-account-btn").addEventListener("click", () => {
									                deleteModal.show();
									            });

									            // 모달의 취소 버튼 클릭 시 모달 닫기
									            deleteModalElement.querySelector(".cancel-btn").addEventListener("click", () => {
									                deleteModal.hide();
									            });

									            // 계좌 삭제 확인
									            document.getElementById("confirm-delete-btn").addEventListener("click", () => {
									                const password = document.getElementById("delete-password").value;

									                fetch('/auth/account/delete', {
									                    method: 'DELETE',
									                    headers: { 'Content-Type': 'application/json' },
									                    body: JSON.stringify({ password: password })
									                })
									                    .then(response => {
									                        if (!response.ok) {
									                            throw new Error("HTTP 상태 코드 오류: " + response.status);
									                        }
									                        return response.json();
									                    })
									                    .then(data => {
									                        if (data.success) {
									                            alert("계좌가 삭제되었습니다.");
									                            location.reload();
									                        } else {
									                            alert(data.message || "계좌 삭제 중 오류가 발생했습니다.");
									                        }
									                    })
									                    .catch(error => console.error("계좌 삭제 중 오류 발생:", error))
									                    .finally(() => {
									                        deleteModal.hide(); // 삭제 요청 후 모달 닫기
									                    });
									            });
									        });
									    
										</script>

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
</body>
</html>