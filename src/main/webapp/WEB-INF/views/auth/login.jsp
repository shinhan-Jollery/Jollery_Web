<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="<c:url value='/resources/assets/css/vendor.css' />" />
<link rel="stylesheet"
	href="<c:url value='/resources/assets/css/style.css' />" />
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f9f9f9;
}

main {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 80vh;
}

.header {
	background-color: #000000;
}

h2 {
	text-align: center;
	margin-bottom: 20px;
}
form {
    display: flex;
    flex-direction: column; /* 수직 정렬 */
    align-items: center; /* 자식 요소(버튼 포함)를 중앙 정렬 */
}
.form-group {
	margin-bottom: 15px;
}

.form-group label {
	display: block;
	font-size: 14px;
	margin-bottom: 5px;
}

.form-group input {
	width: 400px;
	padding: 10px;
	font-size: 14px;
	border-radius: 3px;
	border: 1px solid #ddd;
}

.form-group input[type="checkbox"] {
	width: auto;
}

.btn-submit {
    display: block;
    width: 400px; 
    height: 80px;
    background-color: #000000;
    color: #ffffff;
    text-align: center;
    border-radius: 10px; /* 둥근 버튼 */
    text-decoration: none;
    font-size: 16px;
    cursor: pointer; /* 클릭 가능한 버튼 표시 */
}
.btn-submit:hover {
	background-color: #333333;
}

.links {
	text-align: center;
	margin-top: 15px;
}

.links a {
	color: #000; /* 텍스트 색상 */
	text-decoration: none;
	margin: 0 10px; /* 링크 간격 */
}

.links .divider {
	display: inline-block;
	width: 1px;
	height: 14px;
	background-color: #ccc; /* 회색 구분선 */
	vertical-align: middle; /* 텍스트와 수직 정렬 */
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
							<li class="nav-item"><a class="nav-link" href="관심목록"><i
									class="icon-heart"></i></a></li>
							<li class="nav-item cart"><a data-toggle="modal"
								data-target="#cart" class="nav-link"><span>Cart</span><span>2</span></a>
							</li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
	</header>
	<main>
		<div class="login-container">
			<h2>로그인</h2>
			<form id="login-form">
				<!-- 아이디 입력 -->
				<div class="form-group">
					<label for="username">아이디</label> <input type="text" id="username" value="2"
						name="username" placeholder="아이디를 입력하세요" required>
				</div>

				<!-- 비밀번호 입력 -->
				<div class="form-group">
					<label for="password">비밀번호</label> <input type="password" value="2"
						id="password" name="password" placeholder="비밀번호를 입력하세요" required>
				</div>

				<!-- 로그인 버튼 -->
				<button type="button" class="btn-submit" id="login-button">로그인</button>

				<!-- 추가 링크 -->
				<div class="links">
					<a href="/forgot-id">아이디찾기</a> | <a href="/forgot-password">비밀번호찾기</a>
					| <a href="<c:url value='/auth/signup'/>">회원가입</a>
				</div>
			</form>
		</div>
	</main>

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
	<script>
    document.getElementById("login-button").addEventListener("click", function () {
        // 폼 데이터 가져오기
        const username = document.getElementById("username").value.trim();
        const password = document.getElementById("password").value.trim();

        // JSON 변환
        const loginData = {
            username,
            password
        };

        fetch("<c:url value='/auth/login' />", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(loginData)
        })
        .then(response => response.json())
        .then(data => {
            if (data.status === 'success') { 
                alert(data.message); 

                // 쿠키에 JWT 저장 (HttpOnly는 서버에서 설정해야 함)
                document.cookie = `jwt=${data.token}; path=/; max-age=3600`; // 1시간 유효


                // 메인 페이지로 이동
                window.location.href = "/jollery/main.do";
            } else {
                alert(data.message); 
            }
        })
        .catch(error => {
            console.error("로그인 중 오류 발생:", error);
            alert("오류가 발생했습니다. 다시 시도해주세요.");
        });
    });
</script>
	<script src="<c:url value='/resources/assets/js/vendor.min.js' />"></script>
	<script src="<c:url value='/resources/assets/js/app.js' />"></script>
</body>
</html>
