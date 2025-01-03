package com.shinhan.chat;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.shinhan.VO.ChatsDTO;

@Controller
public class ChatController {

	@Autowired
	ChatService chatService;
	
	@Autowired
	ChatRoomService chatRoomService;
	
	@GetMapping("/chat/stomp")
	public String f1() {
		return "chat/chatExample";
	}
	
	@GetMapping("/chatting")
	public String f2() {
		return "chat/chatDirectCopy";
	}
	
	@GetMapping("/chatDirect")
	public String f3() {
		return "chat/chatDirect";
	}

	// 채팅방 입장
	@MessageMapping("/chat.addUser/{room_id}")
	@SendTo("/topic/room/{room_id}")
	public ChatsDTO addUser(ChatsDTO message, @DestinationVariable("room_id") int room_id) {
		message.setRoom_id(room_id);
		return message;
	}
	
	// 채팅 보내기
	@MessageMapping("/chat.send/{room_id}")
	@SendTo("/topic/room/{room_id}")
	public ChatsDTO send(ChatsDTO message, @DestinationVariable("room_id") int room_id ) {
		message.setRoom_id(room_id);
		chatService.saveChat(message);
		return message;
	}

}
