package com.shinhan.chat;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shinhan.VO.ChatsDTO;

@Repository
public class ChatDAO {
	@Autowired
	SqlSession sqlSession;

	String namespace = "com.shinhan.chat.";

	public void saveChat(ChatsDTO chat) {
		sqlSession.insert(namespace + "saveChat", chat);
	}

	public List<ChatsDTO> getChatLog(int room_id) {
		List<ChatsDTO> chatLog = sqlSession.selectList(namespace + "getChatLog", room_id);
		return chatLog;
	}

}
