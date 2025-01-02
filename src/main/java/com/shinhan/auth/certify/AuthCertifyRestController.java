package com.shinhan.auth.certify;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shinhan.VO.MembersDTO;

@RestController
@RequestMapping("/auth")
public class AuthCertifyRestController {

	@Autowired
	private AuthCertifyService authService;

	@PutMapping(value = "/auth/certify", consumes = MediaType.APPLICATION_JSON_VALUE, produces = "text/plain;charset=utf-8")
	public String update(@RequestBody MembersDTO member) {
		int result = authService.updateService(member);

		return result > 0 ? "수정 성공" : "수정 실패";
	}

}
