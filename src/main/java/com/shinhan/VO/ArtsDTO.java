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

// 17°³ Ä®·³ 
public class ArtsDTO {
	int art_id;
	int member_id;
	int mini_category_id;
	String art_title;
	int art_price;
	String art_description;
	String art_status;
	int art_like;
	int art_view;
	LocalDateTime art_post_date;
	String art_size;
	String art_thumbnail_image;
	String art_hovering_image;
	String art_image2;
	String art_image3;
	String art_image4;
	String art_image5;
}
