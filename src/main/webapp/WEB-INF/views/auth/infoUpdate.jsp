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
.form-group .form-control {
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.form-group button {
	height: 40px;
	padding: 0 15px;
}

.form-group select {
	padding: 8px;
}

.col {
	max-width: 65%;
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
			<div class="row gutter-4 justify-content-between">

				<!--  sidebar -->
				<aside class="col-lg-3">
					<div class="nav nav-pills flex-column lavalamp" id="sidebar-1"
						role="tablist">
						<a class="nav-link" href="auth/infoUpdate" role="tab"
							aria-controls="sidebar-1-1">회원정보</a> <a class="nav-link"
							data-toggle="tab" href="#sidebar-1-2" role="tab"
							aria-controls="sidebar-1-2">주문내역</a> <a class="nav-link"
							href="/jollery/like" role="tab" aria-controls="sidebar-1-3">관심상품</a>
						<a class="nav-link" data-toggle="tab" href="#sidebar-1-4"
							role="tab" aria-controls="sidebar-1-4">판매자 인증</a>
					</div>

				</aside>


				<!-- / sidebar -->

				<!-- Button to trigger modal -->
				<button type="button" id="passwordModalTrigger" data-toggle="modal"
					data-target="#passwordModal" style="display: none;"></button>

				<!-- 비밀번호 확인 모달 -->
				<div class="modal fade" id="passwordModal" tabindex="-1"
					role="dialog" aria-labelledby="passwordModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="passwordModalLabel">비밀번호 확인</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form id="passwordCheckForm">
									<div class="form-group">
										<label for="password">비밀번호</label> <input type="password"
											class="form-control" id="password" name="password" required>
									</div>
									<button type="submit" class="btn btn-primary"
										id="submitPasswordCheck">확인</button>
								</form>
								<div id="passwordCheckError" style="display: none; color: red;">비밀번호가
									올바르지 않습니다.</div>
							</div>
						</div>
					</div>
				</div>

				<script>
				document.addEventListener("DOMContentLoaded", function () {
				    const modalTrigger = document.getElementById("passwordModalTrigger");
				    if (modalTrigger) {
				        modalTrigger.click(); // 자동으로 모달 트리거 클릭
				    }
				});
				
				document.addEventListener("DOMContentLoaded", function () {
				    // 비밀번호 확인 폼 제출 이벤트 처리
				    document.getElementById('passwordCheckForm').addEventListener('submit', function (event) {
				        event.preventDefault(); // 폼 제출 시 페이지 리로드 방지
				        const password = document.getElementById('password').value;

				        // 콘솔에 비밀번호가 잘 전달되고 있는지 확인
				        console.log("입력된 비밀번호:", password);

				        // 오류 메시지를 초기화 (처음에는 숨김)
				        const errorElement = document.getElementById('passwordCheckError');
				        errorElement.style.display = 'none'; // 오류 메시지 숨기기

				        // AJAX 요청으로 비밀번호 확인
				        fetch('/jollery/api/auth/pwCheck', {
				            method: 'POST',
				            headers: {
				                'Content-Type': 'application/json',
				            },
				            body: JSON.stringify({ password })
				        })
				            .then(response => {
				                if (!response.ok) {
				                    throw new Error("HTTP 상태 코드 오류: " + response.status);
				                }
				                return response.json();
				            })
				            .then(data => {
				                console.log("응답 데이터:", data); // 응답 데이터를 콘솔로 확인
				                if (data.success) {
				                    // 비밀번호가 맞으면 모달 닫고 사용자 정보 로드
				                    $('#passwordModal').modal('hide'); // Bootstrap 모달 닫기

				                    // 사용자 정보를 로드하는 함수 호출
				                    loadProfileData();
				                } else {
				                    // 비밀번호가 틀리면 에러 메시지 표시
				                    errorElement.style.display = 'block'; // 오류 메시지 보이기
				                    errorElement.textContent = '비밀번호가 일치하지 않습니다.'; // 오류 메시지 내용 설정
				                }
				            })
				            .catch(error => console.error("에러 발생:", error));
				    });
				});

				// 사용자 정보를 불러오는 함수
				function loadProfileData() {
				    fetch("/jollery/api/auth/profile", {
				        method: "GET",
				        headers: {
				            "Content-Type": "application/json",
				        },
				    })
				        .then(response => {
				            if (!response.ok) {
				                throw new Error("HTTP 상태 코드 오류: " + response.status);
				            }
				            return response.json();
				        })
				        .then(data => {
				            if (data.success) {
				                const profile = data.data;
								console.log(profile);
				                // 데이터 로드 후, 필드에 채우기
				                document.getElementById("username").value = profile.member_id;
				                document.getElementById("name").value = profile.member_name;
				                document.getElementById("address-line1").value = profile.member_address;
				                
				                const timestamp = profile.member_birth; // 서버에서 넘어온 타임스탬프
				                const date = new Date(timestamp); // 타임스탬프를 Date 객체로 변환
				             	// YYYY-MM-DD 형식으로 변환
				                const formattedDate = date.toLocaleDateString("en-CA");
				                document.getElementById("birthdate").value = formattedDate;
				                
				                const phoneParts = profile.member_phone.split("-");
				                document.getElementById("phone-part1").value = phoneParts[0];
				                document.getElementById("phone-part2").value = phoneParts[1];
				                document.getElementById("phone-part3").value = phoneParts[2];
				                
				                const emailParts = profile.member_email.split("@");
				                document.getElementById("email-prefix").value = emailParts[0];
				                document.getElementById("email-domain").value = emailParts[1];

				                // 사용자 정보가 로드되었으므로 정보 영역을 보이도록 설정
				                document.getElementById("profile-container").style.display = "block";
				            } else {
				                console.error("회원 정보 조회 실패:", data.message);
				            }
				        })
				        .catch(error => console.error("에러 발생:", error));
				}

				</script>



				<!-- content -->
				<div class="col-lg-9" id="container-info">
					<div class="row">
						<div class="col">
							<div class="tab-content" id="myTabContent">

								<!-- 회원정보입력칸 -->
								<div class="container-signup">
									<form id="signup-form">
										<!-- 아이디 -->
										<div class="form-group">
											<label for="username">아이디*</label> <input type="text"
												id="username" name="username" class="form-control"
												placeholder="아이디" readonly>
										</div>

										<!-- 비밀번호 -->
										<div class="form-group">
											<label for="password">비밀번호*</label> <input type="password"
												id="password" name="password" class="form-control"
												placeholder="영문 대소문자/숫자/특수문자 중 조합, 8~16자">
										</div>

										<!-- 비밀번호 확인 -->
										<div class="form-group">
											<label for="confirm-password">비밀번호 확인*</label> <input
												type="password" id="confirm-password"
												name="confirm-password" class="form-control"
												placeholder="비밀번호를 다시 입력하세요">
										</div>

										<!-- 이름 -->
										<div class="form-group">
											<label for="name">이름*</label> <input type="text" id="name"
												name="name" class="form-control" placeholder="이름">
										</div>

										<!-- 생년월일 -->
										<div class="form-group">
											<label for="birthdate">생년월일*</label> <input type="date"
												id="birthdate" name="birthdate" class="form-control"
												placeholder="생년월일">
										</div>

										<!-- 주소 -->
										<div class="form-group">
											<label for="address-line1">주소 *</label>
											<div style="display: flex; align-items: center; gap: 10px;">
												<input type="text" id="address-line1" name="address-line1"
													class="form-control" placeholder="도로명 주소" style="flex: 1;">
												<button type="button" class="btn btn-secondary"
													onclick="execDaumPostcode()">우편번호 검색</button>
											</div>
											<input type="text" id="address-line2" name="address-line2"
												class="form-control" placeholder="상세 주소"
												style="margin-top: 10px;">
										</div>

										<!-- 연락처 -->
										<div class="form-group">
											<label for="phone">연락처 *</label>
											<div style="display: flex; gap: 10px;">
												<select id="phone-part1" name="phone-part1"
													class="form-control" style="width: 20%;">
													<option value="010" selected>010</option>
													<option value="011">011</option>
													<option value="016">016</option>
													<option value="019">019</option>
												</select> <input type="text" id="phone-part2" name="phone-part2"
													class="form-control" placeholder="" style="flex: 1;">
												<input type="text" id="phone-part3" name="phone-part3"
													class="form-control" placeholder="" style="flex: 1;">
											</div>
										</div>

										<!-- 이메일 입력 -->
										<div class="form-group">
											<label for="customer-email">이메일</label>
											<div style="display: flex; align-items: center; gap: 10px;">
												<input type="text" id="email-prefix" name="email-prefix"
													class="form-control" placeholder="Email" style="flex: 1;">
												<span>@</span> <select id="email-domain" name="email-domain"
													class="form-control" style="flex: 1;">
													<option value="naver.com">naver.com</option>
													<option value="gmail.com">gmail.com</option>
													<option value="daum.net">daum.net</option>
													<option value="custom">직접 입력</option>
												</select>
											</div>
											<!-- 직접 입력 필드 -->
											<input type="text" id="custom-email-domain"
												name="custom-email-domain" class="form-control"
												placeholder="직접 입력" style="margin-top: 10px; display: none;">
											<script>
												document
														.getElementById(
																"email-domain")
														.addEventListener(
																"change",
																function() {
																	const customField = document
																			.getElementById("custom-email-domain");
																	if (this.value === "custom") {
																		customField.style.display = "block";
																	} else {
																		customField.style.display = "none";
																	}
																});
											</script>
										</div>
										<br>

										<!-- 회원 수정 버튼 -->
										<button type="button" class="btn btn-light"
											id="updateMemberBtn">회원정보수정</button>
										<script>
									    document.addEventListener('DOMContentLoaded', function () {
									        document.getElementById('updateMemberBtn').addEventListener('click', function () {
									            // 요소 확인 후 처리
									            const getValue = (id) => {
									                const element = document.getElementById(id);
									                return element ? element.value : null;
									            };
									        
									            const phonePart1 = getValue('phone-part1');
									            const phonePart2 = getValue('phone-part2');
									            const phonePart3 = getValue('phone-part3');
									            const phone = `\${phonePart1}-\${phonePart2}-\${phonePart3}`;

									            const emailPrefix = getValue('email-prefix');
									            const emailDomain = getValue('email-domain');
									            const email = `\${emailPrefix}@\${emailDomain}`;

									          

									            // 서버로 보낼 데이터 구성
									            const memberData = {
									                member_password: getValue('password'),
									                member_name: getValue('name'),
									                member_birth: getValue('birthdate'),
									                member_phone: phone,
									                member_address: getValue('address'),
									                member_email: email
									            };
									
									            // 데이터 전송
									            fetch('/jollery/api/auth/infoUpdate', {
									                method: 'PUT',
									                headers: {
									                    'Content-Type': 'application/json',
									                },
									                body: JSON.stringify(memberData),
									            })
									                .then((response) => response.json())
									                .then((data) => {
									                    if (data.success) {
									                        alert('회원 정보가 수정되었습니다.');
									                    } else {
									                        alert('회원 정보 수정에 실패했습니다.');
									                    }
									                })
									                .catch((error) => {
									                    console.error('에러 발생:', error);
									                    alert('서버와의 통신에 실패했습니다.');
									                });
									        });
									    });
									</script>

										<!-- 회원 삭제 버튼 -->
										<button type="button" class="btn btn-light"
											id="deleteMemberBtn">회원 삭제</button>
										<script>
										document.addEventListener("DOMContentLoaded", function () {
										    // 회원 삭제 버튼 클릭 이벤트 처리
										    document.getElementById('deleteMemberBtn').addEventListener('click', function () {
										        // 비밀번호 확인 요청 (예: 이미 비밀번호 확인 모달에서 비밀번호 입력받음)
										        const password = prompt('비밀번호를 입력하세요');  // 비밀번호 입력 받는 예시 (보안상 비추천, 보완 필요)

										        if (!password) {
										            alert('비밀번호를 입력해야 합니다.');
										            return;
										        }

										        // 비밀번호 확인 (아래는 예시 API 호출)
										        fetch('/jollery/api/auth/pwCheck', {
										            method: 'POST',
										            headers: {
										                'Content-Type': 'application/json',
										            },
										            body: JSON.stringify({ password })
										        })
										        .then(response => {
										            if (!response.ok) {
										                throw new Error("비밀번호 확인 오류");
										            }
										            return response.json();
										        })
										        .then(data => {
										            if (data.success) {
										                // 비밀번호 확인 후 회원 삭제 요청
										                fetch('/jollery/api/auth/delete', {
										                    method: 'DELETE',
										                    headers: {
										                        'Content-Type': 'application/json',
										                    }
										                })
										                .then(response => {
										                    if (!response.ok) {
										                        throw new Error("회원 삭제 실패");
										                    }
										                    return response.json();
										                })
										                .then(deleteData => {
										                    if (deleteData.success) {
										                        alert(deleteData.message);
										                        // 삭제 후 페이지 리다이렉션 또는 화면 갱신
										                        window.location.href = "/logout";  // 예시: 로그아웃 후 홈페이지로 리다이렉션
										                    } else {
										                        alert(deleteData.message);
										                    }
										                })
										                .catch(error => {
										                    console.error("회원 삭제 중 오류 발생:", error);
										                    alert("회원 삭제 중 오류가 발생했습니다.");
										                });
										            } else {
										                alert("비밀번호가 틀렸습니다.");
										            }
										        })
										        .catch(error => {
										            console.error("비밀번호 확인 중 오류 발생:", error);
										            alert("비밀번호 확인 중 오류가 발생했습니다.");
										        });
										    });
										});

										</script>
									</form>
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
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
    function execDaumPostcode() {
        var width = 500; // 팝업의 너비
        var height = 600; // 팝업의 높이

        new daum.Postcode({
            oncomplete: function(data) {
                // 도로명 주소 or 지번 주소 
                const roadAddr = data.roadAddress; // 도로명
                const jibunAddr = data.jibunAddress; // 지번
                document.getElementById('address-line1').value = roadAddr || jibunAddr;

                // 상세 주소 입력으로 focus
                document.getElementById('address-line2').focus();
            }
        }).open({
            left: (window.screen.width / 2) - (width / 2),
            top: (window.screen.height / 2) - (height / 2)
        });
    }
    
</script>

</body>
</html>