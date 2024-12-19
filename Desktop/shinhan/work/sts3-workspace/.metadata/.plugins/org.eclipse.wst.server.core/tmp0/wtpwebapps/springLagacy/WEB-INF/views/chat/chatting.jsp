<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<c:set var="path" value="${pageContext.servletContext.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/css/chatting.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="EnterOut_div">
			<input type="text" id="user" class="form-control" placeholder="유저명">
			<button type="button" class="btn btn-default enter_Btn"
				id="btnConnect">연결</button>
			<button type="button" class="btn btn-default out_Btn"
				id="btnDisconnect" disabled>종료</button>
		</div>
		<div id="chat"></div>
			<div class="input_Btn input_wrap">
				<input type="text" name="msg" id="msg" placeholder="대화 내용을 입력하세요."
					class="form-control" disabled>
				<button class="btn_send">전송</button>
			</div>
	</div>
	<script>
		var ws;
		$('#btnConnect').click(function() {         
			if ($('#user').val().trim() == ''){
				alert('유저명을 입력하세요.');$('#user').focus();
			}else{
				
			ws = new WebSocket("ws://" + location.host + "/${path}/chatserver");
			ws.onopen = function(evt) { 
				ws.send('1#' + $('#user').val() + '#');
				// 현재 사용자(나)가 입장했다고 서버에게 통지(유저명 전달)
				// 본인은 1# +user로 지정 -> 웹소켓 서버에서 상대방은 2#으로 지정했음. 
				// 따라서 1#인지, 2#인지에 따라, 나와 상대방의 메시지를 구분가능
				$('#user').attr('readonly', true); //이미 접속한 유저명 수정 못하게 막기
				$('#btnConnect').attr('disabled', true); //연결 되었으니 연결 버튼 비활성화
				$('#btnDisconnect').attr('disabled', false); //종료 버튼 활성화
				$('#msg').attr('disabled', false); //메시지 입력 활성화
			};
			
			ws.onmessage = function(evt) {
				let no = evt.data.substring(0, 1); // 웹소켓에서는 JSON 형식으로 통신
				//evt_data =  MessageEvent {isTrusted: true, data: '1#작성자#', 
				// origin: 'ws://localhost:9090/myapp', lastEventId: '', source: null, …} 형태로 들어옴'
				let user = evt.data.substring(2, evt.data.length - 1);
				let index = evt.data.indexOf("#", 2);
				let txt = evt.data.substring(index + 1);

				if (no == '1') {
					print(user, txt);
				} else if (no == '2') {
					index = evt.data.indexOf(":", 2);
					user = evt.data.substring(2, index);
					txt = evt.data.substring(index + 1);
					printOther(user, txt);
				}
			};

			ws.onclose = function(evt) {
				console.log('소켓이 닫힙니다.');
			};

			ws.onerror = function(evt) {
				console.log(evt.data);
			};
		 } 
		});

		// 메세지 전송 및 아이디
		
		function print(user, txt) {
			if (txt.trim() =='') return;
			let temp = '';
			temp += '<div class="message_container">';
			temp += ' <span style="font-size:12px;color:#777;margin-bottom: 3px;">'
					+ new Date().toLocaleTimeString([], {
						hour : '2-digit',
						minute : '2-digit'
					}) + '</span>';
			temp += '<div class="message_background">';
			temp += '<div class="message">';
			temp += txt;
			temp += '</div>';
			temp += '</div>';
			temp += '</div>';
			$('#chat').append(temp);
		}

		// 다른 client 접속		
		var isFirstMessage = {}; // 각 사용자가 처음으로 메시지를 보냈는지 저장하는 객체
		function printOther(user, txt) {
			if (txt.trim() == '') {
				// 메시지 본문이 빈 문자열인 경우 아무 것도 하지 않음
				return;
			}
			let temp = '';
			if (!isFirstMessage[user]) { // 사용자가 처음으로 메시지를 보냈을 때만 입장 메시지를 출력
				temp += '<div class="coming_user">';
				temp += "'" + user + "' 이(가) 접속했습니다.";
				temp += '</div>';
				isFirstMessage[user] = true;
			}
			temp += '<div class="yourChat_message">';
			temp += '🍟' + user;
			temp += '<div class="your_message_background">';
			temp += '<div class="your_message">' + txt + '</div>';
			temp += ' <span style="font-size:12px;color:#777;margin-bottom: 3px;">'
					+ new Date().toLocaleTimeString([], {
						hour : '2-digit',
						minute : '2-digit'
					}) + '</span>';
			temp += '</div>';
			temp += '</div>';

			$('#chat').append(temp);
		}

		$('#user').keydown(function() {
			if (event.keyCode == 13) {
				$('#btnConnect').click();
			}
		});

		$(".btn_send").on("click", function() {
			let _msg =  $("#msg").val();
			//서버에게 메시지 전달
			//2#유저명#메시지
			ws.send('2#' + $('#user').val() + '#' + _msg); //서버에게
			print($('#user').val(), _msg); //본인 대화창에
			$('#msg').val('');
			$('#msg').focus();
		});
		
		$('#msg').keydown(function() {
			if (event.keyCode == 13) {
				$(".btn_send").trigger("click");
			}
		});

		$('#btnDisconnect').click(function() {
			ws.close();

			$('#user').attr('readonly', false);
			$('#user').val('');

			$('#btnConnect').attr('disabled', false);
			$('#btnDisconnect').attr('disabled', true);

			$('#msg').val('');
			$('#msg').attr('disabled', true);
		});
		
		function rand(min, max) {
			return Math.floor(Math.random() * (max - min + 1)) + min;
		}

		$(function() {
			var aa = rand(1,15);
			$("#chat").css({"background-image": `url("${path}/resources/images/chat_bg\${aa}.jpg")`});
		});
	</script>
</body>
</html>
