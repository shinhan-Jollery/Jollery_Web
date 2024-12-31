package com.shinhan.auth.mail;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.shinhan.VO.AuthCodeDTO;

@Service
public class AuthMailService {
	@Autowired
	AuthCodeService authCodeService;

	// 이메일 인증 코드 생성 및 발송
	public Map<String, Object> sendEmail(String email) {
		Map<String, Object> response = new HashMap<>();
		AuthCodeDTO authcode = new AuthCodeDTO();
		try {
			// 인증 코드 생성
			String verificationCode = VerificationService.generateVerificationCode(email);
			// 만료 시간 설정
			LocalDateTime now = LocalDateTime.now();
			authcode.setAuth_expired(now.plusMinutes(15));
			authcode.setAuth_code(verificationCode);
			authcode.setAuth_method(email);
			// 이메일 발송
			MailDispatcher.sendMail(email, "Jollery 이메일 인증", "인증 코드: " + verificationCode);
			authCodeService.insertAuthCode(authcode);
		} catch (MessagingException e) {
			e.printStackTrace();

		}
		response.put("message", "인증 코드를 발송했습니다.");
		response.put("status", "success");
		System.out.println("sendEmail"+response);
		return response;
	}

	// 인증 코드 확인
	public Map<String, Object> verifyCode(String email, String code) {
		Map<String, Object> response = new HashMap<>();
		AuthCodeDTO authcode = authCodeService.selectByAuth_Method(email);
		System.out.println(authcode);
		if (VerificationService.verifyCode(authcode, code)) {
			response.put("message", "인증 성공!");
			response.put("status", "success");
		} else {
			response.put("message", "인증 코드가 유효하지 않습니다.");
			response.put("status", "error");
		}
		return response;
	}
}