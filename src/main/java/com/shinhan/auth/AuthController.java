package com.shinhan.auth;

import java.util.Map;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
