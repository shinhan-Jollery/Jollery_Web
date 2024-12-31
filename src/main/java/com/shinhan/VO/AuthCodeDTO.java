package com.shinhan.VO;

import java.sql.Date;
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
public class AuthCodeDTO {
	String auth_expired;
	String auth_code;
	Date member_birth;
}
