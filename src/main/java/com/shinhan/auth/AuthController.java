package com.shinhan.auth;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String signup(HttpSession session, HttpServletRequest request, Model model) {
		Integer userId = (Integer) request.getAttribute("userId");
		String memberName = (String) request.getAttribute("Member_name");
		model.addAttribute("userId", userId);
		model.addAttribute("memberName", memberName);
		return "auth/signup";
	}

	@GetMapping("/login")
	public String login() {
		return "auth/login";
	}
	
	@GetMapping("/pwsearch")
	public String pwsearch() {
		return "auth/pwsearch";
	}
	@GetMapping("/idsearch")
	public String idsearch() {
		return "auth/idsearch";
	}
}
