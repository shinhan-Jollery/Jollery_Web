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
public class AccountsDTO {
	String account_number;
	int member_id;
	String account_bank;
	LocalDateTime account_registor_date;
}