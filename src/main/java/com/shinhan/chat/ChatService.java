package com.shinhan.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.VO.ChatsDTO;

@Service
public class ChatService {
	
	@Autowired
	ChatDAO chatDAO;
	
	public void saveChat(ChatsDTO chat) {
        chatDAO.saveChat(chat);
    }
	
	public List<ChatsDTO> getChatLog(int room_id) {
        return chatDAO.getChatLog(room_id);
    }
	
}
