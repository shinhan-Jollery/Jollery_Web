<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Chat</title>
<c:set var="path" value="${pageContext.servletContext.contextPath}" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
.chat-date {
    text-align: center;
    color: #888;
    font-size: 14px;
    margin: 10px 0;
}
</style>
<body>
	<div>
		<label for="member_id">멤버 ID: </label> <input type="number"
			id="member_id" placeholder="멤버 ID를 입력하세요">
		<button onclick="getChatRooms()">채팅방 가져오기</button>
	</div>
	<div>
		<label for="roomSelect">채팅방 선택: </label> <select id="roomSelect">
			<option value="" disabled selected>채팅방을 선택하세요</option>
		</select>
		<button onclick="selectRoom()">채팅방 참여</button>
		<button onclick="createRoom()">새 채팅방 만들기</button>
	</div>
	<div id="chatBox"></div>
	<div class="container">
		<div id="chat"></div>
		<div class="input_Btn input_wrap">
			<input type="text" id="message" placeholder="대화 내용을 입력하세요."
				class="form-control" disabled>
			<button class="btn_send" onclick="sendMessage()">전송</button>
			<input type="file" id="fileInput" accept="image/*"> <label
				for="fileInput" class="btn btn-photo"></label>
		</div>
	</div>
	<script>
	let room_id = null;
	let member_id = null;
	let member_name = null;
	let stompClient = null;
	
	// 채팅방 생성
	function createRoom() {
		const chatRoom = {
				// 동일인물이 생성되지 못하게 만들기@
				
				//member_id와 art_id받아오기@
		        member_id : 28,
		        art_id : 8 
		    };

		    fetch(`${path}/chatRoom/createRoom`, {
		        method: 'POST',
		        headers: {
		            'Content-Type': 'application/json'
		        },
		        body: JSON.stringify(chatRoom)
		    })
		    .then(response => response.text());
		    
		    // 채팅방으로 이동 로직 추가@
		}
	
	
	// 특정 멤버의 채팅방 목록 가져오기
	function getChatRooms() {
	    member_id = document.getElementById("member_id").value;

	    fetch(`${path}/chatRoom/roomList/\${member_id}`)
	        .then(response => {
	            if (!response.ok) {
	                throw new Error("채팅방 목록을 가져오는 데 실패했습니다.");
	            }
	            return response.json();
	        })
	        .then(data => {
	            const roomSelect = document.getElementById("roomSelect");

	            roomSelect.innerHTML = '<option value="" disabled selected>채팅방을 선택하세요</option>';

	            if (data.length === 0) {
	                alert("해당 멤버의 채팅방이 없습니다.");
	            } else {
	                data.forEach(room => {
	                    const option = document.createElement("option");
	                    option.value = room.room_id;
	                    option.textContent = `채팅방 ID: \${room.room_id}, Art ID: \${room.art_id}`;
	                    roomSelect.appendChild(option);
	                });
	            }
	        });
	}
	
	// 채팅방 선택
	function selectRoom() {
		room_id = document.getElementById("roomSelect").value;
		if (room_id) {
			clearChat();
			enterChatRoom(room_id, member_id);
		} else {
			alert("채팅방을 선택하세요.");
		}
	}
	
	// 채팅 내역 지우기
	function clearChat() {
	    document.getElementById("chatBox").innerHTML = '';
	}
	
	// 채팅 내역 가져오기
	function getChatLog(room_id) {
	    fetch(`${path}/chatRoom/chatLog/\${room_id}`)
	        .then(response => response.json())
	        .then(messages => {
	            messages.forEach(message => {
	            	//1개씩 member_id 검사
	            	//내 채팅이었으면 오른쪽으로 css
	            	//상대 채팅이었으면 왼쪽으로 css
	                showMessage(message);
	            });
	        });
	}
	
	// 채팅방 입장
	function enterChatRoom(room_id, member_id) {
		const socket = new SockJS(`${path}/ws`);
		stompClient = Stomp.over(socket);
		
		stompClient.connect({}, function(frame){
			//채팅 이름 설정
			fetch(`${path}/chatRoom/getMemberName/\${member_id}`)
	        .then(response => response.text())
	        .then(data => {
	        	member_name = data;
	        });
			
			//채팅 내역 가져오기
			getChatLog(room_id);
			
			chatBox.scrollTop = chatBox.scrollHeight;
			$('#btnDisconnect').attr('disabled', false); //종료 버튼 활성화
			$('#message').attr('disabled', false); //메시지 입력 활성화	
			
	        const message = {
					room_id : room_id,
					member_id : member_id,
					chat_message : "",
					chat_time : new Date(),
					chat_image : ""
				};
	        
			stompClient.send(`/app/chat.addUser/\${room_id}`, {}, JSON
					.stringify(message));

			stompClient.subscribe(`/topic/room/\${room_id}`, function(
					message) {
				showMessage(JSON.parse(message.body));
			});
		});
	}

	function sendMessage() {
		const messageContent = document.getElementById("message").value;
	    const fileInput = document.getElementById("fileInput");
	    const file = fileInput.files[0];

	    // 이미지 파일 메세지 전송 처리
		if (file) {
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
	        		getKST();
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
	    } else if (messageContent.trim() !== "") {
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

	    document.getElementById("message").value = "";
	}
	
	let lastMessageDate = null;
	
	function showMessage(message) {
		const chatBox = document.getElementById("chatBox");
		const messageElement = document.createElement("p");
		
		// 메시지 시간 포맷팅
	    let formattedTime = "시간 정보 없음";
	    let formattedDate = "날짜 정보 없음";
	    if (message.chat_time) {
	        const chatDate = new Date(message.chat_time);
	        if (!isNaN(chatDate.getTime())) {
	        	const timeOptions = {
	                    hour: 'numeric',
	                    minute: 'numeric',
	                    hour12: true,
	                };
	                const dateOptions = {
	                    year: 'numeric',
	                    month: 'long',
	                    day: 'numeric',
	                    weekday: 'long',
	                };
	            formattedTime = chatDate.toLocaleString('ko-KR', timeOptions);
	            formattedDate = chatDate.toLocaleString('ko-KR', dateOptions);
	        }
	    }
	    
	    const messageDate = formattedDate; // 현재 메시지의 날짜
	    if (lastMessageDate !== messageDate) {
	        // 마지막으로 표시된 날짜와 다르면 날짜 표시
	        const dateElement = document.createElement("div");
	        dateElement.classList.add("chat-date");
	        dateElement.textContent = messageDate;
	        chatBox.appendChild(dateElement);

	        // 마지막 메시지 날짜 업데이트
	        lastMessageDate = messageDate;
	    }
        
        if (message.chat_image) {
	        const img = document.createElement("img");
	        img.src = `${path}/resources/upload/\${message.chat_image}`;
	        img.style.maxWidth = "200px";
	        const imgContainer = document.createElement("div");
	        imgContainer.textContent = `[\${member_name}] (\${formattedTime})`;
	        imgContainer.appendChild(img);
	        chatBox.appendChild(imgContainer);
	    } else {
	    	messageElement.textContent = `[\${member_name}] \${message.chat_message} (\${formattedTime})`;
	    	chatBox.appendChild(messageElement);
	    }
	}
	
	</script>
</body>
</html>