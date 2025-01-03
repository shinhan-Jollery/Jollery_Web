<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="chatHeader.jsp"%>
<!DOCTYPE html>
<html>
<body>
	<!-- Layout -->
	<div class="layout overflow-hidden">
		<!-- 채팅 영역 -->
		<main class="main is-visible" data-dropzone-area="">
			<div class="container h-100">
				<div class="d-flex flex-column h-100 position-relative">
					<!-- 채팅 header -->
					<div class="chat-header border-bottom py-4 py-lg-7">
						<div class="row align-items-center">
							<div class="col-8 col-xl-12">
								<div class="row align-items-center text-center text-xl-start">
									<!-- 채팅 상대방 -->
									<div class="col-12 col-xl-6">
										<div class="row align-items-center gx-5">
											<div class="col-auto">
												<div class="avatar avatar-online d-none d-xl-inline-block"></div>
											</div>

											<div class="col overflow-hidden">
												<h5 class="text-truncate">상대방</h5>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- 채팅 -->
					<div class="chat-body hide-scrollbar flex-1 h-100">
						<div class="chat-body-inner">
							<div class="py-6 py-lg-12">

								<!-- Message -->
								<div class="message">
									<div class="message-inner">
										<div class="message-body">
											<div class="message-content">
												<div class="message-text">
													<p>1번 채팅~</p>
												</div>
											</div>

											<div class="message-content">
												<div class="message-text">
													<p>2번 채팅!</p>
												</div>
											</div>
										</div>

										<!-- 채팅 시간 -->
										<div class="message-footer">
											<span class="extra-small text-muted">08:45 PM</span>
										</div>
									</div>
								</div>

								<!-- 날짜 -->
								<div class="message-divider">
									<small class="text-muted">1월 1일 수요일</small>
								</div>

								<!-- Message -->
								<div class="message message-out">
									<div class="message-inner">
										<div class="message-body">
											<div class="message-content">
												<div class="message-gallery">
													<div class="row gx-3">
														<div class="col">
															<img class="img-fluid rounded"
																src="resources/chat/assets/img/chat/1.jpg"
																data-action="zoom" alt="">
														</div>
														<div class="col">
															<img class="img-fluid rounded"
																src="resources/chat/assets/img/chat/2.jpg"
																data-action="zoom" alt="">
														</div>
														<div class="col">
															<img class="img-fluid rounded"
																src="resources/chat/assets/img/chat/3.jpg"
																data-action="zoom" alt="">
														</div>
													</div>
												</div>
											</div>
										</div>

										<!-- 채팅 시간 -->
										<div class="message-footer">
											<span class="extra-small text-muted">08:45 PM</span>
										</div>
									</div>
								</div>

								<!-- Message -->
								<div class="message message-out">
									<div class="message-inner">
										<div class="message-body">
											<div class="message-content">
												<div class="message-text">
													<p>내가 보내는 3번 채팅</p>
												</div>
											</div>
										</div>

										<!-- 채팅 시간 -->
										<div class="message-footer">
											<span class="extra-small text-muted">08:45 PM</span>
										</div>
									</div>
								</div>

								<!-- 날짜 -->
								<div class="message-divider">
									<small class="text-muted">1월 2일 목요일</small>
								</div>

								<!-- Message -->
								<div class="message">
									<div class="message-inner">
										<div class="message-body">
											<div class="message-content">
												<div class="message-text">
													<p>4번 채팅~</p>
												</div>
											</div>
										</div>

										<!-- 채팅 시간 -->
										<div class="message-footer">
											<span class="extra-small text-muted">08:45 PM</span>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>

					<!-- 채팅 footer -->
					<div
						class="chat-footer pb-3 pb-lg-7 position-absolute bottom-0 start-0">
						<!-- 이미지 미리보기 -->
						<div class="dz-preview bg-dark" id="dz-preview-row"
							data-horizontal-scroll=""></div>

						<!-- 채팅 폼 -->
						<form class="chat-form rounded-pill bg-dark" data-emoji-form="">
							<div class="row align-items-center gx-0">
								<div class="col-auto">
									<!-- 파일 전송 -->
									<a href="#"
										class="btn btn-icon btn-link text-body rounded-circle"
										id="dz-btn"> <svg xmlns="http://www.w3.org/2000/svg"
											width="24" height="24" viewBox="0 0 24 24" fill="none"
											stroke="currentColor" stroke-width="2" stroke-linecap="round"
											stroke-linejoin="round" class="feather feather-paperclip">
											<path
												d="M21.44 11.05l-9.19 9.19a6 6 0 0 1-8.49-8.49l9.19-9.19a4 4 0 0 1 5.66 5.66l-9.2 9.19a2 2 0 0 1-2.83-2.83l8.49-8.48"></path></svg>
									</a>
								</div>

								<!-- "메세지 보내기" -->
								<div class="col">
									<div class="input-group">
										<textarea class="form-control px-0" placeholder="메세지 보내기"
											rows="1" data-emoji-input="" data-autosize="true"></textarea>

										<!-- 이모지 -->
										<a href="#" class="input-group-text text-body pe-0"
											data-emoji-btn=""> <span class="icon icon-lg"> <svg
													xmlns="http://www.w3.org/2000/svg" width="24" height="24"
													viewBox="0 0 24 24" fill="none" stroke="currentColor"
													stroke-width="2" stroke-linecap="round"
													stroke-linejoin="round" class="feather feather-smile">
													<circle cx="12" cy="12" r="10"></circle>
													<path d="M8 14s1.5 2 4 2 4-2 4-2"></path>
													<line x1="9" y1="9" x2="9.01" y2="9"></line>
													<line x1="15" y1="9" x2="15.01" y2="9"></line></svg>
										</span>
										</a>
									</div>
								</div>

								<!-- 전송 버튼 -->
								<div class="col-auto">
									<button class="btn btn-icon btn-primary rounded-circle ms-5">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
											viewBox="0 0 24 24" fill="none" stroke="currentColor"
											stroke-width="2" stroke-linecap="round"
											stroke-linejoin="round" class="feather feather-send">
											<line x1="22" y1="2" x2="11" y2="13"></line>
											<polygon points="22 2 15 22 11 13 2 9 22 2"></polygon></svg>
									</button>
								</div>

							</div>
						</form>
					</div>
				</div>
			</div>
		</main>
	</div>
	
	<script>
	
	</script>
	
</body>
</html>