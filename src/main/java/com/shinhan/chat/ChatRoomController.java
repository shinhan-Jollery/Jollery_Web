package com.shinhan.chat;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.shinhan.VO.ChatRoomsDTO;
import com.shinhan.VO.ChatsDTO;
import com.shinhan.VO.MembersDTO;

@RestController
@RequestMapping("/chatRoom")
public class ChatRoomController {

	// 유저 체크 기능

	@Autowired
	ChatService chatService;

	@Autowired
	ChatRoomService chatRoomService;

	// member_id 가져오기
	@GetMapping("/getMemberId")
	public String getMemberId(HttpServletRequest request, Model model) {
		String member_id = (String) request.getAttribute("userId");
		model.addAttribute("member_id", member_id);

		return member_id;
	}

	// 사용자의 채팅방 목록 조회
	@GetMapping("/roomList/{member_id}")
	public List<ChatRoomsDTO> getRoomList(@PathVariable int member_id) {
		List<ChatRoomsDTO> roomList = chatRoomService.getRoomListByMember(member_id);
		return roomList;
	}

	// 채팅방 생성
	// @PathVariable로 변경~~~
	@PostMapping("/createRoom")
	public String createRoom(@RequestBody ChatRoomsDTO chatRoom) {
		System.out.println(chatRoom);
		chatRoomService.createRoom(chatRoom);
		List<ChatRoomsDTO> roomList = chatRoomService.getRoomListByMember(chatRoom.getMember_id());
		return roomList.get(roomList.size() - 1).getRoom_id() + "";
	}

	// 채팅 내역 가져오기
	@GetMapping("/chatLog/{room_id}")
	public List<ChatsDTO> getChatLog(@PathVariable int room_id) {
		List<ChatsDTO> chatLog = chatService.getChatLog(room_id);
		return chatLog;
	}

	// 채팅 상대방 이름 가져오기
	@GetMapping(value = "/getChatPartnerName/{room_id}", produces = "application/json; charset=UTF-8")
	public String getChatPartnerName(@PathVariable int room_id, HttpServletRequest request) {
		//int sessionMember = (int)request.getAttribute("userId");
		int sessionMember = 28;
		ChatRoomsDTO chatRoom = chatRoomService.getChatRoomInfo(room_id);
		int member_id = chatRoom.getMember_id();
		int art_id = chatRoom.getArt_id();
		String partnerName = "";
		
		if(sessionMember == member_id) {
			partnerName = chatRoomService.getNameByArtId(art_id);
		} else {
			partnerName = chatRoomService.getNameByMemberId(member_id);
		}
		
		return partnerName;
	}

	// 이미지 파일 저장
	@PostMapping("/uploadFile")
	public String uploadImage(MultipartFile file, HttpSession session) {
		try {
			String uploadDir = session.getServletContext().getRealPath("./resources/upload");
			String fileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
			Path filePath = Paths.get(uploadDir, fileName);

			Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

			String fileUrl = fileName;
			return fileUrl;
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
	}

	// 사용자 차단
	@PostMapping("/block/{member_id}/{block_id}")
	public int blockUser(@PathVariable int member_id, @PathVariable int block_id) {
		int result = chatRoomService.blockMember(member_id, block_id);
		return result;
	}

	// 차단된 사용자 목록 조회
	@GetMapping("/block/{block_id}")
	public List<MembersDTO> getBlockList(@PathVariable int member_id) {
		List<MembersDTO> blockList = chatRoomService.getBlockList(member_id);
		return blockList;
	}
}
