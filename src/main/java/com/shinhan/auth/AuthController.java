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
	// �굹以묒뿉 mypage�뒗 �뵲濡� 鍮쇨퀬 �븘�꽣濡� 濡쒓렇�씤 �긽�깭�씤�뜲
	// auth �젒洹� �븯硫� 留덉씠�럹�씠吏��굹 硫붿씤 �럹�씠吏�濡� �떎�뒘湲곌쾶 �빐�꽌 �씠以� 濡쒓렇�씤 留됯린
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
		int userId = (int) request.getAttribute("userId");
		String memberName = (String) request.getAttribute("Member_name");
		model.addAttribute("userId", userId);
		model.addAttribute("memberName", memberName);
		return "auth/signup";
	}

	@GetMapping("/login")
	public String login() {
		return "auth/login";
	}

}
