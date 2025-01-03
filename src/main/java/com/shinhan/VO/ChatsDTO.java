package com.shinhan.VO;

import java.sql.Timestamp;
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

public class ChatsDTO {
	int chat_id;
	int room_id;
	int member_id;
	String chat_message;
	String chat_image;
	Timestamp chat_time;
}
