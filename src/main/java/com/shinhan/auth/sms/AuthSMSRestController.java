package com.shinhan.auth.sms;

import java.util.Map;


import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.twilio.Twilio;
import com.twilio.rest.verify.v2.service.Verification;
import com.twilio.rest.verify.v2.service.VerificationCheck;

@RestController
@RequestMapping("/auth")
public class AuthSMSRestController {

//	 Find your Account Sid and Token at twilio.com/console



	@PostMapping(value = "/sms", produces = "application/json;charset=UTF-8")
	public ResponseEntity<String> SMSAuth(@RequestBody Map<String, Object> requestBody, HttpServletResponse response) {
		String number = Knumber((String) requestBody.get("phoneNumber"));
		System.out.println(number);
		Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
		Verification verification = Verification.creator(SERVICE_SID, number, "sms").create();

		System.out.println(verification.getSid());
		boolean isSuccess = !verification.getSid().isEmpty();

		System.out.println("sms");
		// 실행결과 반환
		if (isSuccess) {
			System.out.println("성공");
			return ResponseEntity.ok("{\"success\":true, \"message\":\"SMS sent successfully.\"}");
		} else {
			System.out.println("실패");
			return ResponseEntity.badRequest().body("{\"success\":false, \"message\":\"SMS sending failed.\"}");
		}
	}

	@PostMapping(value = "/otp", produces = "application/json;charset=UTF-8")
	public ResponseEntity<String> OTPAuth(@RequestBody Map<String, Object> requestBody, HttpServletResponse response) {
		System.out.println("otp process");
		String number = Knumber((String) requestBody.get("phoneNumber"));
		String code = (String) requestBody.get("code");
		System.out.println(code);
		Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
		VerificationCheck verificationCheck = VerificationCheck.creator(SERVICE_SID).setTo(number).setCode(code)
				.create();

		System.out.println("Verification Check SID: " + verificationCheck.getSid());
		System.out.println("Verification Status: " + verificationCheck.getStatus());

		// 상태가 approved이면 성공
		if ("approved".equals(verificationCheck.getStatus())) {
		    System.out.println("성공");
		    return ResponseEntity.ok("{\"status\":\"success\", \"message\":\"인증이 완료되었습니다.\"}");
		} else {
		    System.out.println("실패");
		    return ResponseEntity.badRequest().body("{\"status\":\"fail\", \"message\":\"인증번호가 다릅니다.\"}");
		}
	}

	public static String Knumber(String phoneNumber) {
		// 하이픈 제거
		String cleanedNumber = phoneNumber.replace("-", "");

		// 첫 번째 숫자가 '0'인지 확인하고 '+82'로 변경
		if (cleanedNumber.startsWith("0")) {
			cleanedNumber = "+82" + cleanedNumber.substring(1);
		}

		return cleanedNumber;
	}
}
