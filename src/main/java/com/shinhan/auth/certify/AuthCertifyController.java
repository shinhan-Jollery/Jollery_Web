package com.shinhan.auth.certify;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/auth")
public class AuthCertifyController {
	@GetMapping("certify")
	public String mypage() {
		return "auth/certify";
	}
}
