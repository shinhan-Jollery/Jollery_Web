package com.shinhan.auth.mail;

import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/auth")
public class AuthMailRestController {

    // 이메일 인증 코드 발송
    @PostMapping("/sendEmail")
    public Map<String, Object> sendEmail(@RequestBody Map<String, String> request) {
        Map<String, Object> response = new HashMap<>();
        String email = request.get("email");

        try {
            // 인증 코드 생성
            String verificationCode = VerificationService.generateVerificationCode(email);

            // 이메일 발송
            MailDispatcher.sendMail(email, "Jollery 이메일 인증", "인증 코드: " + verificationCode);

            response.put("message", "인증 코드가 전송되었습니다.");
            response.put("status", "success");
        } catch (MessagingException e) {
            e.printStackTrace();
            response.put("message", "이메일 전송에 실패했습니다.");
            response.put("status", "error");
        }
        return response;
    }

    // 인증 코드 확인
    @PostMapping("/verifyCode")
    public Map<String, Object> verifyCode(@RequestBody Map<String, String> request) {
        Map<String, Object> response = new HashMap<>();
        String email = request.get("email");
        String code = request.get("code");
        System.out.println(code);
        if (VerificationService.verifyCode(email, code)) {
            response.put("message", "인증 성공!");
            response.put("status", "success");
        } else {
            response.put("message", "인증 코드가 유효하지 않습니다.");
            response.put("status", "error");
        }
        return response;
    }
    //ID 찾기 이메일 발송
    /*
    로그인 ID랑 이름 member에 있는거랑 같은지 확인 한 다음에
    
    */
    
}
