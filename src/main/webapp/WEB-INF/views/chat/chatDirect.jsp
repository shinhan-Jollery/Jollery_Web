<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="chatHeader.jsp"%>
<!DOCTYPE html>
<html>
<style>
.chat-messages {
	overflow: hidden;
	overflow-y: auto; /* 스크롤 활성화 */
	max-height: calc(100vh - 200px); /* 헤더 및 푸터를 제외한 높이 지정 */
}
</style>
<body>
	<div class="layout overflow-hidden">
		<!-- 채팅 영역 -->
		<main class="main is-visible" data-dropzone-area="">
			<div class="container h-100">
				<div class="d-flex flex-column h-100 position-relative">
					<!-- 채팅 header -->
					<div class="chat-header border-bottom py-4 py-lg-7">
						<div class="row align-items-center">
							<div class="row align-items-center">
								<div class="col-8">
									<h5 class="text-truncate mb-0">chatPartnerName</h5>
								</div>
							</div>
						</div>
					</div>

					<div class="chat-messages p-4 p-lg-6" id="chat-messages">
						<!-- 채팅 동적 생성 -->
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
									</a> <input id="upload-chat-img" class="d-none" type="file">
								</div>

								<!-- "메세지 보내기" -->
								<div class="col">
									<div class="input-group">
										<textarea id="messageInput" class="form-control px-0"
											placeholder="메세지 보내기" rows="1" data-emoji-input=""
											data-autosize="true"></textarea>

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
									<button class="btn btn-icon btn-primary rounded-circle ms-5"
										onclick="sendMessage()">
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
	// 파일 클립 버튼 클릭 이벤트
    document.getElementById('dz-btn').addEventListener('click', function(event) {
        event.preventDefault();
        document.getElementById('upload-chat-img').click();
    });
	</script>

	<script>
	let room_id = 8;
	let member_id = 28; //28, 19
	let stompClient = null;
	let lastMessageDate = null;
	
	enterChatRoom(room_id, member_id);
	
	// session member 가져오기
	function getSessionMember() {
	    return fetch('/getMember', {
	        method: 'GET',
	        headers: {
	            'Content-Type': 'application/json'
	        }
	    })
	    .then(response => {
	        return response.json();
	    })
	    .then(data => {
	        member_id = data.member_id;
	        member_name = data.member_name;
	    })
	}
	
	// 채팅방 입장
	function enterChatRoom(room_id, member_id) {
		const socket = new SockJS(`${path}/ws`);
		stompClient = Stomp.over(socket);
		
		stompClient.connect({}, function(frame){
			//채팅 이름 설정
			fetch(`${path}/chatRoom/getChatPartnerName/\${room_id}`)
	        .then(response => response.text())
	        .then(data => {
	        	const chatPartnerName = data;
	            document.querySelector('.col-8 h5').textContent = chatPartnerName;
	        });
			
			//채팅 내역 가져오기
			getChatLog(room_id);
			
			stompClient.subscribe(`/topic/room/\${room_id}`, function(
					message) {
				isSend = true;
				showMessage(JSON.parse(message.body), isSend);
			});
		});
	}
	
	// 메세지 보내기
	function sendMessage() {
		const messageInput = document.getElementById("messageInput");
		const messageContent = messageInput.value.trim();
        const fileInput = document.getElementById("fileInput");
        const files = fileInput.files;
        
        if (files.length > 3) {
            alert("최대 3개의 이미지만 전송할 수 있습니다.");
            return;
        }

	    // 이미지 파일 메세지 전송 처리
		if (files.length > 0) {
	        const formData = new FormData();
	        formData.append("file", file);

	        fetch(`${path}/chatRoom/uploadFile`, {
	            method: "POST",
	            body: formData,
	            headers: {
	                // processData: false는 jQuery에서 AJAX를 사용할 때 필요하지만,
	                // Fetch API에서는 `FormData`를 사용하면 자동으로 처리
	                // 'Content-Type': 'multipart/form-data' 는 FormData 사용 시 자동으로 설정되므로 지정할 필요 없음
	                'Accept': 'application/json'  // 응답을 JSON 형식으로 받을 때 설정
	            }
	        })
	        .then((response) => response.text())
	        .then((fileUrl) => {
	                const message = {
	                    room_id: room_id,
	                    member_id: member_id,
	                    chat_message: `사진: \${fileUrl}`,
	                    chat_time: new Date(),
	                    chat_image: fileUrl,
	                };
	                // 파일 전송 실패
					if (message.chat_image === "false") {
						alert("파일 업로드에 실패했습니다.");
					} else {
						stompClient.send(`/app/chat.send/\${room_id}`, {}, JSON.stringify(message));
					}
	                document.getElementById("fileInput").value = "";
	            });
	    } else if (messageContent !== "") {
	        // 일반 메시지 전송 처리
	        const message = {
	            room_id: room_id,
	            member_id: member_id,
	            chat_message: messageContent,
	            chat_time: new Date(),
	            chat_image: "",
	        };
	        stompClient.send(`/app/chat.send/\${room_id}`, {}, JSON.stringify(message));
	    }
		messageInput.value = "";
	}
	
	// 메세지 보여주기
	function showMessage(message, isSend) {
		const chatMessages = document.getElementById('chat-messages');
		
		const messageContainer = document.createElement('div');
        messageContainer.className = 'message';
        
        if (isSend) {
            messageContainer.classList.add('message-out');
        }
        
        const messageInner = document.createElement('div');
        messageInner.className = 'message-inner';

        const messageBody = document.createElement('div');
        messageBody.className = 'message-body';

        const messageContent = document.createElement('div');
        messageContent.className = 'message-content';
        
		if (message.chat_image) {
		    const messageGallery = document.createElement('div');
		    messageGallery.className = 'message-gallery';

		    const row = document.createElement('div');
		    row.className = 'row gx-3';

	        const col = document.createElement('div');
	        col.className = 'col';

	        const img = document.createElement('img');
	        img.className = 'img-fluid rounded';
	        img.src = `${path}/resources/upload/\${message.chat_image}`;
	        img.alt = '';

	        col.appendChild(img);
	        row.appendChild(col);

		    messageGallery.appendChild(row);
		    messageContent.appendChild(messageGallery);
	    } else {
	    	const messageText = document.createElement('div');
	        messageText.className = 'message-text';
	        messageText.innerHTML = `<p>\${message.chat_message}</p>`;
	        messageContent.appendChild(messageText);
	    }
		
        
        messageBody.appendChild(messageContent);
        messageInner.appendChild(messageBody);

        // 채팅 타임스탬프
        let formattedTime = "시간 정보 없음";
	    if (message.chat_time) {
	        const chatDate = new Date(message.chat_time);
	        if (!isNaN(chatDate.getTime())) {
	        	const timeOptions = {
	                    hour: 'numeric',
	                    minute: 'numeric',
	                    hour12: true,
	                };
	            formattedTime = chatDate.toLocaleString('ko-KR', timeOptions);
	        }
	    }
	    
        const messageFooter = document.createElement('div');
        messageFooter.className = 'message-footer';
        messageFooter.innerHTML = `<span class="extra-small text-muted">\${formattedTime}</span>`;

        messageInner.appendChild(messageFooter);
        messageContainer.appendChild(messageInner);
        chatMessages.appendChild(messageContainer);
        
        chatMessages.scrollTop = chatMessages.scrollHeight;
	}
	
	// 채팅 내역 가져오기
	function getChatLog(room_id) {
		//member_id = getSessionMemberId()
		
	    fetch(`${path}/chatRoom/chatLog/\${room_id}`)
	        .then(response => response.json())
	        .then(messages => {
	            messages.forEach(message => {
	            	addDateDivider(message)
	            	
	            	if (member_id === message.member_id){
	            		isSend = true;
	            	} else{
	            		isSend = false;
	            	}
	                showMessage(message, isSend);
	            });
	        });
	}
	
	// 날짜 구분
	function addDateDivider(message) {
		// 메시지 보낸 날짜 포맷팅
	    let formattedDate = "날짜 정보 없음";
	    if (message.chat_time) {
	        const chatDate = new Date(message.chat_time);
	        if (!isNaN(chatDate.getTime())) {
	                const dateOptions = {
	                    year: 'numeric',
	                    month: 'long',
	                    day: 'numeric',
	                    weekday: 'long',
	                };
	            formattedDate = chatDate.toLocaleString('ko-KR', dateOptions);
	        }
	    }
	    
	    const messageDate = formattedDate;
	    
	    if (lastMessageDate !== messageDate) {
	        // 마지막으로 표시된 날짜와 다르면 날짜 표시
	        const chatMessages = document.getElementById('chat-messages');

	        const divider = document.createElement('div');
	        divider.className = 'message-divider';
	        divider.innerHTML = `<small class="text-muted">\${messageDate}</small>`;
	
	        chatMessages.appendChild(divider);

	        // 마지막 메시지 날짜 업데이트
	        lastMessageDate = messageDate;
	    }
    }

	</script>

</body>
</html>