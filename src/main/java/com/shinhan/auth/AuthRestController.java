package com.shinhan.auth;
import java.util.Map;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/auth")
public class AuthRestController {

    @PostMapping(value = "/register", produces = "text/plain;charset=UTF-8")
    public String register(@RequestBody Map<String, Object> requestBody) {
        System.out.println("네 받았습니다");
        requestBody.forEach((key, value) -> System.out.println(key + ": " + value));
        return "{\"status\":\"success\"}";
    }	
}
