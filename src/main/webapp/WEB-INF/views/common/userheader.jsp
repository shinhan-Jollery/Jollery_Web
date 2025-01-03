<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
</head>
<body>

	<!-- 로그인후 header -->
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




					<!-- 회원 정보, 로그아웃, 관심상품, 장바구니 -->
					<div class="collapse navbar-collapse order-4 order-lg-3"
						id="navbarMenu2">
						<ul class="navbar-nav ml-auto">
							<!-- 회원 정보 드롭다운 -->
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#!" id="userDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> ${memberName}</a> <!-- ${sessionScope.user.name} ! -->
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="userDropdown">
									<a class="dropdown-item" href="/jollery/auth/infoUpdate">회원정보</a> <br>
									<a class="dropdown-item" href="/jollery/order/list">주문내역</a> <br>
									<a class="dropdown-item" href="/jollery/like">관심상품</a> <br>
									<a class="dropdown-item" href="/jollery">판매자 인증</a>
								</div></li>
							<!-- 로그아웃 버튼 -->
							
							<li class="nav-item"><a class="nav-link"
								href="javascript:logout()">로그아웃</a></li>
							</li>
							<!-- 관심상품 -->
							<li class="nav-item"><a class="nav-link" href="/jollery/like"><i
									class="icon-heart"></i></a></li>
							<!-- 장바구니 -->
							<li class="nav-item cart"><a data-toggle="modal"
								data-target="#cart" class="nav-link"> <span>Cart</span><span>2</span>
							</a></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
	</header>



</body>
<script>
    function logout() {
        fetch("<c:url value='/auth/logout'/>", { method: 'POST' })
            .then(response => {
                if (response.ok) {
                    // 로그아웃 성공 시 메인 페이지로 리다이렉트
                    alert('로그아웃');
                    window.location.href = "/jollery/main.do";
                } else {
                    alert('로그아웃 실패');
                }
            })
            .catch(error => console.error('Error:', error));
    }
</script>
</html>