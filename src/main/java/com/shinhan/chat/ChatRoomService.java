package com.shinhan.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.VO.BlocksDTO;
import com.shinhan.VO.ChatRoomsDTO;
import com.shinhan.VO.MembersDTO;

@Service
public class ChatRoomService {

	@Autowired
	ChatRoomDAO chatRoomDAO;

	public List<ChatRoomsDTO> getRoomListByMember(int member_id) {
		List<ChatRoomsDTO> roomList = chatRoomDAO.getRoomListByMember(member_id);
		return roomList;
	}

	public int createRoom(ChatRoomsDTO chatRoom) {
		int result = chatRoomDAO.createRoom(chatRoom);
		return result;
	}
	
	public ChatRoomsDTO getChatRoomInfo(int room_id) {
		ChatRoomsDTO chatRoom = chatRoomDAO.getChatRoomInfo(room_id);
		return chatRoom;
	}

	public String getNameByMemberId(int member_id) {
		String memberName = chatRoomDAO.getNameByMemberId(member_id);
		return memberName;
	}
	
	public String getNameByArtId(int art_id) {
		String memberName = chatRoomDAO.getNameByArtId(art_id);
		return memberName;
	}

	public int blockMember(int member_id, int block_id) {
		BlocksDTO blocks = BlocksDTO.builder().member_id(member_id).block_id(block_id).build();
		int result = chatRoomDAO.blockMember(blocks);
		return result;
	}

	public List<MembersDTO> getBlockList(int member_id) {
		List<MembersDTO> blockList = chatRoomDAO.getBlockList(member_id);
		return blockList;
	}

}
