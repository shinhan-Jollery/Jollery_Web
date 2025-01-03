package com.shinhan.auth.mail;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.*;

import com.shinhan.VO.MembersDTO;
import com.shinhan.auth.AuthService;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/auth")
public class AuthMailRestController {

	@Autowired
	AuthMailService authMailService;
	@Autowired
	AuthService authService;

	// 이름과 아이디로 이메일 찾아서 인증 코드 발송
	@PostMapping("/sendMemberEmail")
	public Map<String, Object> sendMemberEmail(@RequestBody Map<String, String> request) {
		String member_name = request.get("membername");
		String member_login_ID = request.get("memberid");
		return authService.emailCheckerByLoginId_name(member_login_ID, member_name);
	}

	// 이메일 인증 코드 발송
	@PostMapping("/sendEmail")
	public Map<String, Object> sendEmail(@RequestBody Map<String, String> request) {
		String email = request.get("email");
		return authMailService.sendEmail(email);
	}

	// 인증 코드 확인
	@PostMapping("/verifyCode")
	public Map<String, Object> verifyCode(@RequestBody Map<String, String> request) {
		String email = request.get("email");
		String code = request.get("code");
		return authMailService.verifyCode(email, code);
	}

	// 인증 코드 확인
	@PostMapping("/MemberverifyCode")
	public Map<String, Object> MemberverifyCode(@RequestBody Map<String, String> request) {
		String member_name = request.get("membername");
		String member_login_ID = request.get("memberid");
		String code = request.get("code");
		return authService.verifyByLoginId_name(member_login_ID, member_name, code);
	}
}
