package com.shinhan.auth.mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/auth")
public class AuthMailRestController {

    @Autowired
    AuthMailService authMailService;
    
    // 이메일 인증 코드 발송
    @PostMapping("/sendMemberEmail")
    public Map<String, Object> sendMemberEmail(@RequestBody Map<String, String> request) {
        String email = request.get("email");
        return authMailService.sendEmail(email);
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
}
