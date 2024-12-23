package com.shinhan.VO;

import java.sql.Date;

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
// 9°³
public class ExhibitionsDTO {
	int exhibition_id;
	String exhibition_title;
	String exhibition_univ;
	String exhibition_major;
	String exhibition_location;
	String exhibition_link;
	String exhibition_poster;
	Date exhibition_start_date;
	Date exhibition_end_date;
}
