package com.shinhan.VO;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter 
// 7°³ Ä®·³
public class ChatsDTO {
	int chat_id;
	int member_id;
	int art_id;
	String chat_message1;
	String chat_message2;
	LocalDateTime chat_time;
	String chat_image;
}
