<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<!-- �α����� header -->
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
											<li><span class="megamenu-title">ȸȭ</span></li>
											<li><a class="dropdown-item" href="index.html">����ȭ</a></li>
											<li><a class="dropdown-item" href="index-carousel.html">����ȭ</a></li>
											<li><a class="dropdown-item"
												href="index-categories.html">��ȭ</a></li>
											<li><a class="dropdown-item" href="index-modern.html">ȥ��(��Ÿ)</a></li>
										</ul>
										<ul class="col-6 col-md-3 col-lg-2">
											<li><span class="megamenu-title">����</span></li>
											<li><a class="dropdown-item" href="product-classic.html">����</a></li>
											<li><a class="dropdown-item" href="product-scroll.html">����</a></li>
											<li><a class="dropdown-item" href="product-masonry.html">�ݼ�</a></li>
											<li><a class="dropdown-item" href="product-modern.html">3D������</a></li>
											<li><a class="dropdown-item" href="product-promo.html">ȥ�����(��Ÿ)</a></li>
										</ul>
										<ul class="col-6 col-md-3 col-lg-2">
											<li><span class="megamenu-title">����</span></li>
											<li><a class="dropdown-item" href="portal.html">����</a></li>
											<li><a class="dropdown-item" href="profile.html">��������</a></li>
											<li><a class="dropdown-item" href="profile-orders.html">�ݼӰ���</a></li>
											<li><a class="dropdown-item"
												href="profile-addresses.html">�����</a></li>
											<li><a class="dropdown-item"
												href="profile-payments.html">ȥ�����(��Ÿ)</a></li>
										</ul>
										<ul class="col-6 col-md-3 col-lg-2">
											<li><span class="megamenu-title">��Ÿ</span></li>
											<li><a class="dropdown-item" href="about.html">����</a></li>
											<li><a class="dropdown-item" href="contact.html">��ġ�̼�</a></li>
											<li><a class="dropdown-item" href="faq.html">����</a></li>
											<li><a class="dropdown-item" href="text.html">���迹��(��Ÿ)</a></li>
										</ul>
									</div>
								</div></li>
							<!-- �˻�â �߰� -->
							<form class="search-bar" action="/search" method="GET">
								<div class="search-container">
									<i class="icon-search"></i> <input type="text" name="query"
										placeholder="Search..." />
								</div>
							</form>
						</ul>
					</div>




					<!-- ȸ�� ����, �α׾ƿ�, ���ɻ�ǰ, ��ٱ��� -->
					<div class="collapse navbar-collapse order-4 order-lg-3"
						id="navbarMenu2">
						<ul class="navbar-nav ml-auto">
							<!-- ȸ�� ���� ��Ӵٿ� -->
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#!" id="userDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">ȫ�浿 ��</a> <!-- ${sessionScope.user.name} ! -->
								<div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
									<a class="dropdown-item" href="profile.html">ȸ������</a> <br>
									<a class="dropdown-item" href="profile-orders.html">�ֹ�����</a> <br>
									<a class="dropdown-item" href="wishlist.html">���ɻ�ǰ</a> <br>
									<a class="dropdown-item" href="seller-auth.html">�Ǹ��� ����</a>
								</div></li>
							<!-- �α׾ƿ� ��ư -->
							<li class="nav-item"><a class="nav-link" href="logout.do">�α׾ƿ�</a>
							</li>
							<!-- ���ɻ�ǰ -->
							<li class="nav-item"><a class="nav-link" href="���ɸ��"><i
									class="icon-heart"></i></a></li>
							<!-- ��ٱ��� -->
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
</html>