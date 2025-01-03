package com.shinhan.auth.mail;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shinhan.VO.MembersDTO;
import com.shinhan.auth.AuthInfoUpdateService;
import com.shinhan.auth.AuthService;

@RestController
@RequestMapping("/auth")
public class AuthMailRestController {
	@Autowired
	AuthInfoUpdateService authInfoUpdateService;
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
	// 이름으로 확인 후 메일 발송
	//서비스로 분리해야해! 일단 미루기
	@PostMapping("/sendMemberEmailbyName")
	public Map<String, Object> sendMemberEmailbyName(@RequestBody Map<String, String> request) {
		String email = request.get("email");
		String member_name = request.get("membername");
		MembersDTO member = authService.getMemberPWByEmail(email);
		if (member==null) {
			Map<String, Object> response = new HashMap<>();
			response.put("message", "email이 유효하지 않습니다.");
			response.put("status", "error");
			return response;
		}
		if(member.getMember_name().equals(member_name)) {
			return authMailService.sendEmail(email);
		} else {
			Map<String, Object> response = new HashMap<>();
			response.put("message", "이름과 email이 일치하지 않습니다.");
			response.put("status", "error");
			return response;
		}
	}

	// 인증 코드 확인
	@PostMapping("/verifyCode")
	public Map<String, Object> verifyCode(@RequestBody Map<String, String> request) {
		String email = request.get("email");
		String code = request.get("code");
		return authMailService.verifyCode(email, code);
	}
	// 인증 코드 확인
	 @PostMapping("/verifyandSendId")
	    public Map<String, Object> verifyandSendId(@RequestBody Map<String, String> request) {
	        String memberName = request.get("membername");
	        String email = request.get("email");
	        String code = request.get("code");

	        // 서비스 호출
	        return authMailService.verifyAndSendId(memberName, email, code);
	    }

	// 인증 코드 확인
	@PostMapping("/MemberverifyCode")
	public Map<String, Object> MemberverifyCode(@RequestBody Map<String, String> request) {
		String member_name = request.get("membername");
		String member_login_ID = request.get("memberid");
		String code = request.get("code");
		return authService.verifyByLoginId_name(member_login_ID, member_name, code);
	}
	// 인증 코드 확인

    @PostMapping("/changePW")
    public Map<String, Object> changePW(@RequestBody Map<String, String> request) {
        String memberpassword = request.get("memberpassword");
        String uuid = request.get("uuid");
        // 서비스 호출
        return authService.changePassword(memberpassword, uuid);
    }
}