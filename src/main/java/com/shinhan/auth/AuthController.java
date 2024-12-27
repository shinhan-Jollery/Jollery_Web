package com.shinhan.auth;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/auth")
public class AuthController {
	@GetMapping("mypage.do")
	public String mypage() {
		return "auth/mypage";
	}
	@GetMapping("mypageSeller.do")
	public String mypageSeller() {
		return "auth/mypageSeller";
	}
	@GetMapping("/signup")
	public String signup() {
		return "auth/signup";
	}
	@GetMapping("/login")
	public String login() {
		return "auth/login";
	}
	
	

}
