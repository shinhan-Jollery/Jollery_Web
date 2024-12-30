package com.shinhan.auth.sms;


import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
@RequestMapping("/auth")
public class AuthSMSRestController {

	public static final String ACCOUNT_SID = "";
	public static final String AUTH_TOKEN ="";
	public static final String SERVICE_SID = "";


    private final RestTemplate restTemplate = new RestTemplate();

    // SMS 인증 요청
    @PostMapping(value = "/sms", produces = "application/json;charset=UTF-8")
    public ResponseEntity<String> SMSAuth(@RequestBody Map<String, Object> requestBody) {
        String phoneNumber = Knumber((String) requestBody.get("phoneNumber"));
        System.out.println("Sending SMS to: " + phoneNumber);

        String url = "https://verify.twilio.com/v2/Services/" + SERVICE_SID + "/Verifications";

        // 요청 본문 생성 (MultiValueMap 사용) 이해 못함 X 다시 봐야함
        MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
        body.add("To", phoneNumber);
        body.add("Channel", "sms");

        HttpHeaders headers = createHeaders();
        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(body, headers);

        try {
            ResponseEntity<String> response = restTemplate.postForEntity(url, request, String.class);
            System.out.println("Response: " + response.getBody());
            return ResponseEntity.ok("{\"success\":true, \"message\":\"SMS sent successfully.\"}");
        } catch (Exception e) {
            System.err.println("Error sending SMS: " + e.getMessage());
            return ResponseEntity.badRequest().body("{\"success\":false, \"message\":\"SMS sending failed.\"}");
        }
    }

    // OTP 검증 요청
    @PostMapping(value = "/otp", produces = "application/json;charset=UTF-8")
    public ResponseEntity<String> OTPAuth(@RequestBody Map<String, Object> requestBody) {
        String phoneNumber = Knumber((String) requestBody.get("phoneNumber"));
        String code = (String) requestBody.get("code");
        System.out.println("Verifying OTP for: " + phoneNumber);

        String url = "https://verify.twilio.com/v2/Services/" + SERVICE_SID + "/VerificationCheck";

        // 요청 본문 생성 (MultiValueMap 사용)이해 못함 다시 살펴보
        MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
        body.add("To", phoneNumber);
        body.add("Code", code);

        HttpHeaders headers = createHeaders();
        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(body, headers);

        try {
            ResponseEntity<String> response = restTemplate.postForEntity(url, request, String.class);
            System.out.println("Response: " + response.getBody());
            return ResponseEntity.ok("{\"status\":\"success\", \"message\":\"OTP verified successfully.\"}");
            
        } catch (Exception e) {
            System.err.println("Error verifying OTP: " + e.getMessage());
            return ResponseEntity.badRequest().body("{\"status\":\"fail\", \"message\":\"OTP verification failed.\"}");
        }
    }

    // Authorization 헤더
    private HttpHeaders createHeaders() {
        HttpHeaders headers = new HttpHeaders();
        headers.setBasicAuth(ACCOUNT_SID, AUTH_TOKEN);
        headers.add("Content-Type", "application/x-www-form-urlencoded");
        return headers;
    }

    // 전화번호 포맷
    public static String Knumber(String phoneNumber) {
        String cleanedNumber = phoneNumber.replace("-", "");
        if (cleanedNumber.startsWith("0")) {
            cleanedNumber = "+82" + cleanedNumber.substring(1);
        }
        return cleanedNumber;
    }
}
