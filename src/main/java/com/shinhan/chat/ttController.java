package com.shinhan.chat;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shinhan.VO.ChatRoomsDTO;
import com.shinhan.VO.ExhibitionsDTO;

@Controller
public class ttController {

	@Autowired
	ChatRoomService chatRoomService;
	
	@GetMapping("/qwer")
	public String test() {
		return "chat/chatExample";
	}
	
	@GetMapping("/createRoom")
	public String name() {
		ChatRoomsDTO room = new ChatRoomsDTO();
		room.setMember_id(666);
		room.setArt_id(777);

		chatRoomService.createRoom(room);

		return "aa";
	}
}
