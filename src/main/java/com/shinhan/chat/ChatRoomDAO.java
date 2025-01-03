package com.shinhan.chat;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shinhan.VO.BlocksDTO;
import com.shinhan.VO.ChatRoomsDTO;
import com.shinhan.VO.MembersDTO;

@Repository
public class ChatRoomDAO {
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "com.shinhan.chatRoom.";
	
	public List<ChatRoomsDTO> getRoomListByMember(int member_id) {
		List<ChatRoomsDTO> roomList = sqlSession.selectList(namespace + "getRoomListByMember", member_id);
		return roomList;
    }

    public int createRoom(ChatRoomsDTO chatRoom) {
    	int result = sqlSession.insert(namespace + "createRoom", chatRoom);
    	return result;
    }
    
    public ChatRoomsDTO getChatRoomInfo(int room_id) {
		ChatRoomsDTO chatRoom = sqlSession.selectOne(namespace + "getChatRoomInfo", room_id);
		return chatRoom;
	}
    
    public String getNameByMemberId(int member_id) {
	    String memberName = sqlSession.selectOne(namespace + "getNameByMemberId", member_id);
	    return memberName;
	}
    
    public String getNameByArtId(int art_id) {
	    String memberName = sqlSession.selectOne(namespace + "getNameByArtId", art_id);
	    return memberName;
	}

	public int blockMember(BlocksDTO blocks) {
		int result = sqlSession.insert(namespace + "blockMember", blocks);
		return result;
	}

	public List<MembersDTO> getBlockList(int member_id) {
		List<MembersDTO> blockList= sqlSession.selectList(namespace + "getBlockListByMember", member_id);
		return blockList;
	}
    
}
